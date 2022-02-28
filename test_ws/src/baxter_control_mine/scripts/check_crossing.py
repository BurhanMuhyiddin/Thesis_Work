#!/usr/bin/env python

import rospy
from cv_bridge import CvBridge
from image_geometry import PinholeCameraModel
import tf2_ros
import tf2_geometry_msgs

import numpy as np
import cv2

from sensor_msgs.msg import CameraInfo
from sensor_msgs.msg import Image
from geometry_msgs.msg import PointStamped

from baxter_msgs_mine.srv import CheckCrossing, CheckCrossingResponse

class CheckCrossingSrv:
    def __init__(self):
        rospy.init_node('cross_checking_server')

        self.bridge = CvBridge()

        self.process_img_server = rospy.Service('/check_crossing', CheckCrossing, self.check_crossing_clb)

        self.left_rgb_img = None
        self.right_rgb_img = None

        self.obj_crds = {}

        self.cam_model = PinholeCameraModel()
        self.left_cam_info = None
        self.right_cam_info = None
        self.uv = None

        self.left_cam_info_sub = rospy.Subscriber("/cameras/left_hand_camera/camera_info", CameraInfo, self.left_cam_info_clb)
        self.right_cam_info_sub = rospy.Subscriber("/cameras/right_hand_camera/camera_info", CameraInfo, self.right_cam_info_clb)

        self.image_sub_left = rospy.Subscriber("/cameras/left_hand_camera/image",Image,self.image_clb_left)
        self.image_sub_right = rospy.Subscriber("/cameras/right_hand_camera/image",Image,self.image_clb_right)

        self.red_range = {'low_H' : 0, 'low_S' : 65, 'low_V' : 0, 'high_H' : 18, 'high_S' : 255, 'high_V' : 255}
        self.blu_range = {'low_H' : 104, 'low_S' : 66, 'low_V' : 0, 'high_H' : 135, 'high_S' : 255, 'high_V' : 255}
        self.yel_range = {'low_H' : 20, 'low_S' : 69, 'low_V' : 0, 'high_H' : 29, 'high_S' : 255, 'high_V' : 255}

        self.tf_buffer = tf2_ros.Buffer(rospy.Duration(100.0))
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)
        # self.sf = "left_hand_camera"
        self.sf = ""
        self.tf = "base"
        
        self.table_dist = -0.1538229

        rospy.loginfo("ProcessImage server has been initiated...")

    def left_cam_info_clb(self, data):
        self.left_cam_info = data

    def right_cam_info_clb(self, data):
        self.right_cam_info = data

    def image_clb_left(self, data):
        self.left_rgb_img = data

    def image_clb_right(self, data):
        self.right_rgb_img = data

    def get_object_coordinates(self, clr, limb):
        if (clr in self.obj_crds):
            return False

        if (limb == "left"):
            while self.left_rgb_img == None:
                continue
            cv_image = self.bridge.imgmsg_to_cv2(self.left_rgb_img, "bgr8")
        else:
            while self.right_rgb_img == None:
                continue
            cv_image = self.bridge.imgmsg_to_cv2(self.right_rgb_img, "bgr8")

        hsv_img  = cv2.cvtColor(cv_image, cv2.COLOR_BGR2HSV)
        hsv_img  = cv2.GaussianBlur(hsv_img, (5, 5), 0)

        gray_img = cv2.cvtColor(hsv_img, cv2.COLOR_BGR2GRAY)
        gray_img = cv2.GaussianBlur(gray_img, (5, 5), 0)
        _, thresholded_img_otsu = cv2.threshold(gray_img,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
        thresholded_img_otsu = cv2.bitwise_not(thresholded_img_otsu)

        if clr == 'blue':
            thresholded_img = cv2.inRange(hsv_img, (self.blu_range['low_H'], self.blu_range['low_S'], self.blu_range['low_V']), 
                                                    (self.blu_range['high_H'], self.blu_range['high_S'], self.blu_range['high_V']))
        else:
            thresholded_img = cv2.inRange(hsv_img, (self.yel_range['low_H'], self.yel_range['low_S'], self.yel_range['low_V']), 
                                                    (self.yel_range['high_H'], self.yel_range['high_S'], self.yel_range['high_V']))

        kernel = cv2.getStructuringElement(cv2.MORPH_RECT,(3,3))

        thresholded_img = cv2.morphologyEx(thresholded_img, cv2.MORPH_OPEN, kernel)
        thresholded_img = cv2.dilate(thresholded_img, kernel, iterations=3)
        thresholded_img = cv2.bitwise_not(thresholded_img)
        thresholded_img = cv2.bitwise_or(thresholded_img,thresholded_img_otsu)

        _, contours, _ = cv2.findContours(image=thresholded_img, mode=cv2.RETR_TREE, method=cv2.CHAIN_APPROX_NONE)

        # rospy.loginfo(len(contours))

        for contour in contours:
            if clr == 'blue':
                min_area = 200
                max_area = 3000
                # max_arcLng = 99999999
            else:
                min_area = 200
                max_area = 5000
                # max_arcLng = 99999999

            if cv2.contourArea(contour) > min_area and cv2.contourArea(contour) < max_area:
                M = cv2.moments(contour)
                if M['m00'] != 0:
                    cx = M['m10'] / M['m00']
                    cy = M['m01'] / M['m00']

                    self.uv = (cx, cy)

                    break

        if self.uv == None:
            return False

        if limb == "left":
            while (self.left_cam_info == None):
                continue
            self.cam_model.fromCameraInfo(self.left_cam_info)
        else:
            while (self.right_cam_info == None):
                continue
            self.cam_model.fromCameraInfo(self.right_cam_info)

        self.sf = limb + "_hand_camera"

        while not rospy.is_shutdown():
            try:
                transform = self.tf_buffer.lookup_transform(self.tf, self.sf, rospy.Time(0))
                depth = abs(transform.transform.translation.z - self.table_dist)

                uv_rect = self.cam_model.rectifyPoint(self.uv)
                self.uv = None # don't for get to reset

                u = uv_rect[0]
                v = uv_rect[1]

                cx = self.cam_model.cx()
                cy = self.cam_model.cy()
                fx = self.cam_model.fx()
                fy = self.cam_model.fy()

                x = depth * (u - cx) / fx
                y = depth * (v - cy) / fy
                z = depth

                ps = PointStamped()
                ps.header.stamp = rospy.Time(0)
                ps.header.frame_id = self.sf
                ps.point.x = x
                ps.point.y = y
                ps.point.z = z

                point_transformed = tf2_geometry_msgs.do_transform_point(ps, transform)

                self.obj_crds[clr] = (point_transformed.point.x, point_transformed.point.y)

                return True

            except(tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
                continue

    def check_crossing_clb(self, req):
        print(self.get_object_coordinates("blue", "left"))
        print(self.get_object_coordinates("yellow", "left"))
        print(self.get_object_coordinates("blue", "right"))
        print(self.get_object_coordinates("yellow", "right"))

        blueY = self.obj_crds['blue'][1]
        yellowY = self.obj_crds['yellow'][1]

        self.obj_crds.clear() # don't for get to reset

        res = yellowY - blueY

        if res > 0:
            return CheckCrossingResponse(limb = "left", success = True)
        else:
            return CheckCrossingResponse(limb = "right", success = True)

def main():
    pi_server = CheckCrossingSrv()

    rospy.spin()

if __name__ == '__main__':
    main()
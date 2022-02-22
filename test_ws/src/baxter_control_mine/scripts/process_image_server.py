#!/usr/bin/env python

import rospy
from cv_bridge import CvBridge
from image_geometry import PinholeCameraModel
import tf2_ros
import tf2_geometry_msgs

import numpy as np
import cv2

from sensor_msgs.msg import CameraInfo
from geometry_msgs.msg import PointStamped

from baxter_msgs_mine.srv import ProcessImage, ProcessImageResponse

class ProcessImageSrv:
    def __init__(self):
        rospy.init_node('process_image_server')

        self.bridge = CvBridge()

        self.process_img_server = rospy.Service('/process_img', ProcessImage, self.process_image_clb)

        self.cam_model = PinholeCameraModel()
        self.left_cam_info = None
        self.right_cam_info = None
        self.uv = None

        self.left_cam_info_sub = rospy.Subscriber("/cameras/left_hand_camera/camera_info", CameraInfo, self.left_cam_info_clb)
        self.right_cam_info_sub = rospy.Subscriber("/cameras/right_hand_camera/camera_info", CameraInfo, self.right_cam_info_clb)

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

    def process_image_clb(self, req):
        cv_image = self.bridge.imgmsg_to_cv2(req.img, "bgr8")
        hsv_img = cv2.cvtColor(cv_image, cv2.COLOR_BGR2HSV)
        hsv_img = cv2.GaussianBlur(hsv_img, (5, 5), 0)

        clr = req.color

        rospy.loginfo(clr)

        if clr == 'red':
            thresholded_img = cv2.inRange(hsv_img, (self.red_range['low_H'], self.red_range['low_S'], self.red_range['low_V']), 
                                                    (self.red_range['high_H'], self.red_range['high_S'], self.red_range['high_V']))
        elif clr == 'blue':
            thresholded_img = cv2.inRange(hsv_img, (self.blu_range['low_H'], self.blu_range['low_S'], self.blu_range['low_V']), 
                                                    (self.blu_range['high_H'], self.blu_range['high_S'], self.blu_range['high_V']))
        elif clr == 'yellow':
            thresholded_img = cv2.inRange(hsv_img, (self.yel_range['low_H'], self.yel_range['low_S'], self.yel_range['low_V']), 
                                                    (self.yel_range['high_H'], self.yel_range['high_S'], self.yel_range['high_V']))
        
        gray_img = cv2.cvtColor(hsv_img, cv2.COLOR_BGR2GRAY)
        gray_img = cv2.GaussianBlur(gray_img, (5, 5), 0)
        _, thresholded_img_otsu = cv2.threshold(gray_img,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
        thresholded_img_otsu = cv2.bitwise_not(thresholded_img_otsu)

        kernel = cv2.getStructuringElement(cv2.MORPH_RECT,(3,3))

        thresholded_img = cv2.morphologyEx(thresholded_img, cv2.MORPH_OPEN, kernel)
        thresholded_img = cv2.dilate(thresholded_img, kernel, iterations=3)
        thresholded_img = cv2.bitwise_not(thresholded_img)
        thresholded_img = cv2.bitwise_or(thresholded_img,thresholded_img_otsu)

        _, contours, _ = cv2.findContours(image=thresholded_img, mode=cv2.RETR_TREE, method=cv2.CHAIN_APPROX_NONE)

        rospy.loginfo(len(contours))

        extracted_features = []

        for contour in contours:
            if clr == 'red':
                min_area = 200
                max_area = 3000
                max_arcLng = 99999999
            elif clr == 'blue':
                min_area = 200
                max_area = 3000
                max_arcLng = 99999999
            elif clr == 'yellow':
                min_area = 200
                max_area = 5000
                max_arcLng = 99999999

            rospy.loginfo(cv2.contourArea(contour))

            if cv2.contourArea(contour) > min_area and cv2.contourArea(contour) < max_area: #and cv2.arcLength(contour,True) < max_arcLng:
                # cv2.drawContours(cv_image, [contour], -1, (255, 255, 255), thickness=cv2.FILLED)
                # cv2.imwrite('/home/lar/Desktop/lena_opencv_red.jpg', cv_image)
                M = cv2.moments(contour)
                if M['m00'] != 0:
                    cx = M['m10'] / M['m00']
                    cy = M['m01'] / M['m00']

                    self.uv = (cx, cy)
                    break

        # u = cx, v = cy
        # convert these to real world coordinates

        if req.limb == "left":
            while (self.left_cam_info == None):
                continue
            self.cam_model.fromCameraInfo(self.left_cam_info)
        else:
            while (self.right_cam_info == None):
                continue
            self.cam_model.fromCameraInfo(self.right_cam_info)

        self.sf = req.limb + "_hand_camera"

        rospy.loginfo(self.uv)

        while not rospy.is_shutdown():
            try:
                transform = self.tf_buffer.lookup_transform(self.tf, self.sf, rospy.Time(0))
                depth = abs(transform.transform.translation.z - self.table_dist)

                uv_rect = self.cam_model.rectifyPoint(self.uv)

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

                extracted_features.append(point_transformed.point.x)
                extracted_features.append(point_transformed.point.y)

                break

            except(tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
                continue

        return ProcessImageResponse(extracted_features=extracted_features, success=True)

def main():
    pi_server = ProcessImageSrv()

    rospy.spin()

if __name__ == '__main__':
    main()
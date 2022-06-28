#!/usr/bin/env python2.7

import rospy
from cv_bridge import CvBridge
from image_geometry import PinholeCameraModel
import tf2_ros
import tf2_geometry_msgs

import cv2
import numpy as np
import threading

from sensor_msgs.msg import CameraInfo
from sensor_msgs.msg import Image

from geometry_msgs.msg import PointStamped

from baxter_msgs_mine.srv import ProcessImage, ProcessImageResponse

class ProcessImageSrv:
    def __init__(self):
        rospy.init_node('process_image_server')

        self.bridge = CvBridge()

        self.process_img_server = rospy.Service('/process_img', ProcessImage, self.process_image_clb)

        self.left_cam_info = None
        self.right_cam_info = None
        self.uv = {}

        # self.cond_left = threading.Condition()
        # self.cond_right = threading.Condition()
        self.left_img = None
        self.right_img = None
        self.img = None

        self.image_sub_left = rospy.Subscriber("/cameras/left_hand_camera/image",Image,self.image_clb_left)
        self.image_sub_right = rospy.Subscriber("/cameras/right_hand_camera/image",Image,self.image_clb_right)
        self.left_cam_info_sub = rospy.Subscriber("/cameras/left_hand_camera/camera_info", CameraInfo, self.left_cam_info_clb)
        self.right_cam_info_sub = rospy.Subscriber("/cameras/right_hand_camera/camera_info", CameraInfo, self.right_cam_info_clb)

        self.processed_image_pub = rospy.Publisher("processed_image", Image, queue_size=10)

        self.red_range = {'low_H' : 0, 'low_S' : 65, 'low_V' : 0, 'high_H' : 18, 'high_S' : 255, 'high_V' : 255}
        self.blu_range = {'low_H' : 104, 'low_S' : 66, 'low_V' : 0, 'high_H' : 135, 'high_S' : 255, 'high_V' : 255}
        self.yel_range = {'low_H' : 20, 'low_S' : 69, 'low_V' : 0, 'high_H' : 29, 'high_S' : 255, 'high_V' : 255}

        self.tf_buffer = tf2_ros.Buffer(rospy.Duration(100.0))
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)

        self.sf = ""
        self.tf = "base"
        
        self.table_dist = -0.1538229

        rospy.loginfo("ProcessImage server has been initiated...")

    def image_clb_left(self, data):
        self.left_img = self.bridge.imgmsg_to_cv2(data, "bgr8")
        # self.cond_left.notify()

    def image_clb_right(self, data):
        self.right_img = self.bridge.imgmsg_to_cv2(data, "bgr8")
        # self.cond_right.notify()

    def left_cam_info_clb(self, data):
        self.left_cam_info = data

    def right_cam_info_clb(self, data):
        self.right_cam_info = data

    def get_obj_coordinates(self, hsv_img, clr):

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

        for contour in contours:
            if clr == 'red':
                min_area = 200
                max_area = 3000
            elif clr == 'blue':
                min_area = 200
                max_area = 3000
            elif clr == 'yellow':
                min_area = 200
                max_area = 5000

            if cv2.contourArea(contour) > min_area and cv2.contourArea(contour) < max_area:
                cv2.drawContours(self.img, [contour], -1, (255, 255, 255), thickness=cv2.FILLED)

                # in order to debug, publish the processed image
                image_message = self.bridge.cv2_to_imgmsg(self.img, encoding="bgr8")
                self.processed_image_pub.publish(image_message)

                # cv2.imwrite('/home/lar/Desktop/lena_opencv_red.jpg', cv_image)
                M = cv2.moments(contour)
                if M['m00'] != 0:
                    cx = M['m10'] / M['m00']
                    cy = M['m01'] / M['m00']

                    SEPERATION_THRESHOLD = self.img.shape[1] // 2

                    if cx <= SEPERATION_THRESHOLD:
                        camera_limb = 'left'
                    else:
                        cx = cx - SEPERATION_THRESHOLD
                        camera_limb = 'right'

                    self.uv[clr] = (cx, cy, camera_limb)

                    break

    def process_image_clb(self, req):
        # concatinate images from left and right
        self.img = np.concatenate((self.left_img, self.right_img), axis=1)

        # get hsv image
        hsv_img = cv2.cvtColor(self.img, cv2.COLOR_BGR2HSV)
        hsv_img = cv2.GaussianBlur(hsv_img, (5, 5), 0)

        # detect colors in each image and get coordinates
        self.get_obj_coordinates(hsv_img, 'red')
        self.get_obj_coordinates(hsv_img, 'blue')
        self.get_obj_coordinates(hsv_img, 'yellow')

        extracted_features = []
        for key in self.uv:
            uv_ = (self.uv[key][0], self.uv[key][1])
            limb_camera = self.uv[key][2]

            # u = cx, v = cy
            # convert these to real world coordinates
            cam_model = PinholeCameraModel()
            if limb_camera == "left":
                self.left_cam_info = None
                while (self.left_cam_info == None):
                    continue
                cam_model.fromCameraInfo(self.left_cam_info)
            else:
                self.right_cam_info = None
                while (self.right_cam_info == None):
                    continue
                cam_model.fromCameraInfo(self.right_cam_info)

            self.sf = limb_camera + "_hand_camera"

            while not rospy.is_shutdown():
                try:
                    transform = self.tf_buffer.lookup_transform(self.tf, self.sf, rospy.Time(0))
                    depth = abs(transform.transform.translation.z - self.table_dist)

                    uv_rect = cam_model.rectifyPoint(uv_)

                    u = uv_rect[0]
                    v = uv_rect[1]

                    cx = cam_model.cx()
                    cy = cam_model.cy()
                    fx = cam_model.fx()
                    fy = cam_model.fy()

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
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
        
        self.cam_info_sub = rospy.Subscriber("/cameras/left_hand_camera/camera_info", CameraInfo, self.cam_info_clb)

        self.cam_model = PinholeCameraModel()
        self.cam_info = None
        self.uv = None

        self.red_range = {'low_H' : 57, 'low_S' : 0, 'low_V' : 0, 'high_H' : 132, 'high_S' : 255, 'high_V' : 255}
        self.blu_range = {'low_H' : 0, 'low_S' : 0, 'low_V' : 0, 'high_H' : 105, 'high_S' : 255, 'high_V' : 255}
        self.yel_range = {'low_H' : 30, 'low_S' : 0, 'low_V' : 0, 'high_H' : 180, 'high_S' : 255, 'high_V' : 255}

        self.tf_buffer = tf2_ros.Buffer(rospy.Duration(100.0))
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)
        self.sf = "left_hand_camera"
        self.tf = "base"
        
        self.table_dist = -0.1538229

        rospy.loginfo("ProcessImage server has been initiated...")

    def cam_info_clb(self, data):
        self.cam_info = data

    def process_image_clb(self, req):
        cv_image = self.bridge.imgmsg_to_cv2(req.img, "bgr8")
        hsv_img = cv2.cvtColor(cv_image, cv2.COLOR_BGR2HSV)
        hsv_img = cv2.GaussianBlur(hsv_img, (5, 5), 0)

        clr = req.color

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

        thresholded_img = cv2.bitwise_or(thresholded_img,thresholded_img_otsu)

        kernel = cv2.getStructuringElement(cv2.MORPH_RECT,(3,3))

        thresholded_img = cv2.erode(thresholded_img, kernel, iterations=3)
        thresholded_img = cv2.dilate(thresholded_img, kernel, iterations=3)
        thresholded_img = cv2.bitwise_not(thresholded_img)

        _, contours, _ = cv2.findContours(image=thresholded_img, mode=cv2.RETR_TREE, method=cv2.CHAIN_APPROX_NONE)

        extracted_features = []

        for contour in contours:
            if clr == 'red':
                min_area = 500
                max_area = 2000
                max_arcLng = 99999999
            elif clr == 'blue':
                min_area = 500
                max_area = 2000
                max_arcLng = 300
            elif clr == 'yellow':
                min_area = 1000
                max_area = 99999999
                max_arcLng = 99999999

            if cv2.contourArea(contour) > min_area and cv2.contourArea(contour) < max_area and cv2.arcLength(contour,True) < max_arcLng:
                M = cv2.moments(contour)
                if M['m00'] != 0:
                    cx = M['m10'] / M['m00']
                    cy = M['m01'] / M['m00']

                    self.uv = (cx, cy)
                    break

        # u = cx, v = cy
        # convert these to real world coordinates

        while (self.cam_info == None):
            continue

        self.cam_model.fromCameraInfo(self.cam_info)

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
                ps.header.frame_id = "left_hand_camera"
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
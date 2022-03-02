#!/usr/bin/env python

import rospy
from cv_bridge import CvBridge

import cv2
import numpy as np

from sensor_msgs.msg import Image

class DebugImgProcessing:
    def __init__(self):
        rospy.init_node('debug_image_processing')

        self.bridge = CvBridge()

        img_height = 400
        img_width = 640
        black_img = np.zeros((img_height, img_width), np.uint8)

        self.left_img = black_img
        self.right_img = black_img
        self.processed_img = black_img

        rospy.Timer(rospy.Duration(0.01), self.timer_clb)

        self.right_image_sub = rospy.Subscriber("/cameras/left_hand_camera/image",Image,self.left_hand_camera_clb)
        self.left_image_sub = rospy.Subscriber("/cameras/right_hand_camera/image",Image,self.right_hand_camera_clb)
        self.get_frame_sub = rospy.Subscriber("/processed_image", Image, self.show_processed_frame_clb)

    def __del__(self):
        rospy.Timer.shutdown()

    def timer_clb(self, event):
        cv2.imshow("Left Image", self.left_img)
        cv2.imshow("Right Image", self.right_img)
        cv2.imshow("Processed Image", self.processed_img)
        
        cv2.waitKey(3)

    def show_processed_frame_clb(self, data):
        self.processed_img = self.bridge.imgmsg_to_cv2(data, "bgr8")

    def left_hand_camera_clb(self, data):
        self.left_img = self.bridge.imgmsg_to_cv2(data, "bgr8")

    def right_hand_camera_clb(self, data):
        self.right_img = self.bridge.imgmsg_to_cv2(data, "bgr8")      

if __name__ == '__main__':
    dig = DebugImgProcessing()

    rospy.spin()

    cv2.destroyAllWindows()
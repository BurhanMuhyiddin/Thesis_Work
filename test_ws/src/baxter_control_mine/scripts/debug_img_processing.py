#!/usr/bin/env python2.7

import rospy
from cv_bridge import CvBridge

import cv2
import numpy as np
from threading import Lock

from sensor_msgs.msg import Image

from baxter_msgs_mine.msg import CameraDebug
from baxter_msgs_mine.msg import ImagePoints

class DebugImgProcessing:
    def __init__(self):
        rospy.init_node('debug_image_processing')

        self.bridge = CvBridge()

        self.protector = Lock()

        img_height = 400
        img_width = 640
        self.black_img = np.zeros((img_height, img_width), np.uint8)

        self.circle_radius = 4

        self.flag = False

        self.left_img = self.black_img
        self.right_img = self.black_img
        self.current_processed_img = self.black_img
        self.target_processed_img_mask = self.black_img
        self.current_processed_img_mask = self.black_img

        self.sampled_target_points = []
        self.sampled_current_points = []
        self.hold_point_coords = []
        self.pick_point_coords = []
        self.place_point_coords = []

        self.left_image_sub = rospy.Subscriber("/cameras/left_hand_camera/image", Image, self.left_hand_camera_clb)
        self.get_frame_sub = rospy.Subscriber("/processed_image", CameraDebug, self.show_processed_frame_clb)
        self.points_subs = rospy.Subscriber("/debug_points", ImagePoints, self.get_debug_points_clb)

    def get_debug_points_clb(self, data):
        self.sampled_target_points = data.sampled_target_points
        self.sampled_current_points = data.sampled_current_points
        self.hold_point_coords = data.hold_point_coords
        self.pick_point_coords = data.pick_point_coords
        self.place_point_coords = data.place_point_coords

        self.flag = True

    def show_processed_frame_clb(self, data):
        self.flag = False
        current_img = data.current_img
        target_img_mask = data.target_img_mask
        current_img_mask = data.current_img_mask

        self.current_processed_img = np.frombuffer(current_img.data, dtype=np.uint8).reshape(current_img.height, current_img.width, -1)
        self.target_processed_img_mask = np.frombuffer(target_img_mask.data, dtype=np.uint8).reshape(target_img_mask.height, target_img_mask.width, -1)
        self.current_processed_img_mask = np.frombuffer(current_img_mask.data, dtype=np.uint8).reshape(current_img_mask.height, current_img_mask.width, -1)

    def left_hand_camera_clb(self, data):
        self.left_img = self.bridge.imgmsg_to_cv2(data, "bgr8")

        if self.flag:
            rospy.loginfo("target len:" + str(len(self.sampled_target_points)//2))
            for (x1,y1) in zip(self.sampled_target_points[0::2], self.sampled_target_points[1::2]):
                x1 = int(x1)
                y1 = int(y1)
                self.target_processed_img_mask = cv2.circle(self.target_processed_img_mask, (x1,y1), radius=self.circle_radius, color=(0, 0, 255), thickness=-1)

            rospy.loginfo("current len:" + str(len(self.sampled_current_points)//2))
            for (x1,y1) in zip(self.sampled_current_points[0::2], self.sampled_current_points[1::2]):
                x1 = int(x1)
                y1 = int(y1)
                self.current_processed_img_mask = cv2.circle(self.current_processed_img_mask, (x1,y1), radius=self.circle_radius, color=(0, 0, 255), thickness=-1)

            hold_x = int(self.hold_point_coords[0])
            hold_y = int(self.hold_point_coords[1])
            self.current_processed_img = cv2.circle(self.current_processed_img, (hold_x,hold_y), radius=self.circle_radius, color=(0, 0, 255), thickness=-1)
            
            pick_x = int(self.pick_point_coords[0])
            pick_y = int(self.pick_point_coords[1])
            self.current_processed_img = cv2.circle(self.current_processed_img, (pick_x,pick_y), radius=self.circle_radius, color=(255, 0, 0), thickness=-1)
            
            place_x = int(self.place_point_coords[0])
            place_y = int(self.place_point_coords[1])
            self.current_processed_img = cv2.circle(self.current_processed_img, (place_x,place_y), radius=self.circle_radius, color=(0, 255, 0), thickness=-1)

        cv2.imshow("Left Image", self.left_img)
        cv2.imshow("Snapped Image", self.current_processed_img)
        cv2.imshow("Target Image Mask", self.target_processed_img_mask)
        cv2.imshow("Snapped Image Mask", self.current_processed_img_mask)
        cv2.waitKey(3) 

if __name__ == '__main__':
    dig = DebugImgProcessing()

    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")

    cv2.destroyAllWindows()
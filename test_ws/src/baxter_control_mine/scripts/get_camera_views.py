#!/usr/bin/env python

import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import numpy as np

class image_converter:
    def __init__(self):
        self.bridge = CvBridge()

        self.image_sub = rospy.Subscriber("/cameras/left_hand_camera/image",Image,self.callback)

        # get background image
        self.background = cv2.imread("/home/lar/Desktop/background.png")

    def callback(self,data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        img1 = cv2.GaussianBlur(cv_image, (5, 5), 0)
        img2 = cv2.GaussianBlur(self.background, (5, 5), 0)

        # diff = cv_image - self.background

        diff = np.abs(img1 - img2)

        cv2.imshow("Diff window", diff)
        cv2.imshow("Image window", cv_image)
        cv2.waitKey(3)

def main():
    ic = image_converter()
    rospy.init_node('camera_visualizer')
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()
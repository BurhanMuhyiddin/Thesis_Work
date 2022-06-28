#!/usr/bin/env python2.7

import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import numpy as np

class image_converter:
    def __init__(self):
        self.bridge = CvBridge()

        self.image_sub = rospy.Subscriber("/cameras/left_hand_camera/image",Image,self.callback)

        # for blue: 104, 66, 0, 135, 255, 255
        # for red: 0, 65, 0, 18, 255, 255
        # for yellow: 20, 69, 0, 29, 255, 255

        self.low_H =    78#93
        self.low_S =    0#40
        self.low_V =    0#0
        self.high_H =   179#179
        self.high_S =   255#255
        self.high_V =   34#255

    def callback(self,data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        hsv_img = cv2.cvtColor(cv_image, cv2.COLOR_BGR2HSV)
        hsv_img = cv2.GaussianBlur(hsv_img, (5, 5), 0)
        thresholded_img = cv2.inRange(hsv_img, (self.low_H, self.low_S, self.low_V), (self.high_H, self.high_S, self.high_V))

        # gray_img = cv2.cvtColor(hsv_img, cv2.COLOR_BGR2GRAY)
        # gray_img = cv2.GaussianBlur(gray_img, (2, 2), 0)
        # _, thresholded_img_otsu = cv2.threshold(gray_img,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)

        # thresh = cv2.adaptiveThreshold(gray_img, 255,
	    #     cv2.ADAPTIVE_THRESH_MEAN_C, cv2.THRESH_BINARY_INV, 21, 10)

        # kernel1 = cv2.getStructuringElement(cv2.MORPH_RECT,(3,3))
        # thresh = cv2.erode(thresh, kernel1, iterations=1)
        # thresh = cv2.dilate(thresh, kernel1, iterations=5)
        # thresh = cv2.morphologyEx(thresh, cv2.MORPH_CLOSE, kernel1)
        
        kernel = cv2.getStructuringElement(cv2.MORPH_RECT,(3,3))
        # thresholded_img = cv2.morphologyEx(thresholded_img, cv2.MORPH_CLOSE, kernel)
        # thresholded_img_otsu = cv2.dilate(thresholded_img_otsu, kernel, iterations=3)
        res = cv2.dilate(thresholded_img, kernel, iterations=2)

        # res = cv2.bitwise_and(thresholded_img, thresh)
        # res = cv2.morphologyEx(res, cv2.MORPH_CLOSE, kernel)

        _, contours, _ = cv2.findContours(res, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

        contours_perm = [cv2.arcLength(contour,True) for contour in contours]
        max_perm = max(contours_perm)

        biggest_contour = contours[contours_perm.index(max_perm)]

        new_mask = np.zeros_like(res)
        cv2.drawContours(new_mask, [biggest_contour], -1, (255, 255, 255), thickness=cv2.FILLED)

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
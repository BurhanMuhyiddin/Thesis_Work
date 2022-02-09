#!/usr/bin/env python

from turtle import back
import roslib
import sys
import rospy
import cv2
from std_msgs.msg import String
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

        gray_img = cv2.cvtColor(diff, cv2.COLOR_BGR2GRAY)

        # gray_img = cv2.GaussianBlur(gray_img,(5,5),0)

        # thresholded_img = cv2.adaptiveThreshold(gray_img, 255, cv2.ADAPTIVE_THRESH_GAUSSIAN_C, cv2.THRESH_BINARY,7, 11)
        _, thresholded_img = cv2.threshold(gray_img,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
        
        thresholded_img = cv2.medianBlur(thresholded_img,3)

        kernel = cv2.getStructuringElement(cv2.MORPH_RECT,(3,3))

        thresholded_img = cv2.erode(thresholded_img, kernel, iterations=3)

        thresholded_img = cv2.dilate(thresholded_img, kernel, iterations=3)

        thresholded_img = cv2.morphologyEx(thresholded_img, cv2.MORPH_OPEN, kernel)

        thresholded_img = cv2.bitwise_not(thresholded_img)

        _, contours, _ = cv2.findContours(image=thresholded_img, mode=cv2.RETR_TREE, method=cv2.CHAIN_APPROX_NONE)

        for contour in contours:
            if cv2.contourArea(contour) > 200 and cv2.contourArea(contour) < 2000:
                mask = np.zeros(cv_image.shape[:2], np.uint8)
                cv2.drawContours(mask, [contour], -1, (255, 255, 255), thickness=cv2.FILLED)
                mean_img = cv2.mean(cv_image, mask=mask)
                if mean_img[0] < 100.0 and mean_img[1] < 100.0 and mean_img[2] < 100.0 and cv2.arcLength(contour,True) < 300:
                    cv2.drawContours(cv_image, contour, -1, (255, 0, 0), 1)

        cv2.imshow("diff window", diff)
        cv2.imshow("Image window", cv_image)
        cv2.waitKey(3)

def main():
    ic = image_converter()
    rospy.init_node('image_converter', anonymous=True)
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()
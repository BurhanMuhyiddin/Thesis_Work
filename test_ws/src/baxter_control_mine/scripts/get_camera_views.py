#!/usr/bin/env python

import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import numpy as np

class image_converter:
    def __init__(self):
        self.bridge = CvBridge()

        self.image_sub = rospy.Subscriber("/cameras/right_hand_camera/image",Image,self.callback)

        # for blue: 104, 66, 0, 135, 255, 255
        # for red: 0, 65, 0, 18, 255, 255
        # for yellow: 20, 69, 0, 29, 255, 255

        self.low_H = 20
        self.low_S = 69
        self.low_V = 0
        self.high_H = 29
        self.high_S = 255
        self.high_V = 255

    def callback(self,data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        hsv_img = cv2.cvtColor(cv_image, cv2.COLOR_BGR2HSV)
        hsv_img = cv2.GaussianBlur(hsv_img, (5, 5), 0)
        thresholded_img = cv2.inRange(hsv_img, (self.low_H, self.low_S, self.low_V), (self.high_H, self.high_S, self.high_V))
        
        gray_img = cv2.cvtColor(hsv_img, cv2.COLOR_BGR2GRAY)
        gray_img = cv2.GaussianBlur(gray_img, (5, 5), 0)
        _, thresholded_img_otsu = cv2.threshold(gray_img,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
        thresholded_img_otsu = cv2.bitwise_not(thresholded_img_otsu)

        # thresholded_img = cv2.bitwise_xor(thresholded_img,thresholded_img_otsu)

        kernel = cv2.getStructuringElement(cv2.MORPH_RECT,(3,3))

        thresholded_img = cv2.morphologyEx(thresholded_img, cv2.MORPH_OPEN, kernel)
        # thresholded_img = cv2.erode(thresholded_img, kernel, iterations=3)

        thresholded_img = cv2.dilate(thresholded_img, kernel, iterations=3)

        thresholded_img = cv2.bitwise_not(thresholded_img)

        thresholded_img = cv2.bitwise_or(thresholded_img,thresholded_img_otsu)

        _, contours, _ = cv2.findContours(image=thresholded_img, mode=cv2.RETR_TREE, method=cv2.CHAIN_APPROX_NONE)

        min_area = 200
        max_area = 5000
        min_arcLng = 500

        for contour in contours:
            
            if cv2.contourArea(contour) > min_area and cv2.contourArea(contour) < max_area: #and cv2.arcLength(contour,True) < max_arcLng:
                # pass
                cv2.drawContours(cv_image, [contour], -1, (255, 255, 255), thickness=cv2.FILLED)
                    
                # if mean_img[0] < 100.0 and mean_img[1] < 100.0 and mean_img[2] < 100.0 and cv2.arcLength(contour,True) < 300:
                #     M = cv2.moments(contour)
                #     if M['m00'] != 0:
                #         # cx = int(M['m10']/M['m00'])
                #         # cy = int(M['m01']/M['m00'])

                #         cx = M['m10']/M['m00']
                #         cy = M['m01']/M['m00']

                #         self.uv = (cx, cy)
                #         break

        # cv2.imshow("Diff window", diff)
        # cv2.imshow("Thresholded img", thresholded_img)
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
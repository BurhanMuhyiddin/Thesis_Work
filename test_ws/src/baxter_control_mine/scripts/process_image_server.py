#!/usr/bin/env python

from concurrent.futures import process
import rospy
import cv2
from cv_bridge import CvBridge, CvBridgeError
import numpy as np

from sensor_msgs.msg import Image

from baxter_msgs_mine.srv import ProcessImage, ProcessImageResponse

class ProcessImageSrv:
    def __init__(self):
        rospy.init_node('process_image_server')

        self.bridge = CvBridge()

        self.process_img_server = rospy.Service('/process_img', ProcessImage, self.process_image_clb)
        rospy.loginfo("ProcessImage server has been initiated...")

        self.background = cv2.imread("/home/lar/Desktop/background.png")

    def process_image_clb(self, req):
        cv_image = self.bridge.imgmsg_to_cv2(req.img, "bgr8")

        diff = cv_image - self.background

        gray_img = cv2.cvtColor(diff, cv2.COLOR_BGR2GRAY)

        gray_img = cv2.GaussianBlur(gray_img,(5,5),0)

        _, thresholded_img = cv2.threshold(gray_img,0,255,cv2.THRESH_BINARY+cv2.THRESH_OTSU)
        
        thresholded_img = cv2.medianBlur(thresholded_img,3)

        kernel = cv2.getStructuringElement(cv2.MORPH_RECT,(3,3))

        thresholded_img = cv2.erode(thresholded_img, kernel, iterations=3)

        thresholded_img = cv2.dilate(thresholded_img, kernel, iterations=3)

        thresholded_img = cv2.morphologyEx(thresholded_img, cv2.MORPH_OPEN, kernel)

        thresholded_img = cv2.bitwise_not(thresholded_img)

        _, contours, _ = cv2.findContours(image=thresholded_img, mode=cv2.RETR_TREE, method=cv2.CHAIN_APPROX_NONE)

        extracted_features = []

        for contour in contours:
            if cv2.contourArea(contour) > 200 and cv2.contourArea(contour) < 1000:
                mask = np.zeros(cv_image.shape[:2], np.uint8)
                cv2.drawContours(mask, [contour], -1, (255, 255, 255), thickness=cv2.FILLED)
                mean_img = cv2.mean(cv_image, mask=mask)
                if mean_img[0] < 100.0 and mean_img[1] < 100.0 and mean_img[2] < 100.0 and cv2.arcLength(contour,True) < 300:
                    M = cv2.moments(contour)
                    if M['m00'] != 0:
                        # cx = int(M['m10']/M['m00'])
                        # cy = int(M['m01']/M['m00'])

                        cx = M['m10']/M['m00']
                        cy = M['m01']/M['m00']

                        extracted_features.append(cx)
                        extracted_features.append(cy)

                        break

        return ProcessImageResponse(extracted_features=extracted_features, success=True)
        

def main():
    pi_server = ProcessImageSrv()

    rospy.spin()

if __name__ == '__main__':
    main()
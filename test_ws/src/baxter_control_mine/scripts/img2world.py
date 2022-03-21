#!/usr/bin/env python

from __future__ import print_function

import sys
import rospy
from baxter_msgs_mine.srv import ProcessImage, ProcessImageResponse
from sensor_msgs.msg import Image

def add_two_ints_client():
    rospy.wait_for_service('/process_img')
    try:
        add_two_ints = rospy.ServiceProxy('process_img', ProcessImage)
        img = Image()
        resp1 = add_two_ints(img, "yellow", "left")
        return resp1.extracted_features
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

if __name__ == "__main__":
    rospy.init_node("client_node")
    print(add_two_ints_client())
    rospy.spin()
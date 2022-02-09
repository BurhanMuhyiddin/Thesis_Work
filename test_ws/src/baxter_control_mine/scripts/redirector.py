#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Image

class Redirector:
    def __init__(self):
        self.img_pub = rospy.Publisher('/cameras/left_hand_camera/image_raw', Image, queue_size=10)
        self.img_sub = rospy.Subscriber("/cameras/left_hand_camera/image", Image, self.img_clb)

    def img_clb(self, data):
        self.img_pub.publish(data)

def main():
    rospy.init_node("redirector")

    r = Redirector()

    rospy.spin()

if __name__ == '__main__':
    main()
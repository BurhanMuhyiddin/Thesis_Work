#!/usr/bin/env python2.7

import rospy
from std_msgs.msg import Empty

def suppres__collision_avoidance():
    suppress_collision_avoidance_left_pub = rospy.Publisher('//robot/limb/left/suppress_collision_avoidance', Empty, queue_size=10)
    suppress_collision_avoidance_right_pub = rospy.Publisher('//robot/limb/right/suppress_collision_avoidance', Empty, queue_size=10)

    rate = rospy.Rate(5)

    while not rospy.is_shutdown():
        empty_msg = Empty()
        suppress_collision_avoidance_left_pub.publish(empty_msg)
        suppress_collision_avoidance_right_pub.publish(empty_msg)
        rate.sleep()

def main():
    rospy.init_node('obstacle_avoidance_suppressing_node')
    suppres__collision_avoidance()

if __name__ == '__main__':
    main()
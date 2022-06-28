#!/home/lar/miniconda3/envs/rope_processing/bin/python

import sys
import rospy
from process_rope_msgs.srv import SampleRope

def sample_rope_client(x, y):
    rospy.wait_for_service('/sample_rope')
    try:
        add_two_ints = rospy.ServiceProxy('/sample_rope', SampleRope)
        resp1 = add_two_ints(x, y)
        return resp1.points
    except rospy.ServiceException as e:
        print("Service call failed: %s"%e)

if __name__ == "__main__":
    print(sample_rope_client(1, 'left'))
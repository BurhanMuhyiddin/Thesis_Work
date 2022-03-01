#! /usr/bin/env python
import sys
import rospy
import time
import actionlib
import copy
import json
import rospkg

from std_msgs.msg import Float64MultiArray, Bool
from geometry_msgs.msg import Pose

from move_rt.msg import ExecutingTrajectoryAction, ExecutingTrajectoryGoal, ExecutingTrajectoryResult
from move_rt.srv import *

class TesterPin2Pin(object):
    # create messages that are used to publish feedback/result

    moveClientGoal = ExecutingTrajectoryGoal()

    def __init__(self, name):

        self.arm = 'left_arm/'


        print('trajectory execution Action Client: Waiting')
        self.move_client = actionlib.SimpleActionClient('{}ee_execute_trajectory'.format(self.arm), ExecutingTrajectoryAction)
        self.move_client.wait_for_server()
        print('trajectory execution Action Client: OK\n')

        #print('Joint trajectory execution Action Client: Waiting')
        #self.joint_client = actionlib.SimpleActionClient('{}simple_joint_trajectory'.format(self.arm), ExecutingTrajectoryAction)
        #self.joint_client.wait_for_server()
        #print('Joint rajectory execution Action Client: OK\n')


        print('end-effector enable service: Waiting')
        rospy.wait_for_service('{}EePosition/setEnable'.format(self.arm))
        self.eeEnable = rospy.ServiceProxy('{}EePosition/setEnable'.format(self.arm), TaskParamUpdate)
        print('end-effector enable service: OK\n')

        #print('emergency enable service: Waiting')        
        #rospy.wait_for_service('{}EmergencyStop/setEnable'.format(self.arm))
        #self.emergencyEnable = rospy.ServiceProxy('{}EmergencyStop/setEnable'.format(self.arm), TaskParamUpdate)
        #print('emergency enable service: OK\n')

        print('set tool frame service: Waiting')
        rospy.wait_for_service('{}EePosition/setToolFrame'.format(self.arm))
        self.setToolFrame = rospy.ServiceProxy('{}EePosition/setToolFrame'.format(self.arm), UpdateFrame)
        print('set tool frame service: OK\n')

        print('clear trajecotory service: Waiting')
        rospy.wait_for_service('{}EePosition/clearTrajectory'.format(self.arm))
        self.clearTraj = rospy.ServiceProxy('{}EePosition/clearTrajectory'.format(self.arm), TaskParamUpdate)
        print('clear trajecotory service: OK\n')
        
        #print('end-effector enable service: Waiting')
        #rospy.wait_for_service('{}JointPosition/setEnable'.format(self.arm))
        #self.JointEnable = rospy.ServiceProxy('{}JointPosition/setEnable'.format(self.arm), TaskParamUpdate)
        #print('end-effector enable service: OK\n')

        self.joint_pub = rospy.Publisher('{}joint_setpoint'.format(self.arm),Float64MultiArray, queue_size=10)     


        self.clearTraj([0])
        self.moveClientGoal = ExecutingTrajectoryGoal()
        self.moveHome = ExecutingTrajectoryGoal()
        self.moveClientResult = ExecutingTrajectoryResult()
        self.joint_goal = Float64MultiArray()

        self.home_position = [{'orient_w': 0.16, 'orient_x': -0.38, 'orient_y': 0.9, 'orient_z': 0.06, 'pos_x':  0.67, 'pos_y': 0.77, 'pos_z': 0.1, 'time': 5.0}]
        
        self.traj_point = {'orient_w': None, 'orient_x': None, 'orient_y': None, 'orient_z': None, 'pos_x':  None, 'pos_y': None, 'pos_z': None, 'time': 3.0}
        self.new_traj_list = []

        self.home_list = [{'joint_1': -1.34, 'joint_2': -1.15, 'joint_3': -1.75, 'joint_4':-1.69, 'joint_5':  1.57, 'joint_6': -0.6, 'time': 2.0}]

        self.camera_orientation = {'orient_w': 0.0, 'orient_x': 0.707, 'orient_y':0.707, 'orient_z': 0.0, 'time': 5.0}
        
        self.home_list[0]['joint_1'] = -1.57
        self.home_list[0]['joint_2'] = -0.850
        self.home_list[0]['joint_3'] = -1.75
        self.home_list[0]['joint_4'] = -1.90
        self.home_list[0]['joint_5'] = 1.57
        self.home_list[0]['joint_6'] = 1.05
        self.home_list[0]['time'] = 3.5


        self.fingertip_frame_name = 'left_hand'
        self.pause_timeout = 0.5

        self.moveHome.trajectory_name = '/{}traj_home'.format(self.arm)
        self.moveHome.ee_error_th = 0.01
        rospy.set_param(self.moveHome.trajectory_name, self.home_position)
        
        self.moveClientGoal.ee_error_th = 0.001
        
        self.error_list = []


    def execute_cb(self):
        self.eeEnable([1])

        self.setToolFrame(self.fingertip_frame_name) 

        self.eeEnable([1])

        self.move_client.send_goal(self.moveHome)
        result_ok = self.move_client.wait_for_result()

        self.eeEnable([1])
        self.clearTraj([0])
  
        

if __name__ == '__main__':
    rospy.init_node('move_rt_test')
    if len(sys.argv) > 1:
        print(sys.argv[1])
        server = TesterPin2Pin(rospy.get_name(), sys.argv[1]) 
    else:
        server = TesterPin2Pin(rospy.get_name())

    server.execute_cb()
    rospy.spin()

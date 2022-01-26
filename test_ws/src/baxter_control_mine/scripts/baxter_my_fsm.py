#!/usr/bin/env python

import rospy
import smach
from smach import State, StateMachine
import time
import actionlib
from actionlib import GoalStatus
from geometry_msgs.msg import Pose, Point, Quaternion, Twist
from tf.transformations import quaternion_from_euler
from collections import OrderedDict

from baxter_msgs_mine.msg import GoToPointAction
from baxter_msgs_mine.msg import GoToPointGoal
from baxter_msgs_mine.msg import GoToPointResult

class HOME(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=["success"])
        self.client = actionlib.SimpleActionClient("/go_to_goal", GoToPointAction)

    def execute(self, ud):
        goal_pose = GoToPointGoal()
        
        self.client.wait_for_server()

        goal_pose.desired_pose = Pose(Point(0.106153, 0.708761, -0.384312), Quaternion(-0.661702, 0.726757, -0.124059, -0.136325))

        self.client.send_goal(goal_pose)

        self.client.wait_for_result()

        rospy.sleep(5)

        return "success"

class STRAIGHT(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=["success"])
        self.client = actionlib.SimpleActionClient("/go_to_goal", GoToPointAction)

    def execute(self, ud):
        goal_pose = GoToPointGoal()
        
        self.client.wait_for_server()

        goal_pose.desired_pose = Pose(Point(0.908972, 1.10398, 0.320976), Quaternion(-0.270599, 0.653281, 0.270599, 0.653281))

        self.client.send_goal(goal_pose)

        self.client.wait_for_result()

        rospy.sleep(5)

        return "success"

class WORK(smach.State):
    def __init__(self):
        smach.State.__init__(self, outcomes=["success"])
        self.client = actionlib.SimpleActionClient("/go_to_goal", GoToPointAction)

    def execute(self, ud):
        goal_pose = GoToPointGoal()
        
        self.client.wait_for_server()

        goal_pose.desired_pose = Pose(Point(1.03692, 0.480976, 0.203003), Quaternion(-0.106929, 0.949026, 0.0331254, 0.294651))

        self.client.send_goal(goal_pose)

        self.client.wait_for_result()

        rospy.sleep(5)

        return "success"


if __name__ == '__main__':
    rospy.init_node('smach_example_state_machine')

    sm = smach.StateMachine(outcomes=["success"])

    with sm:
        smach.StateMachine.add('HOME', HOME(), transitions={"success":"STRAIGHT"})
        smach.StateMachine.add('STRAIGHT', STRAIGHT(), transitions={"success":"WORK"})
        smach.StateMachine.add('WORK', WORK(), transitions={"success":"HOME"})

    outcome = sm.execute()
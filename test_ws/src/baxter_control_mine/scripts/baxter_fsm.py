#!/usr/bin/env python

import rospy
import smach
import time
from smach import State, StateMachine
from smach_ros import SimpleActionState, IntrospectionServer
import actionlib
from actionlib import GoalStatus
from geometry_msgs.msg import Pose, Point, Quaternion, Twist
from tf.transformations import quaternion_from_euler
from collections import OrderedDict

from baxter_msgs_mine.msg import GoToPointAction
from baxter_msgs_mine.msg import GoToPointGoal
from baxter_msgs_mine.msg import GoToPointResult

class main():
    def __init__(self):

        rospy.init_node('simple_fsm_node')
        self.gtp_cl = actionlib.SimpleActionClient("/go_to_goal", GoToPointAction)
        self.gtp_cl.wait_for_server(rospy.Duration(15))

        self.waypoints = list()
        self.waypoints.append(Pose(Point(0.908972, 1.10398, 0.320976), Quaternion(-0.270599, 0.653281, 0.270599, 0.653281))) # straight position
        self.waypoints.append(Pose(Point(0.106153, 0.708761, -0.384312), Quaternion(-0.661702, 0.726757, -0.124059, -0.136325))) # home position
        self.waypoints.append(Pose(Point(1.03692, 0.480976, 0.203003), Quaternion(-0.106929, 0.949026, 0.0331254, 0.294651))) # work position
        pose_points = (('straight', self.waypoints[0]),
                        ('home', self.waypoints[1]),
                        ('work', self.waypoints[2]))

        self.pose_points = OrderedDict(pose_points)
        
        move_robot_states = {}

        for pose_name in self.pose_points.iterkeys():
            goal_pose = GoToPointGoal()
            goal_pose.desired_pose = self.pose_points[pose_name]

            move_robot_state = SimpleActionState("/go_to_goal", GoToPointAction, goal=goal_pose, result_cb=self.move_base_result_cb)
            move_robot_states[pose_name] = move_robot_state

        sm_move_robot = StateMachine(outcomes=['succeeded', 'aborted', 'preempted'])
        with sm_move_robot:
            StateMachine.add("GO_TO_HOME_POSE", move_robot_states['home'], transitions={"succeeded":"GO_TO_STRAIGHT_POSE", "aborted":"", "preempted":""})
            StateMachine.add("GO_TO_STRAIGHT_POSE", move_robot_states['straight'], transitions={"succeeded":"GO_TO_WORK_POSE", "aborted":"", "preempted":""})
            StateMachine.add("GO_TO_WORK_POSE", move_robot_states['work'], transitions={"succeeded":"GO_TO_HOME_POSE", "aborted":"", "preempted":""})

        sm_outcome = sm_move_robot.execute()

        rospy.signal_shutdown('FSM stopped...')

    def move_base_result_cb(self, userdata, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            rospy.sleep(5)


if __name__ == '__main__':
    try:
        main()
    except rospy.ROSInterruptException:
        rospy.loginfo("FSM finished...")
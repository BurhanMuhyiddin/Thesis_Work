#!/usr/bin/env python

import rospy
import smach
from smach import State, StateMachine
from smach_ros import SimpleActionState, IntrospectionServer

from collections import OrderedDict

import actionlib
from actionlib import GoalStatus

from geometry_msgs.msg import Pose, Point, Quaternion, Twist

from baxter_msgs_mine.msg import GoToPointAction
from baxter_msgs_mine.msg import GoToPointGoal

class main():
    def __init__(self):        
        rospy.init_node("pick_and_place_fsm_node")

        self.gtp_cl = actionlib.SimpleActionClient("/go_to_goal", GoToPointAction)
        self.gtp_cl.wait_for_server(rospy.Duration(15))

        self.waypoints = list()
        self.waypoints.append(Pose(Point(0.797655, 0.412112, 0.374372), Quaternion(-0.102185, 0.989582, 0.0104224, 0.10088))) 
        self.waypoints.append(Pose(Point(0.712625, -0.091887, 0.335984), Quaternion(0.0983495, 0.989932, 0.030586, 0.0970911))) 
        self.waypoints.append(Pose(Point(0.760158, -0.0818765, 0.101024), Quaternion(0.0985908, 0.989925, 0.0304949, 0.0969431)))
        self.waypoints.append(Pose(Point(0.624597, 0.777129, 0.354848), Quaternion(-0.10181, 0.98961, 0.0104501, 0.100985)))
        self.waypoints.append(Pose(Point(0.642795, 0.781149, 0.0765355), Quaternion(-0.101961, 0.989605, 0.0107294, 0.10085)))
        pose_points = (('work', self.waypoints[0]),
                ('pick_pos', self.waypoints[1]),
                ('app_pick', self.waypoints[2]),
                ('place_pos', self.waypoints[3]),
                ('app_place', self.waypoints[4]))

        self.pose_points = OrderedDict(pose_points)

        sm = smach.StateMachine(outcomes={'succeeded', 'aborted', 'preempted'})

        with sm:
            StateMachine.add("WORK", 
                SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['work']), result_cb=self.move_base_result_cb),
                transitions={'succeeded':'PICK_POSITION', 'aborted':'', 'preempted':''})
            
            StateMachine.add("PICK_POSITION", 
                SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['pick_pos']), result_cb=self.move_base_result_cb),
                transitions={'succeeded':'APPROACH_PICK', 'aborted':'', 'preempted':''})

            StateMachine.add("APPROACH_PICK", 
                SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['app_pick']), result_cb=self.move_base_result_cb),
                transitions={'succeeded':'BACK_PICK_POSITION', 'aborted':'', 'preempted':''})

            StateMachine.add("BACK_PICK_POSITION", 
                SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['pick_pos']), result_cb=self.move_base_result_cb),
                transitions={'succeeded':'PLACE_POSITION', 'aborted':'', 'preempted':''})

            StateMachine.add("PLACE_POSITION", 
                SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['place_pos']), result_cb=self.move_base_result_cb),
                transitions={'succeeded':'APPROACH_PLACE', 'aborted':'', 'preempted':''})

            StateMachine.add("APPROACH_PLACE", 
                SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['app_place']), result_cb=self.move_base_result_cb),
                transitions={'succeeded':'BACK_PLACE_POSITION', 'aborted':'', 'preempted':''})

            StateMachine.add("BACK_PLACE_POSITION", 
                SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['place_pos']), result_cb=self.move_base_result_cb),
                transitions={'succeeded':'BACK_WORK_POSITION', 'aborted':'', 'preempted':''})

            StateMachine.add("BACK_WORK_POSITION", 
                SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['work']), result_cb=self.move_base_result_cb),
                transitions={'succeeded':'', 'aborted':'', 'preempted':''})

        sm_outcome = sm.execute()

        rospy.signal_shutdown('FSM stopped...')

    def move_base_result_cb(self, userdata, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            rospy.sleep(0.5)

if __name__ == '__main__':
    main()
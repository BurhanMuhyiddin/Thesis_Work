#!/usr/bin/env python

import rospy
import smach
import smach_ros
from smach_ros import SimpleActionState

import actionlib
from collections import OrderedDict

from geometry_msgs.msg import Pose, Point, Quaternion
from sensor_msgs.msg import Image

from baxter_msgs_mine.srv import ProcessImage, ProcessImageRequest

from baxter_msgs_mine.msg import GoToPointAction
from baxter_msgs_mine.msg import GoToPointGoal

class main():
    def __init__(self): 
        rospy.init_node("computer_vision_fsm_node")

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

        sm = smach.StateMachine(outcomes=['succeeded', 'preempted', 'aborted'])
        sm.userdata.sm_data = False
        sm.userdata.img_data = Image()

        with sm:
            smach.StateMachine.add('WORK', SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['work']), 
                                                                                            result_cb=self.work_state_clb,
                                                                                            output_keys=['reset']),
                                    transitions={'succeeded':'TABLE_TOP', 'aborted':'', 'preempted':''},
                                    remapping={'reset' : 'sm_data'})

            smach.StateMachine.add('TABLE_TOP', SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['pick_pos']), 
                                                                                            result_cb=self.table_top_result_cb,
                                                                                            output_keys=['grabbed_image']),
                                    transitions={'succeeded' : 'PROCESS_IMAGE', 'preempted' : '', 'aborted' : ''}, 
                                    remapping={'grabbed_image' : 'img_data'})

            smach.StateMachine.add('PROCESS_IMAGE', smach_ros.ServiceState('/process_img', ProcessImage, request_cb = self.get_image_cb, input_keys=['img_to_be_processed']), 
                                    transitions={'succeeded' : 'APPROACH'}, 
                                    remapping={'img_to_be_processed' : 'img_data'})

            smach.StateMachine.add('APPROACH', SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['app_pick']),
                                                                                            outcomes=['succeeded', 'preempted', 'aborted', 'grasped'],
                                                                                            result_cb=self.approach_state_clb,
                                                                                            input_keys=['is_grasp']),
                                    transitions={'succeeded' : 'GRASP', 'preempted' : '', 'aborted' : '', 'grasped' : 'WORK'},
                                    remapping={'is_grasp' : 'sm_data'})

            smach.StateMachine.add('GRASP', SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['app_pick']), 
                                                                                            result_cb=self.grasp_state_clb,
                                                                                            output_keys=['grasped']), 
                                    transitions={'succeeded' : 'APPROACH', 'preempted' : '', 'aborted' : ''}, 
                                    remapping={'grasped' : 'sm_data'})

        self.sis = smach_ros.IntrospectionServer('server_name', sm, '/SM_ROOT')
        self.sis.start()

        outcome = sm.execute()

        rospy.spin()

    def get_image_cb(self, ud, request):
            # subscribe to the topic that publishes image and send it as a request
            # img_to_be_processed = ProcessImageRequest()
            # img_to_be_processed.img.height = 2
            # img_to_be_processed.img.width = 2
            # img_to_be_processed.img.data = [100, 250, 125, 63] # between 0-255
            # return img_to_be_processed
            return ud.img_to_be_processed

    def table_top_result_cb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            # take picture (I simulate it by creating new image for now)
            # send picture to process image service state
            image = Image()
            image.width = 2
            image.height = 2
            image.data = [255, 255, 255, 255]

            ud.grabbed_image = image

    def work_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            ud.reset = False
            rospy.sleep(1.0)

    def table_top_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            rospy.sleep(1.0)

    def approach_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            rospy.sleep(1.0)
            if ud.is_grasp == True:
                return 'grasped'
            else:
                return 'succeeded'

    def grasp_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            ud.grasped = True
            rospy.sleep(1.0)
        

if __name__ == '__main__':
    m = main()

    m.sis.stop()
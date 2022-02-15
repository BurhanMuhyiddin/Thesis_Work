#!/usr/bin/env python

from email.header import Header
import rospy
import smach
import smach_ros
from smach_ros import SimpleActionState

import actionlib
from collections import OrderedDict

from geometry_msgs.msg import Pose, Point, Quaternion
from sensor_msgs.msg import Image
from control_msgs.msg import GripperCommandAction, GripperCommandActionGoal, GripperCommandGoal
from std_msgs.msg import Header
from actionlib_msgs.msg import GoalID

from baxter_msgs_mine.srv import ProcessImage, ProcessImageRequest

from baxter_msgs_mine.msg import GoToPointAction
from baxter_msgs_mine.msg import GoToPointGoal

class main():
    def __init__(self): 
        rospy.init_node("computer_vision_fsm_node")

        self.gtp_cl = actionlib.SimpleActionClient("/go_to_goal", GoToPointAction)
        self.gripper_cl = actionlib.SimpleActionClient("/robot/end_effector/left_gripper/gripper_action", GripperCommandAction)
        self.gtp_cl.wait_for_server(rospy.Duration(15))
        self.gripper_cl.wait_for_server(rospy.Duration(15))

        gripper_reset_goal = GripperCommandGoal()
        gripper_reset_goal.command.position = 100.0
        self.gripper_cl.send_goal(gripper_reset_goal)
        self.gripper_cl.wait_for_result()

        self.image_sub = rospy.Subscriber("/cameras/left_hand_camera/image",Image,self.image_clb)

        self.current_image = None

        self.extracted_features = []

        self.waypoints = list()
        self.waypoints.append(Pose(Point(0.821231, 0.238061, 0.369946), Quaternion(0.0411739, 0.994043, 0.0261063, 0.0974731)))
        # self.waypoints.append(Pose(Point(0.823456, 0.293838, 0.376693), Quaternion(0.0287752, 0.994138, 0.0235979, 0.101508))) 
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

        self.gripper_close_cmd = GripperCommandGoal()
        self.gripper_close_cmd.command.position = 50.0 # close half
        self.gripper_open_cmd = GripperCommandActionGoal()
        self.gripper_open_cmd.goal.command.position = 0.0 # close half
        
        sm = smach.StateMachine(outcomes=['succeeded', 'preempted', 'aborted'])
        sm.userdata.grab_data = False
        sm.userdata.img_data = Image()

        with sm:
            # smach.StateMachine.add('WORK', SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['work']), 
            #                                                                                 result_cb=self.work_state_clb,
            #                                                                                 output_keys=['reset']),
            #                         transitions={'succeeded':'TABLE_TOP', 'aborted':'', 'preempted':''},
            #                         remapping={'reset' : 'sm_data'})

            smach.StateMachine.add('TABLE_TOP', SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['work']), 
                                                                                            result_cb=self.table_top_result_cb,
                                                                                            output_keys=['grabbed_image', 'reset']),
                                    transitions={'succeeded' : 'PROCESS_IMAGE', 'preempted' : '', 'aborted' : ''}, 
                                    remapping={'grabbed_image' : 'img_data', 'reset' : 'grab_data'})

            smach.StateMachine.add('PROCESS_IMAGE', smach_ros.ServiceState('/process_img', ProcessImage, 
                                    request_cb = self.get_image_cb,
                                    response_cb = self.process_image_result_cb, 
                                    input_keys=['img_to_be_processed']), 
                                    transitions={'succeeded' : 'PICK_POSITION'}, 
                                    remapping={'img_to_be_processed' : 'img_data'})

            smach.StateMachine.add('PICK_POSITION', SimpleActionState("/go_to_goal", GoToPointAction, goal_cb=self.pick_pos_goal_clb,
                                                                                            outcomes=['succeeded', 'preempted', 'aborted', 'grasped'],
                                                                                            result_cb=self.pick_position_state_clb,
                                                                                            input_keys=['is_grasp']),
                                    transitions={'succeeded' : 'APPROACH', 'preempted' : '', 'aborted' : '', 'grasped' : 'TABLE_TOP'},
                                    remapping={'is_grasp' : 'grab_data'})

            smach.StateMachine.add('APPROACH', SimpleActionState("/go_to_goal", GoToPointAction, goal_cb=self.approach_pos_goal_clb,
                                                                                            outcomes=['succeeded', 'preempted', 'aborted'],
                                                                                            result_cb=self.approach_state_clb),
                                    transitions={'succeeded' : 'GRASP', 'preempted' : '', 'aborted' : ''})

            smach.StateMachine.add('GRASP', SimpleActionState("/robot/end_effector/left_gripper/gripper_action", GripperCommandAction, goal_cb=self.gripper_goal_cb, 
                                                                                            result_cb=self.grasp_state_clb,
                                                                                            output_keys=['grasped']), 
                                    transitions={'succeeded' : 'PICK_POSITION', 'preempted' : '', 'aborted' : ''}, 
                                    remapping={'grasped' : 'grab_data'})

        self.sis = smach_ros.IntrospectionServer('server_name', sm, '/SM_ROOT')
        self.sis.start()

        outcome = sm.execute()

        rospy.spin()

    def gripper_goal_cb(self, ud, goal):
        # hd = Header()
        # g_id = GoalID()
        # gg = GripperCommandGoal()
        # gg.command.position = 50.0

        gg = GripperCommandGoal()
        gg.command.position = 20.0

        return gg


    def pick_pos_goal_clb(self, ud, goal):
        pp = self.pose_points['work']
        pp.position.x = self.extracted_features[0]
        pp.position.y = self.extracted_features[1] 

        return GoToPointGoal(pp)

    def approach_pos_goal_clb(self, ud, goal):
        ap = Pose()
        ap.position.x = self.extracted_features[0]
        ap.position.y = self.extracted_features[1] 
        ap.position.z = 0.0060
        ap.orientation.x = 0.017546
        ap.orientation.y = 0.994616
        ap.orientation.z = 0.0223233
        ap.orientation.w = 0.0996664

        return GoToPointGoal(ap)

    def image_clb(self, data):
        self.current_image = data # update current image regularly

    def process_image_result_cb(self, ud, result):
        # get extracted features from result
        self.extracted_features = result.extracted_features
        rospy.loginfo(self.extracted_features)

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
            # image = Image()
            # image.width = 2
            # image.height = 2
            # image.data = [255, 255, 255, 255]

            while self.current_image is None: # loop until you get valid image
                continue
            ud.grabbed_image = self.current_image
            ud.reset = False

            rospy.sleep(2.0)

    # def work_state_clb(self, ud, status, result):
    #     if status == actionlib.GoalStatus.SUCCEEDED:
    #         ud.reset = False
    #         rospy.sleep(1.0)

    def table_top_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            rospy.sleep(1.0)
    
    def pick_position_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            rospy.sleep(1.0)
            if ud.is_grasp == True:
                return 'grasped'
            else:
                return 'succeeded'

    def approach_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            rospy.sleep(1.0)

    def grasp_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            ud.grasped = True
            rospy.sleep(1.0)
        

if __name__ == '__main__':
    m = main()

    m.sis.stop()
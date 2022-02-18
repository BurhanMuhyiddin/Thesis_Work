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

        self.gripper_position = 0.0

        self.extracted_features = []

        self.waypoints = list()
        self.waypoints.append(Pose(Point(0.821231, 0.238061, 0.369946), Quaternion(0.0411739, 0.994043, 0.0261063, 0.0974731)))
        self.waypoints.append(Pose(Point(0.738407, -0.202405, 0.393372), Quaternion(-0.197444, 0.976507, 0.0220792, 0.0834445)))

        pose_points = (('work_left', self.waypoints[0]),
                       ('work_right', self.waypoints[1]))
        self.pose_points = OrderedDict(pose_points)
        
        sm = smach.StateMachine(outcomes=['succeeded', 'preempted', 'aborted'])
        sm.userdata.grab_data = False
        sm.userdata.img_data = Image()
        sm.userdata.color_data = "yellow"

        with sm:
            
            smach.StateMachine.add('TABLE_TOP_RIGHT', SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['work_right'], "right"), 
                                                                                            result_cb=self.table_top_right_result_cb,
                                                                                            output_keys=['grabbed_image', 'obj_color']),
                                    transitions={'succeeded' : 'PROCESS_IMAGE', 'preempted' : '', 'aborted' : ''}, 
                                    remapping={'grabbed_image' : 'img_data', 'obj_color' : 'color_data'})

            smach.StateMachine.add('TABLE_TOP_LEFT', SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal(self.pose_points['work_left'], "left"), 
                                                                                            result_cb=self.table_top_left_result_cb,
                                                                                            output_keys=['grabbed_image']),
                                    transitions={'succeeded' : 'PROCESS_IMAGE', 'preempted' : '', 'aborted' : ''}, 
                                    remapping={'grabbed_image' : 'img_data'})

            smach.StateMachine.add('PROCESS_IMAGE', smach_ros.ServiceState('/process_img', ProcessImage,
                                                                                            outcomes=['pick_obj', 'place_obj'],
                                                                                            request_cb = self.get_image_cb,
                                                                                            response_cb = self.process_image_result_cb,
                                                                                            input_keys=['img_to_be_processed', 'is_grasped', 'obj_color']),
                                    transitions={'pick_obj' : 'PICK_POSITION', 'place_obj' : 'PLACE_POSITION'}, 
                                    remapping={'img_to_be_processed' : 'img_data', 'is_grasped' : 'grab_data', 'obj_color' : 'color_data'})

            smach.StateMachine.add('PICK_POSITION', SimpleActionState("/go_to_goal", GoToPointAction, goal_cb=self.pick_pos_goal_clb,
                                                                                            outcomes=['succeeded', 'preempted', 'aborted'],
                                                                                            result_cb=self.pick_pos_state_clb,
                                                                                            input_keys=['obj_color']),
                                    transitions={'succeeded' : 'GRASP', 'preempted' : '', 'aborted' : ''},
                                    remapping={'obj_color' : 'color_data'})


            smach.StateMachine.add('GRASP', SimpleActionState("/robot/end_effector/left_gripper/gripper_action", GripperCommandAction, goal_cb=self.gripper_goal_cb, 
                                                                                            result_cb=self.grasp_state_clb,
                                                                                            output_keys=['grasped']), 
                                    transitions={'succeeded' : 'TABLE_TOP', 'preempted' : '', 'aborted' : ''}, 
                                    remapping={'grasped' : 'grab_data'})

            smach.StateMachine.add('PLACE_POSITION', SimpleActionState("/go_to_goal", GoToPointAction, goal_cb=self.place_pos_goal_clb,
                                                                                            outcomes=['succeeded', 'preempted', 'aborted'],
                                                                                            result_cb=self.place_pos_state_clb),
                                    transitions={'succeeded' : 'RELEASE', 'preempted' : '', 'aborted' : ''})

            smach.StateMachine.add('RELEASE', SimpleActionState("/robot/end_effector/left_gripper/gripper_action", GripperCommandAction, goal_cb=self.gripper_goal_cb, 
                                                                                            result_cb=self.release_state_clb,
                                                                                            output_keys=['grasped']), 
                                    transitions={'succeeded' : 'TABLE_TOP', 'preempted' : '', 'aborted' : ''}, 
                                    remapping={'grasped' : 'grab_data'})

        self.sis = smach_ros.IntrospectionServer('server_name', sm, '/SM_ROOT')
        self.sis.start()

        outcome = sm.execute()

        rospy.spin()

    # goal callbacks

    def gripper_goal_cb(self, ud, goal):

        gg = GripperCommandGoal()
        gg.command.position = self.gripper_position

        return gg

    def pick_pos_goal_clb(self, ud, goal):
        pp = Pose()
        pp.position.x = self.extracted_features[0]
        pp.position.y = self.extracted_features[1] 
        pp.position.z = 0.0060
        pp.orientation.x = 0.017546
        pp.orientation.y = 0.994616
        pp.orientation.z = 0.0223233
        pp.orientation.w = 0.0996664

        if ud.obj_color == "yellow": # right should be moved only when color is yellow
            limb = "right"
        else:                        # otherwise, move left
            limb = "left"

        self.gripper_position = 30.0

        return GoToPointGoal(pp, limb)

    def place_pos_goal_clb(self, ud, goal):
        pp = Pose()
        pp.position.x = self.extracted_features[0]
        pp.position.y = self.extracted_features[1] 
        pp.position.z = 0.0060
        pp.orientation.x = 0.017546
        pp.orientation.y = 0.994616
        pp.orientation.z = 0.0223233
        pp.orientation.w = 0.0996664

        self.gripper_position = 100.0

        return GoToPointGoal(pp, "left")

    # subscriber callbacks

    def image_clb(self, data):
        self.current_image = data # update current image regularly

    # request callbacks

    def get_image_cb(self, ud, request):
        # return img_to_be_processed
        im_req = ProcessImageRequest()
        im_req.img = ud.img_to_be_processed
        im_req.color = ud.obj_color

        # print(im_req.color)

        return im_req

    # result callbacks

    def process_image_result_cb(self, ud, result):
        # get extracted features from result
        self.extracted_features = result.extracted_features

        if ud.is_grasp == True:
            return 'place_obj'
        else:
            return 'pick_obj'
        # rospy.loginfo(self.extracted_features)

    def table_top_right_result_cb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            # take picture (I simulate it by creating new image for now)
            # send picture to process image service state

            while self.current_image is None: # loop until you get valid image
                continue

            ud.grabbed_image = self.current_image
            ud.obj_color = "yellow" # set color to be detected as yellow

            rospy.sleep(2.0)

    def table_top_left_result_cb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            # take picture (I simulate it by creating new image for now)
            # send picture to process image service state

            while self.current_image is None: # loop until you get valid image
                continue
            
            ud.grabbed_image = self.current_image

            if ud.is_grasp == False:
                ud.obj_color = "red" # set color to be detected as red before grasping
            else:
                ud.obj_color = "blue" # set color to be detected as blue after grasping

            rospy.sleep(2.0)

    # state callbacks
    
    def pick_pos_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            rospy.sleep(1.0)

    def place_pos_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            rospy.sleep(1.0)

    def grasp_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            ud.grasped = True
            rospy.sleep(1.0)

    def release_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            ud.grasped = False
            rospy.sleep(1.0)
        
if __name__ == '__main__':
    m = main()

    m.sis.stop()
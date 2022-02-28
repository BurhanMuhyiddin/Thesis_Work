#!/usr/bin/env python

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
from baxter_msgs_mine.srv import CheckCrossing, CheckCrossingRequest

from baxter_msgs_mine.msg import GoToPointAction
from baxter_msgs_mine.msg import GoToPointGoal

class main():
    def __init__(self):
        rospy.init_node("computer_vision_fsm_node")

        gtp_cl = actionlib.SimpleActionClient("/go_to_goal", GoToPointAction)
        left_gripper_cl = actionlib.SimpleActionClient("/robot/end_effector/left_gripper/gripper_action", GripperCommandAction)
        # right_gripper_cl = actionlib.SimpleActionClient("/robot/end_effector/right_gripper/gripper_action", GripperCommandAction)
        gtp_cl.wait_for_server(rospy.Duration(15))
        left_gripper_cl.wait_for_server(rospy.Duration(15))
        # right_gripper_cl.wait_for_server(rospy.Duration(15))

        gripper_reset_goal = GripperCommandGoal()
        gripper_reset_goal.command.position = 100.0
        left_gripper_cl.send_goal(gripper_reset_goal)
        left_gripper_cl.wait_for_result()

        self.image_sub_left = rospy.Subscriber("/cameras/left_hand_camera/image",Image,self.image_clb_left)
        self.image_sub_right = rospy.Subscriber("/cameras/right_hand_camera/image",Image,self.image_clb_right)

        self.current_image_left = None
        self.current_image_right = None

        self.gripper_position = 0.0

        self.extracted_features = []

        self.stage = 0

        self.waypoints = list()
        # self.waypoints.append(Pose(Point(0.66398, 0.334738, 0.512868), Quaternion(-0.0472679, 0.997461, -0.00951615, 0.0524047)))
        # self.waypoints.append(Pose(Point(0.821231, 0.238061, 0.369946), Quaternion(0.0411739, 0.994043, 0.0261063, 0.0974731)))
        self.waypoints.append(Pose(Point(0.712783, 0.294493, 0.43211), Quaternion(-0.0178776, 0.994369, 0.040816, 0.0961492)))
        # self.waypoints.append(Pose(Point(0.738407, -0.202405, 0.393372), Quaternion(-0.197444, 0.976507, 0.0220792, 0.0834445)))
        self.waypoints.append(Pose(Point(0.690706, -0.300684, 0.545849), Quaternion(-0.0117947, 0.991489, 0.0648684, 0.112261)))

        pose_points = (('work_left', self.waypoints[0]),
                       ('work_right', self.waypoints[1]))
        self.pose_points = OrderedDict(pose_points)
        
        sm = smach.StateMachine(outcomes=['succeeded', 'preempted', 'aborted'])
        sm.userdata.grab_data = 0 # 0: none of the arms grasped | 1: left arm grasped | 2: right arm grasped
        sm.userdata.img_data = Image()
        sm.userdata.color_data = "yellow"
        sm.userdata.limb_data = "right"

        with sm:
            
            smach.StateMachine.add('HOME', SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal([self.pose_points['work_left'], self.pose_points['work_right']], "both"), 
                                                                                            result_cb=self.home_result_cb,
                                                                                            output_keys=['obj_color', 'is_grasped']),
                                    transitions={'succeeded' : 'CHECK_CROSSING', 'preempted' : '', 'aborted' : ''},
                                    remapping={'obj_color' : 'color_data', 'is_grasped' : 'grab_data'})

            smach.StateMachine.add('CHECK_CROSSING', smach_ros.ServiceState('/check_crossing', CheckCrossing,
                                                                                            outcomes=['operate_left', 'operate_right'],
                                                                                            request_cb = self.check_crossing_request_cb,
                                                                                            response_cb = self.check_crossing_result_cb,
                                                                                            input_keys=['obj_color']),
                                    transitions={'operate_left' : 'TABLE_TOP_LEFT', 'operate_right' : 'TABLE_TOP_RIGHT'},
                                    remapping={'obj_color' : 'color_data'})
                                    
            smach.StateMachine.add('TABLE_TOP_RIGHT', SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal([self.pose_points['work_right']], "right"), 
                                                                                            result_cb=self.table_top_right_result_cb,
                                                                                            output_keys=['grabbed_image', 'obj_color', 'limb_name', 'is_grasped']),
                                    transitions={'succeeded' : 'PROCESS_IMAGE', 'preempted' : '', 'aborted' : ''}, 
                                    remapping={'grabbed_image' : 'img_data', 'obj_color' : 'color_data', 'limb_name' : 'limb_data', 'is_grasped' : 'grab_data'})

            smach.StateMachine.add('TABLE_TOP_LEFT', SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal([self.pose_points['work_left']], "left"), 
                                                                                            result_cb=self.table_top_left_result_cb,
                                                                                            input_keys=['is_grasped'],
                                                                                            output_keys=['grabbed_image', 'obj_color', 'limb_name']),
                                    transitions={'succeeded' : 'PROCESS_IMAGE', 'preempted' : '', 'aborted' : ''}, 
                                    remapping={'grabbed_image' : 'img_data', 'obj_color' : 'color_data', 'limb_name' : 'limb_data', 'is_grasped' : 'grab_data'})

            smach.StateMachine.add('PROCESS_IMAGE', smach_ros.ServiceState('/process_img', ProcessImage,
                                                                                            outcomes=['pick_obj', 'place_obj'],
                                                                                            request_cb = self.get_image_cb,
                                                                                            response_cb = self.process_image_result_cb,
                                                                                            input_keys=['img_to_be_processed', 'is_grasped', 'obj_color', 'limb_name']),
                                    transitions={'pick_obj' : 'PICK_POSITION', 'place_obj' : 'PLACE_POSITION'}, 
                                    remapping={'img_to_be_processed' : 'img_data', 'is_grasped' : 'grab_data', 'obj_color' : 'color_data', 'limb_name' : 'limb_data'})

            smach.StateMachine.add('PICK_POSITION', SimpleActionState("/go_to_goal", GoToPointAction, goal_cb=self.pick_pos_goal_clb,
                                                                                            outcomes=['succeeded', 'preempted', 'aborted'],
                                                                                            result_cb=self.pick_pos_state_clb,
                                                                                            input_keys=['limb_name']),
                                    transitions={'succeeded' : 'GRASP', 'preempted' : '', 'aborted' : ''},
                                    remapping={'limb_name' : 'limb_data'})


            smach.StateMachine.add('GRASP', SimpleActionState("/robot/end_effector/left_gripper/gripper_action", GripperCommandAction, goal_cb=self.gripper_goal_cb, 
                                                                                            outcomes=['operate_left', 'operate_right'],
                                                                                            result_cb=self.grasp_state_clb,
                                                                                            input_keys=['limb_name'],
                                                                                            output_keys=['is_grasped', 'obj_color']), 
                                    transitions={'operate_left' : 'TABLE_TOP_LEFT', 'operate_right' : 'TABLE_TOP_RIGHT'}, 
                                    remapping={'is_grasped' : 'grab_data', 'limb_name' : 'limb_data', 'obj_color' : 'color_data'})

            smach.StateMachine.add('PLACE_POSITION', SimpleActionState("/go_to_goal", GoToPointAction, goal_cb=self.place_pos_goal_clb,
                                                                                            outcomes=['succeeded', 'preempted', 'aborted'],
                                                                                            result_cb=self.place_pos_state_clb,
                                                                                            input_keys=['limb_name']),
                                    transitions={'succeeded' : 'RELEASE', 'preempted' : '', 'aborted' : ''},
                                    remapping={'limb_name' : 'limb_data'})

            smach.StateMachine.add('RELEASE', SimpleActionState("/robot/end_effector/left_gripper/gripper_action", GripperCommandAction, goal_cb=self.gripper_goal_cb, 
                                                                                            result_cb=self.release_state_clb,
                                                                                            output_keys=['is_grasped']), 
                                    transitions={'succeeded' : 'HOME', 'preempted' : '', 'aborted' : ''}, 
                                    remapping={'is_grasped' : 'grab_data'})

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

        self.gripper_position = 30.0

        return GoToPointGoal([pp], ud.limb_name)

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

        return GoToPointGoal([pp], ud.limb_name)

    # subscriber callbacks

    def image_clb_left(self, data):
        self.current_image_left = data # update current image regularly
    def image_clb_right(self, data):
        self.current_image_right = data # update current image regularly

    # request callbacks

    def check_crossing_request_cb(self, ud, request):
        cc_req = CheckCrossingRequest()
        cc_req.color = ud.obj_color

        return cc_req

    def get_image_cb(self, ud, request):
        # return img_to_be_processed
        im_req = ProcessImageRequest()
        im_req.img = ud.img_to_be_processed
        im_req.color = ud.obj_color
        im_req.limb = ud.limb_name

        # print(im_req.color)

        return im_req

    # result callbacks

    def home_result_cb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            ud.is_grasped = 0
            self.stage = 0
            ud.obj_color = "yellow"
            rospy.sleep(1.0)

    def process_image_result_cb(self, ud, result):
        # get extracted features from result
        self.extracted_features = result.extracted_features

        if self.stage == 0 or self.stage == 1:
            return 'pick_obj'
        else:
            return 'place_obj'
        # rospy.loginfo(self.extracted_features)

    def check_crossing_result_cb(self, ud, result):
        limb = result.limb

        if limb == "left":
            return "operate_left"
        else:
            return "operate_right"

    def table_top_right_result_cb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            # take picture (I simulate it by creating new image for now)
            # send picture to process image service state

            while self.current_image_right is None: # loop until you get valid image
                continue

            ud.grabbed_image = self.current_image_right
            ud.limb_name = "right"

            rospy.sleep(2.0)

    def table_top_left_result_cb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            # take picture (I simulate it by creating new image for now)
            # send picture to process image service state

            while self.current_image_left is None: # loop until you get valid image
                continue
            
            ud.grabbed_image = self.current_image_left
            ud.limb_name = "left"

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
            temp = self.stage
            self.stage = self.stage + 1

            if ud.limb_name == "left":
                ud.is_grasped = 1
                if temp == 0:
                    ud.obj_color = "red"
                    return "operate_right"
                else:
                    ud.obj_color = "blue"
                    return "operate_left"
            else:
                ud.is_grasped = 0 # because we don't grasp with two
                if temp == 0:
                    ud.obj_color = "red"
                    return "operate_left"
                else:
                    ud.obj_color = "blue"
                    return "operate_right"

    def release_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            ud.is_grasped = 0
            rospy.sleep(1.0)
        
if __name__ == '__main__':
    m = main()

    m.sis.stop()
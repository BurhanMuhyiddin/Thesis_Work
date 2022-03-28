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

from baxter_msgs_mine.srv import GoToGoal, GoToGoalRequest
from baxter_msgs_mine.srv import GoToJointGoal, GoToJointGoalRequest

class main():
    def __init__(self):
        rospy.init_node("computer_vision_fsm_node")

        left_gripper_cl = actionlib.SimpleActionClient("/robot/end_effector/left_gripper/gripper_action", GripperCommandAction)
        # right_gripper_cl = actionlib.SimpleActionClient("/robot/end_effector/right_gripper/gripper_action", GripperCommandAction)
        left_gripper_cl.wait_for_server(rospy.Duration(15))
        # right_gripper_cl.wait_for_server(rospy.Duration(15))

        gripper_reset_goal = GripperCommandGoal()
        gripper_reset_goal.command.position = 100.0
        left_gripper_cl.send_goal(gripper_reset_goal)
        left_gripper_cl.wait_for_result()

        self.current_image_left = None
        self.current_image_right = None

        self.gripper_position = 0.0
        self.stage = 0
        self.limb_name = ''
        self.obj_color = ''

        self.extracted_features = {}

        self.waypoints = list()
        # self.waypoints.append(Pose(Point(0.66398, 0.334738, 0.512868), Quaternion(-0.0472679, 0.997461, -0.00951615, 0.0524047)))
        # self.waypoints.append(Pose(Point(0.821231, 0.238061, 0.369946), Quaternion(0.0411739, 0.994043, 0.0261063, 0.0974731)))
        self.waypoints.append(Pose(Point(0.712783, 0.294493, 0.43211), Quaternion(-0.0178776, 0.994369, 0.040816, 0.0961492)))
        # self.waypoints.append(Pose(Point(0.738407, -0.202405, 0.393372), Quaternion(-0.197444, 0.976507, 0.0220792, 0.0834445)))
        self.waypoints.append(Pose(Point(0.730668, -0.412415, 0.371713), Quaternion(0.0979966, 0.989636, 0.0478672, 0.0934108)))
        # self.waypoints.append([-0.375441797834955, 0.99171857936792, -0.6132088199571941, -1.0062913968528313, 0.3524320860166738, 1.5163400088247314, -0.14112623248545805])
        # self.waypoints.append([-0.009203884727312482, 1.2659176452024377, 0.6051554208207958, -1.1408982109897765, -3.0322965224524916, -1.347602122157336, 2.9640343773915907])

        self.waypoints.append([-0.47016511148687934, 0.9890341129891205,-0.49931074645670215, -1.202257442505193, 0.2281796421979553,1.6428934238252781,-0.11044661672774979])
        self.waypoints.append([0.10699515995500761, 1.2586312364599819, 0.4663301595171658,-1.2068593848688494, -3.051087787104088, -1.4327380558849765, 3.003150887482669])

        pose_points = (('work_left', self.waypoints[0]),
                       ('work_right', self.waypoints[1]),
                       ('work_left_joint', self.waypoints[2]),
                       ('work_right_joint', self.waypoints[3]))
        self.pose_points = OrderedDict(pose_points)

        # start to create state machine
        sm = smach.StateMachine(outcomes=['succeeded', 'preempted', 'aborted'])
        sm.userdata.color_data = "yellow"

        with sm:
            
            smach.StateMachine.add('HOME', smach_ros.ServiceState("/go_to_joint_goal", GoToJointGoal, 
                                                                                request_cb = self.home_request_cb,
                                                                                response_cb = self.home_result_cb),
                                    transitions={'succeeded' : 'CHECK_CROSSING', 'preempted' : '', 'aborted' : 'HOME'})

            smach.StateMachine.add('CHECK_CROSSING', smach_ros.ServiceState('/check_crossing', CheckCrossing,
                                                                                            outcomes=['succeeded', 'aborted'],
                                                                                            request_cb = self.check_crossing_request_cb,
                                                                                            response_cb = self.check_crossing_result_cb),
                                    transitions={'succeeded' : 'PROCESS_IMAGE', 'aborted' : 'HOME'})
                                    
            # smach.StateMachine.add('TABLE_TOP_RIGHT', SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal([self.pose_points['work_right']], "right"), 
            #                                                                                 result_cb=self.table_top_right_result_cb,
            #                                                                                 output_keys=['grabbed_image', 'limb_name']),
            #                         transitions={'succeeded' : 'PROCESS_IMAGE', 'preempted' : '', 'aborted' : ''}, 
            #                         remapping={'grabbed_image' : 'img_data', 'limb_name' : 'limb_data'})

            # smach.StateMachine.add('TABLE_TOP_LEFT', SimpleActionState("/go_to_goal", GoToPointAction, goal=GoToPointGoal([self.pose_points['work_left']], "left"), 
            #                                                                                 result_cb=self.table_top_left_result_cb,
            #                                                                                 output_keys=['grabbed_image', 'limb_name']),
            #                         transitions={'succeeded' : 'PROCESS_IMAGE', 'preempted' : '', 'aborted' : ''}, 
            #                         remapping={'grabbed_image' : 'img_data', 'limb_name' : 'limb_data'})

            smach.StateMachine.add('PROCESS_IMAGE', smach_ros.ServiceState('/process_img', ProcessImage,
                                                                                            outcomes=['pick_obj', 'place_obj', 'aborted'],
                                                                                            request_cb = self.process_img_request_clb,
                                                                                            response_cb = self.process_image_result_cb),
                                    transitions={'pick_obj' : 'PICK_POSITION', 'place_obj' : 'PLACE_POSITION', 'aborted' : 'HOME'})

            smach.StateMachine.add('PICK_POSITION', smach_ros.ServiceState("/go_to_goal", GoToGoal,
                                                                                            outcomes=['succeeded', 'preempted', 'aborted'],
                                                                                            request_cb = self.pick_pos_request_clb,
                                                                                            response_cb = self.pick_pos_result_clb),
                                    transitions={'succeeded' : 'GRASP', 'preempted' : '', 'aborted' : 'HOME'})

            smach.StateMachine.add('GRASP', SimpleActionState("/robot/end_effector/left_gripper/gripper_action", GripperCommandAction, goal_cb=self.gripper_goal_cb, 
                                                                                            outcomes=['pick_obj', 'place_obj'],
                                                                                            result_cb=self.grasp_state_clb), 
                                    transitions={'pick_obj' : 'PICK_POSITION', 'place_obj' : 'PLACE_POSITION'})

            smach.StateMachine.add('PLACE_POSITION', smach_ros.ServiceState("/go_to_goal", GoToGoal,
                                                                                            outcomes=['succeeded', 'preempted', 'aborted'],
                                                                                            request_cb = self.place_pos_request_clb,
                                                                                            response_cb = self.place_pos_result_clb),
                                    transitions={'succeeded' : 'RELEASE', 'preempted' : '', 'aborted' : 'HOME'})

            smach.StateMachine.add('RELEASE', SimpleActionState("/robot/end_effector/left_gripper/gripper_action", GripperCommandAction, goal_cb=self.gripper_goal_cb, 
                                                                                            result_cb=self.release_state_clb), 
                                    transitions={'succeeded' : 'HOME', 'preempted' : '', 'aborted' : ''})

        self.sis = smach_ros.IntrospectionServer('server_name', sm, '/SM_ROOT')
        self.sis.start()

        outcome = sm.execute()

        rospy.spin()

    # goal callbacks

    def gripper_goal_cb(self, ud, goal):

        gg = GripperCommandGoal()
        gg.command.position = self.gripper_position

        return gg

    # request callbacks

    def home_request_cb(self, ud, request):
        gg_req = GoToJointGoalRequest()
        gg_req.goal = self.pose_points['work_left_joint'] + self.pose_points['work_right_joint']
        gg_req.limb = "both"

        return gg_req

    def check_crossing_request_cb(self, ud, request):
        cc_req = CheckCrossingRequest()
        cc_req.color = self.obj_color

        return cc_req

    def process_img_request_clb(self, ud, request):
        # return img_to_be_processed
        im_req = ProcessImageRequest()
        im_req.img = Image()
        im_req.color = self.obj_color
        im_req.limb = self.limb_name

        # print(im_req.color)

        return im_req

    def pick_pos_request_clb(self, ud, request):
        gg_req = GoToGoalRequest()

        pp = Pose()
        pp.position.x = self.extracted_features[self.obj_color][0]
        pp.position.y = self.extracted_features[self.obj_color][1]
        pp.position.z = 0.0060

        if (self.limb_name == "left"):
            pp.orientation.x = -0.0178776
            pp.orientation.y = 0.994369
            pp.orientation.z = 0.040816
            pp.orientation.w = 0.0961492
        else:
            pp.orientation.x = 0.0979966
            pp.orientation.y = 0.989636
            pp.orientation.z = 0.0478672
            pp.orientation.w = 0.0934108

        gg_req.goal = [pp]
        gg_req.limb = self.limb_name
        gg_req.pos_only_ik = False
        gg_req.mode = 0

        self.gripper_position = 30.0

        return gg_req

    def place_pos_request_clb(self, ud, request):
        gg_req = GoToGoalRequest()

        pp = Pose()
        pp.position.x = self.extracted_features[self.obj_color][0]
        pp.position.y = self.extracted_features[self.obj_color][1]
        pp.position.z = 0.0060

        if (self.limb_name == "left"):
            pp.orientation.x = -0.0178776
            pp.orientation.y = 0.994369
            pp.orientation.z = 0.040816
            pp.orientation.w = 0.0961492
        else:
            pp.orientation.x = 0.0979966
            pp.orientation.y = 0.989636
            pp.orientation.z = 0.0478672
            pp.orientation.w = 0.0934108

        gg_req.goal = [pp]
        gg_req.limb = self.limb_name
        gg_req.pos_only_ik = False
        gg_req.mode = 1

        self.gripper_position = 100.0

        return gg_req

    # result callbacks

    def home_result_cb(self, ud, result):
        if result.success:
            self.stage = 0
            self.obj_color = "yellow"
            rospy.sleep(2.0)
        else:
            return 'aborted'

    def process_image_result_cb(self, ud, result):
        # get extracted features from result
        extracted_features_buff = result.extracted_features
        
        if len(extracted_features_buff) == 0:
            return 'aborted'
        
        self.extracted_features["blue"] = extracted_features_buff[0:2]
        self.extracted_features["yellow"] = extracted_features_buff[2:4]
        self.extracted_features["red"] = extracted_features_buff[4:6]

        if self.stage == 0 or self.stage == 1:
            return 'pick_obj'
        else:
            return 'place_obj'

    def check_crossing_result_cb(self, ud, result):
        limb = result.limb

        if not result.success:
            return 'aborted'

        if limb == "left":
            self.limb_name = "left"
        else:
            self.limb_name = "right"

    def pick_pos_result_clb(self, ud, result):
        if result.success:
            rospy.sleep(1.0)
        else:
            return 'aborted'

    def place_pos_result_clb(self, ud, result):
        if result.success:
            rospy.sleep(1.0)
        else:
            return 'aborted'

    def table_top_right_result_cb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:

            rospy.sleep(2.0) # make sure robot is still, so image will be clean
            
            while self.current_image_right is None: # loop until you get valid image
                continue

            ud.grabbed_image = self.current_image_right
            ud.limb_name = "right"

    def table_top_left_result_cb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:

            rospy.sleep(2.0) # make sure robot is still, so image will be clean

            while self.current_image_left is None: # loop until you get valid image
                continue
            
            ud.grabbed_image = self.current_image_left
            ud.limb_name = "left"

    # state callbacks

    def grasp_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            current_stage = self.stage
            self.stage = self.stage + 1

            if self.limb_name == "left":
                if current_stage == 0:
                    self.obj_color = "red"
                    self.limb_name = "right"
                    return "pick_obj"
                else:
                    self.obj_color = "blue"
                    self.limb_name = "left"
                    return "place_obj"
            else:
                if current_stage == 0:
                    self.obj_color = "red"
                    self.limb_name = "left"
                    return "pick_obj"
                else:
                    self.obj_color = "blue"
                    self.limb_name = "right"
                    return "place_obj"

    def release_state_clb(self, ud, status, result):
        if status == actionlib.GoalStatus.SUCCEEDED:
            rospy.sleep(1.0)
        
if __name__ == '__main__':
    m = main()

    m.sis.stop()
	
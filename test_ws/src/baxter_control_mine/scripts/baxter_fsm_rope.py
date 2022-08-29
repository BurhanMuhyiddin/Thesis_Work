#!/usr/bin/env python2.7

from cmath import sqrt
from rosgraph import ROS_NAMESPACE
import rospy
import smach
import smach_ros
from smach_ros import SimpleActionState
import numpy as np
import math

import actionlib
from collections import OrderedDict

from geometry_msgs.msg import Pose, Point, Quaternion
from sensor_msgs.msg import Image
from control_msgs.msg import GripperCommandAction, GripperCommandActionGoal, GripperCommandGoal
from std_msgs.msg import Header
from actionlib_msgs.msg import GoalID
from shape_msgs.msg import SolidPrimitive

from baxter_msgs_mine.msg import ImagePoints

from baxter_msgs_mine.srv import GoToGoal, GoToGoalRequest
from baxter_msgs_mine.srv import GoToJointGoal, GoToJointGoalRequest

from process_rope_msgs.srv import SampleRope, SampleRopeRequest

from tf.transformations import quaternion_from_euler

class main():
    def __init__(self):
        rospy.init_node("computer_vision_fsm_node")

        rospy.set_param("is_started", False)

        self.left_gripper_cl = actionlib.SimpleActionClient("/robot/end_effector/left_gripper/gripper_action", GripperCommandAction)
        self.right_gripper_cl = actionlib.SimpleActionClient("/robot/end_effector/right_gripper/gripper_action", GripperCommandAction)
        self.left_gripper_cl.wait_for_server(rospy.Duration(15))
        self.right_gripper_cl.wait_for_server(rospy.Duration(15))

        self.point_publisher = rospy.Publisher('/debug_points', ImagePoints, queue_size=10)

        gripper_reset_goal = GripperCommandGoal()
        gripper_reset_goal.command.position = 100.0
        self.left_gripper_cl.send_goal(gripper_reset_goal)
        self.right_gripper_cl.send_goal(gripper_reset_goal)
        self.left_gripper_cl.wait_for_result()
        self.right_gripper_cl.wait_for_result()

        self.current_image_left = None
        self.current_image_right = None

        self.l_gripper_position = 0.0
        self.r_gripper_position = 0.0
        self.stage = 0
        self.index = 0
        self.total_points = 0
        self.limb_name = ''
        self.pick_angle = 0.0
        self.hold_angle = 0.0
        self.plce_angle = 0.0

        self.pick_point = [0.0, 0.0]
        self.pick_angle_q = []
        self.hold_point = [0.0, 0.0]
        self.hold_angle_q = []
        self.place_point = [0.0, 0.0]

        self.waypoints = list()
        self.waypoints.append(Pose(Point(0.712783, 0.294493, 0.43211), Quaternion(-0.0178776, 0.994369, 0.040816, 0.0961492)))
        self.waypoints.append(Pose(Point(0.730668, -0.412415, 0.371713), Quaternion(0.0979966, 0.989636, 0.0478672, 0.0934108)))
        # self.waypoints.append([-0.8103253512004698, 1.2555632748842112, -0.5127330783506996, -1.19573802415668, 0.26806314268297604, 1.57079632679, -0.12041749184900498])
        self.waypoints.append([-0.8620972027916025, 1.201106956914279, -0.31139809994073897, -1.1788642354899406, 0.33670878294084833, 1.6206507024009396, -0.21475731030395792])
        # self.waypoints.append([0.10699515995500761, 1.2586312364599819, 0.4663301595171658,-1.2068593848688494, -3.051087787104088, -1.4327380558849765, 3.003150887482669])
        self.waypoints.append([0.6722670802907825, 1.4549807773093149, 0.12962137657631745, -1.3211409535663126, -0.03183010134862233, 1.4392574742334894, -0.1292378813793461])
        self.waypoints.append([-1.3142380400208282, 1.0415729549741959, 0.2784175130012026, -0.27381557063754636, 1.1570050092625732, 1.5389662254460414, 0.05062136600021865])
        self.waypoints.append([1.685077895492127, 0.948383622110157, 0.24006799330406725, 0.09510680884889565, -1.7521895549621138, 1.6183497312191115, 0.3336408213650775])
        pose_points = (('work_left', self.waypoints[0]),
                       ('work_right', self.waypoints[1]),
                       ('work_left_joint', self.waypoints[2]),
                       ('work_right_joint', self.waypoints[3]),
                       ('ready_left_joint', self.waypoints[4]),
                       ('ready_right_joint', self.waypoints[5]))
        self.pose_points = OrderedDict(pose_points)

        # start to create state machine
        sm = smach.StateMachine(outcomes=['succeeded', 'preempted', 'aborted'])
        sm.userdata.color_data = "yellow"

        with sm:
            
            smach.StateMachine.add('HOME', smach_ros.ServiceState("/go_to_joint_goal", GoToJointGoal, 
                                                                                request_cb = self.home_request_cb,
                                                                                response_cb = self.home_result_cb),
                                    transitions={'succeeded' : 'PROCESS_IMAGE', 'preempted' : '', 'aborted' : 'HOME'})

            smach.StateMachine.add('HOME_INTER', smach_ros.ServiceState("/go_to_joint_goal", GoToJointGoal, 
                                                                                request_cb = self.home_inter_request_cb,
                                                                                response_cb = self.home_result_cb),
                                    transitions={'succeeded' : 'PROCESS_IMAGE', 'preempted' : '', 'aborted' : 'HOME_INTER'})

            smach.StateMachine.add('PROCESS_IMAGE', smach_ros.ServiceState('/sample_rope', SampleRope,
                                                                                            outcomes=['pick_obj', 'place_obj', 'aborted'],
                                                                                            request_cb = self.process_img_request_clb,
                                                                                            response_cb = self.process_image_result_cb),
                                    transitions={'pick_obj' : 'READY', 'place_obj' : 'PLACE_POSITION', 'aborted' : 'HOME_INTER'})

            smach.StateMachine.add('READY', smach_ros.ServiceState("/go_to_joint_goal", GoToJointGoal, 
                                                                                request_cb = self.ready_request_cb,
                                                                                response_cb = self.ready_result_cb),
                                    transitions={'succeeded' : 'GO_HOLD_PICK_POSITION', 'preempted' : '', 'aborted' : 'HOME_INTER'})

            smach.StateMachine.add('GO_HOLD_PICK_POSITION', smach_ros.ServiceState("/go_to_goal", GoToGoal,
                                                                                            outcomes=['succeeded', 'preempted', 'aborted'],
                                                                                            request_cb = self.go_hold_pick_pos_request_clb,
                                                                                            response_cb = self.go_hold_pick_pos_result_clb),
                                    transitions={'succeeded' : 'HOLD_POSITION', 'preempted' : '', 'aborted' : 'HOME_INTER'})

            smach.StateMachine.add('HOLD_POSITION', smach_ros.ServiceState("/go_to_goal", GoToGoal,
                                                                                            outcomes=['succeeded', 'preempted', 'aborted'],
                                                                                            request_cb = self.hold_pos_request_clb,
                                                                                            response_cb = self.hold_pos_result_clb),
                                    transitions={'succeeded' : 'PICK_POSITION', 'preempted' : '', 'aborted' : 'HOME_INTER'})

            smach.StateMachine.add('PICK_POSITION', smach_ros.ServiceState("/go_to_goal", GoToGoal,
                                                                                            outcomes=['succeeded', 'preempted', 'aborted'],
                                                                                            request_cb = self.pick_pos_request_clb,
                                                                                            response_cb = self.pick_pos_result_clb),
                                    transitions={'succeeded' : 'PLACE_POSITION', 'preempted' : '', 'aborted' : 'HOME_INTER'})

            smach.StateMachine.add('PLACE_POSITION', smach_ros.ServiceState("/go_to_goal", GoToGoal,
                                                                                            outcomes=['succeeded', 'preempted', 'aborted'],
                                                                                            request_cb = self.place_pos_request_clb,
                                                                                            response_cb = self.place_pos_result_clb),
                                    transitions={'succeeded' : 'RIGHT_ARM_UP', 'preempted' : '', 'aborted' : 'HOME_INTER'})

            smach.StateMachine.add('RIGHT_ARM_UP', smach_ros.ServiceState("/go_to_goal", GoToGoal,
                                                                                            outcomes=['succeeded', 'preempted', 'aborted'],
                                                                                            request_cb = self.right_arm_up_request_clb,
                                                                                            response_cb = self.right_arm_up_result_clb),
                                    transitions={'succeeded' : 'LEFT_ARM_UP', 'preempted' : '', 'aborted' : 'HOME_INTER'})

            smach.StateMachine.add('LEFT_ARM_UP', smach_ros.ServiceState("/go_to_goal", GoToGoal,
                                                                                            outcomes=['home', 'home_inter', 'preempted', 'aborted'],
                                                                                            request_cb = self.left_arm_up_request_clb,
                                                                                            response_cb = self.left_arm_up_result_clb),
                                    transitions={'home' : 'HOME', 'home_inter' : 'HOME_INTER', 'preempted' : '', 'aborted' : 'HOME_INTER'})
            
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

    def e_dist(self, p1, p2):
        return math.sqrt((p1[0] - p2[0])*(p1[0] - p2[0]) + (p1[1] - p2[1])*(p1[1] - p2[1]))

    def home_request_cb(self, ud, request):
        gripper_goal = GripperCommandGoal()
        gripper_goal.command.position = 100.0
        self.right_gripper_cl.send_goal(gripper_goal)
        self.right_gripper_cl.wait_for_result()
        self.left_gripper_cl.send_goal(gripper_goal)
        self.left_gripper_cl.wait_for_result()

        gg_req = GoToJointGoalRequest()
        gg_req.goal = self.pose_points['work_left_joint'] + self.pose_points['work_right_joint']
        gg_req.limb = "both"
        gg_req.mode = 0
        self.index = 0

        return gg_req

    def ready_request_cb(self, ud, request):
        gg_req = GoToJointGoalRequest()
        gg_req.goal = self.pose_points['ready_left_joint'] + self.pose_points['ready_right_joint']
        gg_req.limb = "both"
        gg_req.mode = 0

        return gg_req
    
    def home_inter_request_cb(self, ud, request):
        gg_req = GoToJointGoalRequest()
        gg_req.goal = self.pose_points['work_left_joint'] + self.pose_points['work_right_joint']
        gg_req.limb = "both"
        gg_req.mode = 0
        # self.index = 0

        return gg_req

    def process_img_request_clb(self, ud, request):
        im_req = SampleRopeRequest()
        if self.stage == 0:
            im_req.sample_target = True
        else:
            im_req.sample_target = False

        return im_req

    def go_hold_pick_pos_request_clb(self, ud, request):
        pp_hold = Pose()
        pp_hold.position.x = self.hold_point[0]
        pp_hold.position.y = self.hold_point[1]
        pp_hold.position.z = 0.06
        q_hold = quaternion_from_euler(2.7, 0.0,  self.hold_angle, 'syxz')
        # q_hold = quaternion_from_euler(0.7, 0.0,  self.hold_angle, 'syxz')
        self.hold_angle_q = q_hold
        pp_hold.orientation.x = q_hold[0]
        pp_hold.orientation.y = q_hold[1]
        pp_hold.orientation.z = q_hold[2]
        pp_hold.orientation.w = q_hold[3]

        pp_pick = Pose()
        pp_pick.position.x = self.pick_point[0]
        pp_pick.position.y = self.pick_point[1]
        pp_pick.position.z = 0.06
        q_pick = quaternion_from_euler(3.14, 0.0, self.pick_angle, 'syxz')
        # q_pick = quaternion_from_euler(2.5, 0.0, self.pick_angle, 'syxz')
        self.pick_angle_q = q_pick
        pp_pick.orientation.x = q_pick[0]
        pp_pick.orientation.y = q_pick[1]
        pp_pick.orientation.z = q_pick[2]
        pp_pick.orientation.w = q_pick[3]

        gg_req = GoToGoalRequest()
        gg_req.goal = [pp_hold, pp_pick]
        gg_req.limb = "both"
        gg_req.mode = 0
        gg_req.pos_constrained = False
        gg_req.orn_constrained = False
        gg_req.pos_only_ik = False

        return gg_req

    def hold_pos_request_clb(self, ud, request):
        gg_req = GoToGoalRequest()

        pp = Pose()
        pp.position.x = self.hold_point[0]
        pp.position.y = self.hold_point[1]
        pp.position.z = -0.105
        q = self.hold_angle_q
        pp.orientation.x = q[0]
        pp.orientation.y = q[1]
        pp.orientation.z = q[2]
        pp.orientation.w = q[3]

        gg_req.goal = [pp]
        gg_req.limb = "left"
        gg_req.mode = 1
        gg_req.pos_constrained = False
        gg_req.orn_constrained = False
        gg_req.pos_only_ik = False

        return gg_req

    def pick_pos_request_clb(self, ud, request):
        gg_req = GoToGoalRequest()

        pp = Pose()
        pp.position.x = self.pick_point[0]
        pp.position.y = self.pick_point[1]
        pp.position.z = -0.11000
        q = self.pick_angle_q
        pp.orientation.x = q[0]
        pp.orientation.y = q[1]
        pp.orientation.z = q[2]
        pp.orientation.w = q[3]

        gg_req.goal = [pp]
        gg_req.limb = "right"
        gg_req.pos_constrained = False
        gg_req.orn_constrained = False
        gg_req.pos_only_ik = False
        gg_req.mode = 1

        return gg_req

    def place_pos_request_clb(self, ud, request):
        gg_req = GoToGoalRequest()

        # r = self.e_dist([self.place_point[0], self.place_point[1]], [self.pick_point[0], self.pick_point[1]]) + 0.03
        r1 = self.e_dist([self.hold_point[0], self.hold_point[1]], [self.place_point[0], self.place_point[1]])
        r2 = self.e_dist([self.hold_point[0], self.hold_point[1]], [self.pick_point[0], self.pick_point[1]])
        r = max(r1, r2) + 0.03

        pp = Pose()
        pp.position.x = self.place_point[0]
        pp.position.y = self.place_point[1]
        pp.position.z = -0.1100
        # pp.position.z = r

        # q = self.pick_angle_q
        # # q = quaternion_from_euler(2.1, 0.0, self.pick_angle, 'syxz')
        # pp.orientation.x = q[0]
        # pp.orientation.y = q[1]
        # pp.orientation.z = q[2]
        # pp.orientation.w = q[3]

        # rospy.loginfo("Pick point: " + str(self.pick_point[0]) + ", " + str(self.pick_point[1]))
        # rospy.loginfo("Place point: " + str(self.place_point[0]) +", " + str(self.place_point[1]))
        rospy.loginfo("r is: " + str(r))

        bounding_region = SolidPrimitive()
        # bounding_region.type = bounding_region.SPHERE
        # bounding_region.dimensions.append(r)
        bounding_region.type = bounding_region.CYLINDER
        bounding_region.dimensions.append(0.3)
        bounding_region.dimensions.append(r)

        gg_req.goal = [pp]
        gg_req.limb = "right"
        gg_req.mode = 0
        gg_req.bounding_region = [bounding_region]
        gg_req.bounding_region_size = 1
        gg_req.pos_constrained = True
        gg_req.orn_constrained = True
        gg_req.pos_only_ik = True

        # rospy.set_param("is_started", True)

        return gg_req

    def right_arm_up_request_clb(self, ud, request):
        gg_req = GoToGoalRequest()

        pp = Pose()
        pp.position.x = self.place_point[0]
        pp.position.y = self.place_point[1]
        pp.position.z = 0.06

        bounding_region1 = SolidPrimitive()
        bounding_region1.type = bounding_region1.BOX
        bounding_region1.dimensions.append(0.3)
        bounding_region1.dimensions.append(0.3)
        bounding_region1.dimensions.append(100)

        bounding_region2 = SolidPrimitive()
        bounding_region2.type = bounding_region2.BOX
        bounding_region2.dimensions.append(100)
        bounding_region2.dimensions.append(100)
        bounding_region2.dimensions.append(100)

        gg_req.goal = [pp]
        gg_req.limb = "right"
        gg_req.mode = 0
        gg_req.bounding_region = [bounding_region1, bounding_region2]
        gg_req.bounding_region_size = 2
        gg_req.pos_constrained = True
        gg_req.orn_constrained = True
        gg_req.pos_only_ik = True

        return gg_req

    def left_arm_up_request_clb(self, ud, request):
        gg_req = GoToGoalRequest()

        pp = Pose()
        pp.position.x = self.hold_point[0]
        pp.position.y = self.hold_point[1]
        pp.position.z = 0.06
        q = self.hold_angle_q
        # q = quaternion_from_euler(2.1, 0.0, self.pick_angle, 'syxz')
        pp.orientation.x = q[0]
        pp.orientation.y = q[1]
        pp.orientation.z = q[2]
        pp.orientation.w = q[3]

        gg_req.goal = [pp]
        gg_req.limb = "left"
        gg_req.pos_constrained = False
        gg_req.orn_constrained = False
        gg_req.pos_only_ik = False
        gg_req.mode = 1

        return gg_req

    # result callbacks

    def home_result_cb(self, ud, result):
        if result.success:
            rospy.sleep(2.0)
        else:
            return 'aborted'

    def process_image_result_cb(self, ud, result):
        # get extracted features from result
        sampled_target_points = result.sampled_target_points
        sampled_current_points = result.sampled_current_points
        pick_points = result.pick_points
        pick_img_points = result.pick_img_points
        place_points = result.place_points
        place_img_points = result.place_img_points
        
        if len(pick_points) * len(place_points) == 0:
            return 'aborted'

        self.pick_points_number = len(pick_points)
        # rospy.loginfo("number of pick points: " + str(self.pick_points_number) + " index " + str(self.index))

        hold_img_x = pick_img_points[(self.index//3)*4]
        hold_img_y = pick_img_points[(self.index//3)*4+1]
        pick_img_x = pick_img_points[(self.index//3)*4+4]
        pick_img_y = pick_img_points[(self.index//3)*4+5]
        place_img_x = place_img_points[(self.index//3)*4]
        place_img_y = place_img_points[(self.index//3)*4+1]

        sampled_target_points_coords = []
        sampled_current_points_coords = []
        for (x1,y1,x2,y2) in zip(sampled_current_points[0::4], sampled_current_points[1::4], sampled_current_points[2::4], sampled_current_points[3::4]):
            sampled_current_points_coords.append(x1)
            sampled_current_points_coords.append(y1)
        for (x1,y1,x2,y2) in zip(sampled_target_points[0::4], sampled_target_points[1::4], sampled_target_points[2::4], sampled_target_points[3::4]):
            sampled_target_points_coords.append(x1)
            sampled_target_points_coords.append(y1)

        points_msg = ImagePoints()
        points_msg.sampled_target_points = sampled_target_points_coords
        points_msg.sampled_current_points = sampled_current_points_coords
        points_msg.hold_point_coords = [hold_img_x, hold_img_y]
        points_msg.pick_point_coords = [pick_img_x, pick_img_y]
        points_msg.place_point_coords = [place_img_x, place_img_y]
        self.point_publisher.publish(points_msg)

        # left hand
        self.hold_point[0] = pick_points[self.index]
        self.hold_point[1] = pick_points[self.index+1]
        self.hold_angle = pick_points[self.index+2]
        rospy.loginfo("original hold angle: " + str(self.hold_angle))
        if -(math.pi/2) <= self.hold_angle <= 0:
            self.hold_angle = self.hold_angle
        elif -math.pi <= self.hold_angle <= -(math.pi/2):
            self.hold_angle = self.hold_angle
        elif math.pi/2 <= self.hold_angle <= math.pi:
            self.hold_angle = self.hold_angle
        elif 0 <= self.hold_angle <= math.pi/2:
            self.hold_angle = self.hold_angle
        rospy.loginfo("processed hold angle: " + str(self.hold_angle))

        # rospy.loginfo("hold angle: " + str(self.hold_angle))

        self.place_point[0] = place_points[self.index]
        self.place_point[1] = place_points[self.index+1]
        self.place_angle = place_points[self.index+2]
        # rospy.loginfo("place point: " + str(self.place_point[0]) + "," + str(self.place_point[1]))

        # right hand
        self.pick_point[0] = pick_points[self.index+3]
        self.pick_point[1] = pick_points[self.index+4]
        self.pick_angle = pick_points[self.index+5]
        rospy.loginfo("original pick angle: " + str(self.pick_angle))
        if -(math.pi/2) <= self.pick_angle <= 0:
            self.pick_angle = math.pi - abs(self.pick_angle)
        elif -math.pi <= self.pick_angle <= -(math.pi/2):
            self.pick_angle = math.pi - abs(self.pick_angle)
        elif math.pi/2 <= self.pick_angle <= math.pi:
            self.pick_angle = self.pick_angle - math.pi
            self.pick_angle = math.pi - abs(self.pick_angle)
        elif 0 <= self.pick_angle <= math.pi/2:
            self.pick_angle = self.pick_angle - math.pi
            self.pick_angle = math.pi - abs(self.pick_angle)
        rospy.loginfo("processed pick angle: " + str(self.pick_angle))
        # rospy.loginfo("pick angle: " + str(self.pick_angle))
        # rospy.loginfo("pick point: " + str(self.pick_point[0]) + "," + str(self.pick_point[1]))

        self.index += 3
        self.stage = self.stage + 1

        self.limb_name = result.h_limb
        
        return 'pick_obj'

    def ready_result_cb(self, ud, result):
        if result.success:
            rospy.sleep(2.0)
        else:
            return 'aborted'

    def go_hold_pick_pos_result_clb(self, ud, result):
        if result.success:
            rospy.sleep(1.0)
        else:
            return 'aborted'

    def pick_pos_result_clb(self, ud, result):
        if result.success:
            # close right gripper
            gripper_goal = GripperCommandGoal()
            gripper_goal.command.position = 5.0
            self.right_gripper_cl.send_goal(gripper_goal)
            self.right_gripper_cl.wait_for_result()
            rospy.sleep(1.0)
        else:
            return 'aborted'

    def hold_pos_result_clb(self, ud, result):
        if result.success:
            # close left gripper
            gripper_goal = GripperCommandGoal()
            gripper_goal.command.position = 5.0
            self.left_gripper_cl.send_goal(gripper_goal)
            self.left_gripper_cl.wait_for_result()
            rospy.sleep(1.0)
        else:
            return 'aborted'

    def place_pos_result_clb(self, ud, result):
        if result.success:
            rospy.set_param("is_started", False)
            # release left and right gripper
            gripper_goal = GripperCommandGoal()
            gripper_goal.command.position = 100.0
            self.right_gripper_cl.send_goal(gripper_goal)
            self.right_gripper_cl.wait_for_result()
            self.left_gripper_cl.send_goal(gripper_goal)
            self.left_gripper_cl.wait_for_result()
            rospy.sleep(1.0)
        else:
            return 'aborted'

    def right_arm_up_result_clb(self, ud, result):
        if result.success:
            rospy.sleep(1.0)
        else:
            return 'aborted'

    def left_arm_up_result_clb(self, ud, result):
        if result.success:
            finished_flag = False
            if self.pick_points_number <= self.index+3:
                finished_flag = True
            rospy.sleep(1.0)
            if finished_flag:
                self.stage = 0
                self.index = 0
                return 'home'
            return 'home_inter'
        else:
            return 'aborted'

if __name__ == '__main__':
    m = main()

    m.sis.stop()
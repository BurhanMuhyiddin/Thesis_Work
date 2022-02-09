#!/usr/bin/env python

import rospy
import cv2
import actionlib
import image_geometry as ig
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image, CameraInfo
import tf2_ros
import tf2_geometry_msgs

from geometry_msgs.msg import Pose, Point, Quaternion, PoseStamped, PointStamped
from std_msgs.msg import Header

from baxter_msgs_mine.msg import GoToPointAction
from baxter_msgs_mine.msg import GoToPointGoal

import numpy as np

class IMG2WORLD:
    def __init__(self):
        self.bridge = CvBridge()

        self.cam_model = ig.PinholeCameraModel()

        self.gtp_cl = actionlib.SimpleActionClient("/go_to_goal", GoToPointAction)
        self.gtp_cl.wait_for_server(rospy.Duration(15))

        self.image_sub = rospy.Subscriber("/cameras/left_hand_camera/image", Image, self.img_clb)
        
        self.cam_info_sub = rospy.Subscriber("/cameras/left_hand_camera/camera_info", CameraInfo, self.cam_info_clb)

        self.cam_info = None

        self.desiredPix = (520, 200)

        self.sf = "left_hand_camera_axis"
        self.tf = "base"

        self.tf_buffer = tf2_ros.Buffer(rospy.Duration(100.0))  # tf buffer length
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)

        self.rate = rospy.Rate(1.0)

    def cam_info_clb(self, data):
        self.cam_info = data

    def img_clb(self, data):
        try:
            cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
        except CvBridgeError as e:
            print(e)

        if self.cam_info != None:
            self.cam_model.fromCameraInfo(self.cam_info)

            res = list(self.cam_model.projectPixelTo3dRay(self.desiredPix))
            # res[:] = [x / res[2] for x in res]

            # # print(res)

            x = res[0]
            y = res[1]
            z = 0.335984

            try:

                transform = self.tf_buffer.lookup_transform(self.tf, self.sf, rospy.Time(0))

                # gl = Pose(Point(x, y, z), Quaternion(0.0983495, 0.989932, 0.030586, 0.0970911))

                ps = PointStamped()
                ps.header.stamp = rospy.Time(0)
                ps.header.frame_id = 'left_hand_camera_axis'
                ps.point.x = x
                ps.point.y = y
                ps.point.z = z



                # hd = Header()
                # hd.frame_id = "left_hand_camera_axis"
                # goal_stamped = PoseStamped()
                # goal_stamped.header = hd
                # goal_stamped.pose = gl


                point_transformed = tf2_geometry_msgs.do_transform_point(ps, transform)
                pp = Pose()
                pp.position.x = ps.point.x
                pp.position.y = ps.point.y
                pp.position.z = ps.point.z
                pp.orientation.x = 0
                pp.orientation.y = 0
                pp.orientation.z = 0
                pp.orientation.w = 1.0
                print(pp)

                self.gtp_cl.send_goal(GoToPointGoal(pp))

                self.gtp_cl.wait_for_result()
            except (tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
                self.rate.sleep()
                pass

        cv2.imshow("mouseRGB", cv_image)
        cv2.waitKey(3)

def main():
    rospy.init_node('image_converter')
    ic = IMG2WORLD()
    try:
        rospy.spin()
    except KeyboardInterrupt:
        print("Shutting down")
    cv2.destroyAllWindows()

if __name__ == '__main__':
    main()

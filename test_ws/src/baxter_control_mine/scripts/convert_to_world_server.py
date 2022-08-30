#!/usr/bin/env python2.7

import rospy
from image_geometry import PinholeCameraModel
import tf2_ros
import tf2_geometry_msgs

import cv2
import numpy as np
import math as m

from sensor_msgs.msg import CameraInfo

from geometry_msgs.msg import PointStamped

from baxter_msgs_mine.srv import Cvt2Wrld, Cvt2WrldResponse

from threading import Lock

class ToWrldConvertSrv:
    def __init__(self):
        rospy.init_node('convert_wrld_server')


        self.convert2wrldSrv = rospy.Service('/convert_wrld', Cvt2Wrld, self.convert_to_wrld_clb)

        self.left_cam_info = None
        self.right_cam_info = None
        self.uv = {}

        self.m_camera_info = Lock()

        self.left_cam_info_sub = rospy.Subscriber("/cameras/left_hand_camera/camera_info", CameraInfo, self.left_cam_info_clb)
        # self.right_cam_info_sub = rospy.Subscriber("/cameras/right_hand_camera/camera_info", CameraInfo, self.right_cam_info_clb)

        self.tf_buffer = tf2_ros.Buffer(rospy.Duration(100.0))
        self.tf_listener = tf2_ros.TransformListener(self.tf_buffer)

        self.sf = ""
        self.tf = "base"
        
        self.table_dist = -0.120#-0.1538229

        rospy.loginfo("ToWrldConvertSrv server has been initiated...")

    def left_cam_info_clb(self, data):
        self.m_camera_info.acquire()
        self.left_cam_info = data
        self.m_camera_info.release()

    def convert_to_wrld_clb(self, req):
        img_points = req.img_points

        cam_model = PinholeCameraModel()

        world_points = []
        for x1,y1,x2,y2 in zip(img_points[0::4], img_points[1::4], img_points[2::4], img_points[3::4]):
            uv1 = (x1, y1)
            uv2 = (x2, y2)

            self.m_camera_info.acquire()
            cam_model.fromCameraInfo(self.left_cam_info)
            self.m_camera_info.release()

            cx = cam_model.cx()
            cy = cam_model.cy()
            fx = cam_model.fx()
            fy = cam_model.fy()

            self.sf = "left_hand_camera"

            while not rospy.is_shutdown():
                try:
                    transform = self.tf_buffer.lookup_transform(self.tf, self.sf, rospy.Time(0))
                    depth = abs(transform.transform.translation.z - self.table_dist)

                    uv_rect1 = cam_model.rectifyPoint(uv1)
                    uv_rect2 = cam_model.rectifyPoint(uv2)

                    u1 = uv_rect1[0]
                    v1 = uv_rect1[1]
                    u2 = uv_rect2[0]
                    v2 = uv_rect2[1]

                    wx1 = depth * (u1 - cx) / fx
                    wy1 = depth * (v1 - cy) / fy
                    wz1 = depth

                    wx2 = depth * (u2 - cx) / fx
                    wy2 = depth * (v2 - cy) / fy
                    wz2 = depth

                    ps1 = PointStamped()
                    ps1.header.stamp = rospy.Time(0)
                    ps1.header.frame_id = self.sf
                    ps1.point.x = wx1
                    ps1.point.y = wy1
                    ps1.point.z = wz1

                    ps2 = PointStamped()
                    ps2.header.stamp = rospy.Time(0)
                    ps2.header.frame_id = self.sf
                    ps2.point.x = wx2
                    ps2.point.y = wy2
                    ps2.point.z = wz2

                    point_transformed1 = tf2_geometry_msgs.do_transform_point(ps1, transform)
                    point_transformed2 = tf2_geometry_msgs.do_transform_point(ps2, transform)
                    
                    # calculate angle
                    ax1 = point_transformed1.point.x
                    ay1 = point_transformed1.point.y
                    ax2 = point_transformed2.point.x
                    ay2 = point_transformed2.point.y

                    # dy = abs( abs(ay2) - abs(ay1) )
                    # dx = abs( abs(ax2) - abs(ax1) )
                    dy = ay2 - ay1
                    dx = ax2 - ax1
                    
                    angle = m.atan2(dy, dx)
                    # angle += 0.1 * angle

                    rospy.loginfo("dy: " + str(dy))
                    rospy.loginfo("dx: " + str(dx))
                    rospy.loginfo("angle: " + str(angle))

                    world_points.append(point_transformed1.point.x)
                    world_points.append(point_transformed1.point.y)
                    world_points.append(angle)

                    break

                except(tf2_ros.LookupException, tf2_ros.ConnectivityException, tf2_ros.ExtrapolationException):
                    continue

        return Cvt2WrldResponse(wrld_points=world_points, success=True)

def main():
    tw = ToWrldConvertSrv()

    rospy.spin()

if __name__ == '__main__':
    main()
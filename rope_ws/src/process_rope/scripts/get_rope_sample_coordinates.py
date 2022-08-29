#!/home/lar/miniconda3/envs/rope_processing/bin/python

import rospy
from process_rope_msgs.srv import SampleRope, SampleRopeResponse

import sys
sys.path.remove('/opt/ros/kinetic/lib/python2.7/dist-packages')

import cv2
import numpy as np
import math as m

import torch
torch.manual_seed(0)
np.random.seed(0)

import sensor_msgs.msg
from PIL import Image

from core import DLO

from threading import Lock

from baxter_msgs_mine.srv import Cvt2Wrld
from baxter_msgs_mine.msg import CameraDebug

class SampleRopeSrv:
    def __init__(self):
        rospy.init_node('sample_rope_server')

        self.sample_rope_server = rospy.Service('/sample_rope', SampleRope, self.sample_rope_clb)
        self.image_sub = rospy.Subscriber("/cameras/left_hand_camera/image",sensor_msgs.msg.Image,self.on_images)
        self.processed_image_pub = rospy.Publisher("/processed_image", CameraDebug, queue_size=10)

        self.image = None
        self.m = Lock()

        self.target_points = None
        self.target_debug_img_mask = None

        self.low_H  =   78
        self.low_S  =   0
        self.low_V  =   0
        self.high_H =   179
        self.high_S =   255
        self.high_V =   34

        KNN = 8
        TH_EDGES_SIMILARITY = 0.1
        self.dlo = DLO(knn=KNN, th_edges_similarity=TH_EDGES_SIMILARITY)

        rospy.loginfo("SampleRopeSrv server has been initiated...")

    def generateImage(self, img_np):
        img = Image.fromarray(img_np).convert("RGB") 
        msg = sensor_msgs.msg.Image()
        msg.header.stamp = rospy.Time.now()
        msg.height = img.height
        msg.width = img.width
        msg.encoding = "rgb8"
        msg.is_bigendian = False
        msg.step = 3 * img.width
        msg.data = np.array(img).tobytes()
        return msg

    def preprocess_image(self, cv_image):
        hsv_img = cv2.cvtColor(cv_image, cv2.COLOR_BGR2HSV)
        hsv_img = cv2.GaussianBlur(hsv_img, (5, 5), 0)
        thresholded_img = cv2.inRange(hsv_img, (self.low_H, self.low_S, self.low_V), (self.high_H, self.high_S, self.high_V))

        kernel = cv2.getStructuringElement(cv2.MORPH_RECT,(3,3))
        res = cv2.morphologyEx(thresholded_img, cv2.MORPH_CLOSE, kernel)
        res = cv2.dilate(res, kernel, iterations=5)
        res = cv2.erode(res, kernel, iterations=2)

        contours, _ = cv2.findContours(res, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

        contours_perm = [cv2.arcLength(contour,True) for contour in contours]
        max_perm = max(contours_perm)

        biggest_contour = contours[contours_perm.index(max_perm)]

        return res, biggest_contour

    def sample_points(self, unsampled_points_arr, desired_sample_num):
        detected_points = []

        neighbour_offset = 2

        # step = m.floor((points_arr.shape[0] -1) * 1.0 / (desired_sample_num - 1) * 1.0)
        step = m.floor( (unsampled_points_arr.shape[0]-5.0) / (desired_sample_num-2.0+1.0) )
        # rospy.loginfo(str(points_arr.shape[0]) + ", " + str(step))

        # from first second point to the last second point
        if (unsampled_points_arr[0, 1] - unsampled_points_arr[-1, 1]) < 0:
            loop_range = [2]
            for i in range(desired_sample_num - 2):
                loop_range.append(loop_range[i] + step)
            loop_range.append(unsampled_points_arr.shape[0] - 3)

            for j in loop_range:
                detected_points.append(unsampled_points_arr[j, 1])
                detected_points.append(unsampled_points_arr[j, 0])
                if j+neighbour_offset < unsampled_points_arr.shape[0]:
                    detected_points.append(unsampled_points_arr[j+neighbour_offset, 1])
                    detected_points.append(unsampled_points_arr[j+neighbour_offset, 0])
                else:
                    detected_points.append(unsampled_points_arr[j-neighbour_offset, 1])
                    detected_points.append(unsampled_points_arr[j-neighbour_offset, 0])
        else:
            loop_range = [unsampled_points_arr.shape[0] - 3]
            for i in range(desired_sample_num - 2):
                loop_range.append(loop_range[i] - step)
            loop_range.append(2)

            for j in loop_range:
                detected_points.append(unsampled_points_arr[j, 1])
                detected_points.append(unsampled_points_arr[j, 0])
                if j-neighbour_offset >= 0:
                    detected_points.append(unsampled_points_arr[j-neighbour_offset, 1])
                    detected_points.append(unsampled_points_arr[j-neighbour_offset, 0])
                else:
                    detected_points.append(unsampled_points_arr[j+neighbour_offset, 1])
                    detected_points.append(unsampled_points_arr[j+neighbour_offset, 0])

        return detected_points

    def on_images(self, data):
        self.m.acquire()
        self.image = np.frombuffer(data.data, dtype=np.uint8).reshape(data.height, data.width, -1)
        self.m.release()

    def my_signum(self, num):
        if num < 0:
            return -1.0
        if num > 0:
            return 1.0
        return 0.0

    def sample_rope_clb(self, req):
        rospy.wait_for_service('/convert_wrld')
        convert2world = rospy.ServiceProxy('/convert_wrld', Cvt2Wrld)

        sample_target = req.sample_target

        if sample_target:
            # get target image point coordinates
            image_path = "//home//lar//ros//rope_ws//src//process_rope//target_image//target.png"
            target_img = cv2.imread(image_path, cv2.IMREAD_COLOR)
            while True:
                res_target, biggest_contour_target = self.preprocess_image(target_img)

                new_mask = np.zeros_like(res_target)
                cv2.drawContours(new_mask, [biggest_contour_target], -1, (255, 255, 255), thickness=cv2.FILLED)
                target_points_buff, _, target_image_colored_mask = self.dlo.solve(new_mask)
                if len(target_points_buff) == 0:
                    continue
                else:
                    if (target_points_buff[0].shape[0] <= 20):
                        continue
                self.target_points = target_points_buff[0]

                self.target_debug_img_mask = self.generateImage(target_image_colored_mask)
                break

        # get current image point coordinates
        while True:
            self.m.acquire()
            cv_image = np.copy(self.image)
            self.m.release()

            while (cv_image.any() == None):
                continue

            res, biggest_contour = self.preprocess_image(cv_image)

            new_mask = np.zeros_like(res)
            cv2.drawContours(new_mask, [biggest_contour], -1, (255, 255, 255), thickness=cv2.FILLED)

            current_points_buff, _, current_image_colored_mask = self.dlo.solve(new_mask)

            if len(current_points_buff) == 0:
                continue
            else:
                if current_points_buff[0].shape[0] <= 20:
                    continue

            current_points = current_points_buff[0]
            break

        current_debug_img = self.generateImage(cv_image)
        current_debug_img_mask = self.generateImage(current_image_colored_mask)

        # publish target and current debug images
        debug_msg = CameraDebug()
        debug_msg.current_img = current_debug_img
        debug_msg.target_img_mask = self.target_debug_img_mask
        debug_msg.current_img_mask = current_debug_img_mask
        self.processed_image_pub.publish(debug_msg)

        # process target and current points
        desired_sample_num = 4

        target_detected_points = self.sample_points(self.target_points, desired_sample_num)
        offset = []
        head_x = 0
        head_y = 0
        for i, (x1,y1,x2,y2) in enumerate(zip(target_detected_points[0::4], target_detected_points[1::4], target_detected_points[2::4], target_detected_points[3::4])):
            if i == 0:
                head_x = x1
                head_y = y1
            else:
                dx1 = x1 - head_x
                dy1 = y1 - head_y
                dx2 = x2 - head_x
                dy2 = y2 - head_y
                offset.append(dx1)
                offset.append(dy1)
                offset.append(dx2)
                offset.append(dy2)

        current_detected_points = self.sample_points(current_points, desired_sample_num)
        
        calculated_place_points = []
        # rospy.loginfo("offset len: " + str(len(offset)))
        for i, (x1,y1,x2,y2) in enumerate(zip(current_detected_points[0::4], current_detected_points[1::4], current_detected_points[2::4], current_detected_points[3::4])):
            if i == 0:
                head_x = x1
                head_y = y1
            else:
                place_x1 = head_x + offset[(i-1)*4]   #- (0.1 * offset[(i-1)*4])
                place_y1 = head_y + offset[(i-1)*4+1] #- (0.1 * offset[(i-1)*4+1])
                place_x2 = head_x + offset[(i-1)*4+2] #- (0.1 * offset[(i-1)*4+2])
                place_y2 = head_y + offset[(i-1)*4+3] #- (0.1 * offset[(i-1)*4+3])
                calculated_place_points.append(place_x1)
                calculated_place_points.append(place_y1)
                calculated_place_points.append(place_x2)
                calculated_place_points.append(place_y2)

        holding_limb = "left"
        # rospy.loginfo(str(points_arr[0, 1]) + ", " + str(points_arr[-1, 1]))

        target_points_resp = convert2world(img_points=calculated_place_points, limb="left")
        current_points_resp = convert2world(img_points=current_detected_points, limb="left")

        return SampleRopeResponse(sampled_target_points=target_detected_points, sampled_current_points=current_detected_points, pick_points=current_points_resp.wrld_points, pick_img_points=current_detected_points, place_points=target_points_resp.wrld_points, place_img_points=calculated_place_points, h_limb=holding_limb, success=True)

def main():
    pi_server = SampleRopeSrv()

    rospy.spin()

if __name__ == '__main__':
    main()
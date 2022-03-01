#include "ros/ros.h"
#include "std_msgs/String.h"
#include <std_msgs/Float64MultiArray.h>
#include <sensor_msgs/JointState.h>
#include <baxter_core_msgs/JointCommand.h>

#include <sstream>

ros::Publisher left_pub,right_pub,check_pub,joint_pub;

void move_right_cb(const std_msgs::Float64MultiArray & msg){
    baxter_core_msgs::JointCommand ref;
    sensor_msgs::JointState check_msg;
    check_msg.velocity.resize(7);
    ref.mode = 2;
    ref.command.resize(7);
    //ref.names.resize(7);
    for(int i=0;i<7;i++){
        ref.command[i] =msg.data[i];
        check_msg.velocity[i] = msg.data[i];
    }
    ref.names.push_back("right_s0");
    ref.names.push_back("right_s1");
    ref.names.push_back("right_e0");
    ref.names.push_back("right_e1");
    ref.names.push_back("right_w0");
    ref.names.push_back("right_w1");
    ref.names.push_back("right_w2");
    check_msg.header.stamp = ros::Time::now();
    right_pub.publish(ref);
    check_pub.publish(check_msg);
}

void move_left_cb(const std_msgs::Float64MultiArray & msg){
    baxter_core_msgs::JointCommand ref;
    ref.mode = 2;
    ref.command.resize(7);
    //ref.names.resize(7);
    for(int i=0;i<7;i++){
        ref.command[i] =msg.data[i];
    }
    ref.names.push_back("left_s0");
    ref.names.push_back("left_s1");
    ref.names.push_back("left_e0");
    ref.names.push_back("left_e1");
    ref.names.push_back("left_w0");
    ref.names.push_back("left_w1");
    ref.names.push_back("left_w2");
    left_pub.publish(ref);
}

void joint_cb(const sensor_msgs::JointState &msg){
    if (msg.name.size() > 1){
        joint_pub.publish(msg);
    }
}

/**
 * This tutorial demonstrates simple sending of messages over the ROS system.
 */
int main(int argc, char **argv)
{

  ros::init(argc, argv, "talker");

  ros::NodeHandle n;

  left_pub = n.advertise<baxter_core_msgs::JointCommand>("/robot/limb/left/joint_command", 1);
  right_pub = n.advertise<baxter_core_msgs::JointCommand>("/robot/limb/right/joint_command", 1);
  check_pub = n.advertise<sensor_msgs::JointState>("baxter_check_topic",1);
  joint_pub = n.advertise<sensor_msgs::JointState>("baxter_joint_replay",1);
  ros::Subscriber left_sub = n.subscribe("/robot/limb/left/velocity_to_baxter/command",1,move_left_cb);
  ros::Subscriber right_sub = n.subscribe("/robot/limb/right/velocity_to_baxter/command",1,move_right_cb);
  ros::Subscriber joint_sub = n.subscribe("/robot/joint_states",1,joint_cb);


  ros::spin();

  return 0;
}
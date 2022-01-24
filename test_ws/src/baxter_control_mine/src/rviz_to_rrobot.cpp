#include "ros/ros.h"
#include <array>
#include <string>
#include <sensor_msgs/JointState.h>
#include <baxter_core_msgs/JointCommand.h>
#include <actionlib_msgs/GoalStatusArray.h>

namespace
{
    const std::array<unsigned char, 7> desired_joint_indexes { {8, 9, 10, 11, 12, 13, 14} };
    bool flag = false;
    ros::Publisher left_pub;
}

void check_status_cb(const actionlib_msgs::GoalStatusArray &msg)
{
    if (!msg.status_list.empty())
    {
        flag = true;
    }
}

void get_joint_states_cb(const sensor_msgs::JointState &msg)
{
    if (flag)
    {
        baxter_core_msgs::JointCommand ref;
        ref.mode = 1; // 1 for position mode, 2 for velocity mode
        ref.command.resize(7);

        for(int i=0;i<7;i++){
            ref.command[i] = msg.position[desired_joint_indexes[i]];
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
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "rviz_converter");

    ros::NodeHandle n;

    left_pub = n.advertise<baxter_core_msgs::JointCommand>("/robot/limb/left/joint_command", 1);

    ros::Subscriber sub_joint_state = n.subscribe("/joint_states", 10, get_joint_states_cb); 
    ros::Subscriber sub_check_status = n.subscribe("/move_group/status", 10, check_status_cb);

    ros::spin();

    return 0;
}
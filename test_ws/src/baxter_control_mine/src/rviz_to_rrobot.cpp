#include "ros/ros.h"
#include <array>
#include <string>
#include <std_msgs/Float64.h>
#include <sensor_msgs/JointState.h>
#include <baxter_core_msgs/JointCommand.h>
#include <actionlib_msgs/GoalStatusArray.h>

class RvizToRobot
{
public:
    RvizToRobot(const float &timeout) : desired_timeout(timeout), spinner(2)
    {
        spinner.start();

        ROS_INFO("RvizToRobot: Has been initiated...");

        left_pub = nh.advertise<baxter_core_msgs::JointCommand>("/robot/limb/left/joint_command", 1);
        joint_command_timeout_pub = nh.advertise<std_msgs::Float64 >("/robot/limb/left/joint_command_timeout", 1);

        sub_check_status = nh.subscribe("/move_group/status", 10, &RvizToRobot::check_status_cb, this);
        sub_joint_state = nh.subscribe("/move_group/fake_controller_joint_states", 10, &RvizToRobot::get_joint_states_fake_cb, this);

        std_msgs::Float64 timeout_msg;
        timeout_msg.data = desired_timeout;
        joint_command_timeout_pub.publish(timeout_msg);

        ROS_INFO("RvizToRobot: Timeout has been set. Ready to accept commands...");
    }

    ~RvizToRobot()
    {
        ros::shutdown();
    }

    void check_status_cb(const actionlib_msgs::GoalStatusArray &msg);
    void get_joint_states_fake_cb(const sensor_msgs::JointState &msg);

private:
    const float desired_timeout;
    bool flag = false;

    ros::NodeHandle nh;
    ros::AsyncSpinner spinner;
    ros::Subscriber sub_joint_state;
    ros::Subscriber sub_check_status;
    ros::Publisher left_pub;
    ros::Publisher joint_command_timeout_pub;
};

void RvizToRobot::check_status_cb(const actionlib_msgs::GoalStatusArray &msg)
{
    if (!msg.status_list.empty())
    {
        if(!flag)
        {
            flag = true;
        }
    }
}

void RvizToRobot::get_joint_states_fake_cb(const sensor_msgs::JointState &msg)
{
    if (flag)
    {
        baxter_core_msgs::JointCommand ref;
        ref.mode = 1; // 1 for position mode, 2 for velocity mode
        ref.command.resize(7);

        for(int i=0;i<7;i++){
            ref.command[i] = msg.position[i];
        }

        ref.names.push_back("left_e0");
        ref.names.push_back("left_e1");
        ref.names.push_back("left_s0");
        ref.names.push_back("left_s1");
        ref.names.push_back("left_w0");
        ref.names.push_back("left_w1");
        ref.names.push_back("left_w2");

        left_pub.publish(ref);
    }
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "rviz_to_robot_node");

    float timeout = 30.0; // timeout for /left/jointcommand, so robot will be able to finish desired trajectory

    RvizToRobot rr(timeout);

    ros::waitForShutdown();

    return 0;
}
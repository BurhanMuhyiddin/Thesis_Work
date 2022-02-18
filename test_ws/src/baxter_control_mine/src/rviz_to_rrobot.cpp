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
    RvizToRobot(const float &timeout) : spinner(2)
    {
        spinner.start();

        ROS_INFO("RvizToRobot: Has been initiated...");

        left_pub = nh.advertise<baxter_core_msgs::JointCommand>("/robot/limb/left/joint_command", 1);
        right_pub = nh.advertise<baxter_core_msgs::JointCommand>("/robot/limb/right/joint_command", 1);

        left_arm_joint_command_timeout_pub = nh.advertise<std_msgs::Float64 >("/robot/limb/left/joint_command_timeout", 1);
        right_arm_joint_command_timeout_pub = nh.advertise<std_msgs::Float64 >("/robot/limb/right/joint_command_timeout", 1);

        sub_check_status = nh.subscribe("/move_group/status", 10, &RvizToRobot::check_status_cb, this);
        sub_joint_state = nh.subscribe("/move_group/fake_controller_joint_states", 10, &RvizToRobot::get_joint_states_fake_cb, this);

        timeout_msg.data = timeout;

        ROS_INFO("RvizToRobot: Timeout has been set. Ready to accept commands...");
    }

    ~RvizToRobot()
    {
        ros::shutdown();
    }

    void check_status_cb(const actionlib_msgs::GoalStatusArray &msg);
    void get_joint_states_fake_cb(const sensor_msgs::JointState &msg);

private:
    bool flag = false;

    ros::NodeHandle nh;
    ros::AsyncSpinner spinner;
    ros::Subscriber sub_joint_state;
    ros::Subscriber sub_check_status;
    ros::Publisher left_pub;
    ros::Publisher right_pub;
    ros::Publisher left_arm_joint_command_timeout_pub;
    ros::Publisher right_arm_joint_command_timeout_pub;
    std_msgs::Float64 timeout_msg;
};

void RvizToRobot::check_status_cb(const actionlib_msgs::GoalStatusArray &msg)
{
    if (!msg.status_list.empty())
    {
        left_arm_joint_command_timeout_pub.publish(timeout_msg);
        right_arm_joint_command_timeout_pub.publish(timeout_msg);

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
        baxter_core_msgs::JointCommand left_arm_ref;
        baxter_core_msgs::JointCommand right_arm_ref;

        std::string limb;

        ros::param::get("/limb", limb);

        left_arm_ref.command.resize(7);
        right_arm_ref.command.resize(7);

        if (limb == "left") // if limb is left, then make right as velocity mode, because its positions have been set as zero before, so it will
                            // not move. Only left arm will move. The same logic for right and both arms.
        {
            left_arm_ref.mode = 1.0;
            right_arm_ref.mode = 2.0;

            for(int i = 0; i < 7; i++)
            {
                left_arm_ref.command[i] = msg.position[i];
                right_arm_ref.command[i] = 0.0000;
            }
        }
        else if (limb == "right")
        {
            left_arm_ref.mode = 2.0;
            right_arm_ref.mode = 1.0;

            for(int i = 0; i < 7; i++)
            {
                left_arm_ref.command[i] = 0.0000;
                right_arm_ref.command[i] = msg.position[i+7];
            }
        }
        else if (limb == "both")
        {
            left_arm_ref.mode = 1.0;
            right_arm_ref.mode = 1.0;

            for(int i = 0; i < 7; i++)
            {
                left_arm_ref.command[i] = msg.position[i];
                right_arm_ref.command[i] = msg.position[i+7];
            }
        }

        left_arm_ref.names.push_back("left_e0");
        left_arm_ref.names.push_back("left_e1");
        left_arm_ref.names.push_back("left_s0");
        left_arm_ref.names.push_back("left_s1");
        left_arm_ref.names.push_back("left_w0");
        left_arm_ref.names.push_back("left_w1");
        left_arm_ref.names.push_back("left_w2");

        right_arm_ref.names.push_back("right_e0");
        right_arm_ref.names.push_back("right_e1");
        right_arm_ref.names.push_back("right_s0");
        right_arm_ref.names.push_back("right_s1");
        right_arm_ref.names.push_back("right_w0");
        right_arm_ref.names.push_back("right_w1");
        right_arm_ref.names.push_back("right_w2");

        left_pub.publish(left_arm_ref);
        right_pub.publish(right_arm_ref);
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
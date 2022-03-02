#include <ros/ros.h>

#include <baxter_msgs_mine/CalculateIK.h>

#include <geometry_msgs/Pose.h>
#include <geometry_msgs/PoseStamped.h>

#include <std_msgs/Header.h>

#include <sensor_msgs/JointState.h>

#include <baxter_core_msgs/SolvePositionIK.h>

#include <vector>

class CalculateIK
{
public:
    CalculateIK() : spinner(2)
    {
        spinner.start();

        ik_service = nh.advertiseService("/calculate_ik", &CalculateIK::calculate_ik_cb, this);
        joint_state_subs = nh.subscribe("/robot/joint_states", 10, &CalculateIK::get_current_joint_states_cb, this);

        ROS_INFO("Calculate_ik: Service server has been started...");
    }

    ~CalculateIK() 
    {
        ros::shutdown();
    }

    bool calculate_ik_cb(baxter_msgs_mine::CalculateIK::Request &req, baxter_msgs_mine::CalculateIK::Response &res);
    void get_current_joint_states_cb(const sensor_msgs::JointState &msg);

private:
    ros::NodeHandle nh;
    ros::AsyncSpinner spinner;
    ros::ServiceServer ik_service;
    ros::Subscriber joint_state_subs;
    sensor_msgs::JointState current_joint_vals;
};

void CalculateIK::get_current_joint_states_cb(const sensor_msgs::JointState &msg)
{
    current_joint_vals = std::move(msg);
}

bool CalculateIK::calculate_ik_cb(baxter_msgs_mine::CalculateIK::Request &req, baxter_msgs_mine::CalculateIK::Response &res)
{
    std::string limb = std::move(req.limb);
    std::string ns = "ExternalTools/" + limb + "/PositionKinematicsNode/IKService"; // use IK for specified limb

    ros::ServiceClient iksvc = nh.serviceClient<baxter_core_msgs::SolvePositionIK>(ns);

    baxter_core_msgs::SolvePositionIK ikreq;

    std_msgs::Header hdr;
    hdr.stamp = ros::Time::now();
    hdr.frame_id = "base";

    geometry_msgs::PoseStamped pose;
    pose.header = hdr;
    pose.pose = req.desired_pose;

    std::vector<sensor_msgs::JointState> seed_angles;
    seed_angles.push_back(std::move(current_joint_vals));

    ikreq.request.pose_stamp.push_back(std::move(pose));
    ikreq.request.seed_angles = std::move(seed_angles);

    if (iksvc.call(ikreq))
    {
        ROS_INFO("CalculateIK: Inverse Kinematics has been calculated...");
    }

    // for (int i = 0; i < ikreq.response.result_type.size(); i++)
    // {
    //     ROS_INFO("%d", ikreq.response.result_type[i]);
    // }

    std::vector<sensor_msgs::JointState> valid_joints;

    if (!ikreq.response.joints.empty())
    {
        for (int i = 0; i < ikreq.response.result_type.size(); i++)
        {
            if (!(ikreq.response.result_type[i] == ikreq.response.RESULT_INVALID))
            {
                valid_joints.push_back(ikreq.response.joints[i]);
            }
        }

        res.joints = ikreq.response.joints;
        ROS_INFO("CalculateIK: Calculated Joints have been returned...");

        return true;
    }
    else
    {
        res.joints = ikreq.response.joints;
        ROS_INFO("CalculateIK: No valid joints have been found...");

        return false;
    }

    return true;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "calculate_ik_server");

    CalculateIK cIK;

    ros::waitForShutdown();

    return 0;
}
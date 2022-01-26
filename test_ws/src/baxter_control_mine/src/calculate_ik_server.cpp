#include <ros/ros.h>

#include <baxter_control_mine/CalculateIK.h>

#include <geometry_msgs/Pose.h>
#include <geometry_msgs/PoseStamped.h>

#include <std_msgs/Header.h>

#include <sensor_msgs/JointState.h>

#include <baxter_core_msgs/SolvePositionIK.h>

#include <vector>

class CalculateIK
{
public:
    CalculateIK()
    {   
        ik_service = _nh.advertiseService("/calculate_ik", &CalculateIK::calculate_ik_cb, this);
    }

    bool calculate_ik_cb(baxter_control_mine::CalculateIK::Request &req, baxter_control_mine::CalculateIK::Response &res);

private:
    ros::NodeHandle _nh;
    ros::ServiceServer ik_service;
};

bool CalculateIK::calculate_ik_cb(baxter_control_mine::CalculateIK::Request &req, baxter_control_mine::CalculateIK::Response &res)
{
    const std::string limb = "left";

    std::string ns = "ExternalTools/" + limb + "/PositionKinematicsNode/IKService";

    ros::ServiceClient iksvc = _nh.serviceClient<baxter_core_msgs::SolvePositionIK>(ns);

    baxter_core_msgs::SolvePositionIK ikreq;

    std_msgs::Header hdr;
    hdr.stamp = ros::Time::now();
    hdr.frame_id = "base";

    geometry_msgs::PoseStamped pose;
    pose.header = hdr;
    pose.pose = req.desired_pose;

    ikreq.request.pose_stamp.push_back(pose);

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

    ros::spin();

    return 0;
}
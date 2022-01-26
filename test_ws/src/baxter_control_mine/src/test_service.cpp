#include <ros/ros.h>

#include <geometry_msgs/Pose.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Quaternion.h>

#include <std_msgs/Header.h>

#include <baxter_core_msgs/SolvePositionIK.h>
// #include <baxter_core_msgs/SolvePositionIKRequest.h>

#include <string>

bool ik_test(ros::NodeHandle &n)
{
    const std::string limb = "left";

    std::string ns = "ExternalTools/" + limb + "/PositionKinematicsNode/IKService";

    ros::ServiceClient iksvc = n.serviceClient<baxter_core_msgs::SolvePositionIK>(ns);

    baxter_core_msgs::SolvePositionIK ikreq;

    std_msgs::Header hdr;
    hdr.stamp = ros::Time::now();
    hdr.frame_id = "base";

    geometry_msgs::PoseStamped pose;
    pose.header = hdr;
    pose.pose.position.x = 1.0368; // 0.657579481614;
    pose.pose.position.y = 0.48103;// 0.851981417433;
    pose.pose.position.z = 0.2028;// 0.0388352386502;
    pose.pose.orientation.x = -0.10694;// -0.366894936773;
    pose.pose.orientation.y = 0.949063;// 0.885980397775;
    pose.pose.orientation.z = 0.0331717;// 0.108155782462;
    pose.pose.orientation.w = 0.294521;// 0.262162481772;

    ikreq.request.pose_stamp.push_back(pose);

    if (iksvc.call(ikreq))
    {
        ROS_INFO("Calculated IK...");
    }

    for (int i = 0; i < ikreq.response.result_type.size(); i++)
    {
        ROS_INFO("%d", ikreq.response.result_type[i]);
    }

    for (int i = 0; i < ikreq.response.joints.size(); i++)
    {
        for(int j = 0; j < ikreq.response.joints[i].position.size(); j++)
        {
            ROS_INFO("%f", ikreq.response.joints[i].position[j]);
        }
    }
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "rsdk_ik_service_client");
    ros::NodeHandle n;

    bool res = ik_test(n);

    ROS_INFO("res: %s", (res ? "true" : "false"));

    return 0;
}
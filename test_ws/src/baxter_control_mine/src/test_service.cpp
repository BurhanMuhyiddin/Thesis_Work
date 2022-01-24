#include <ros/ros.h>
#include "baxter_control_mine/PositionCommandMine.h"

bool command_position_clb(baxter_control_mine::PositionCommandMineRequest &req,
                            baxter_control_mine::PositionCommandMineResponse &res)
{
    ROS_INFO("request: %s\n", (req.position_command).c_str());
    res.success = true;

    return true;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "test_node");

    ros::NodeHandle n;

    ros::ServiceServer service = n.advertiseService("comand_position", command_position_clb);

    ros::spin();


    return 0;
}
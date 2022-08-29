#include <ros/ros.h>

#include <algorithm>

#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit_msgs/DisplayRobotState.h>
#include <moveit_msgs/DisplayTrajectory.h>
#include <moveit_msgs/AttachedCollisionObject.h>
#include <moveit_msgs/CollisionObject.h>
#include <moveit_visual_tools/moveit_visual_tools.h>

#include <geometry_msgs/Pose.h>

#include <baxter_core_msgs/JointCommand.h>

#include <vector>
#include <string>

static const double pi = 3.14159265359; 

class EndEffectorAdjustor
{
public:
    EndEffectorAdjustor() : as(2)
    {
        as.start();

        joint_command_pub = nh.advertise<baxter_core_msgs::JointCommand>("/robot/limb/left/joint_command", 1000);

        run();
    }

    ~EndEffectorAdjustor()
    {
        ros::shutdown();
    }

    void run();

private:
    ros::NodeHandle nh;
    ros::AsyncSpinner as;
    ros::Publisher joint_command_pub;
    bool is_started;
};

void EndEffectorAdjustor::run()
{
    // configure moveit
    std::string PLANNING_GROUP{"both_arms"};

    moveit::planning_interface::MoveGroupInterface move_group(PLANNING_GROUP);
    moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
    const robot_state::JointModelGroup* joint_model_group = move_group.getCurrentState()->getJointModelGroup(PLANNING_GROUP);

    moveit::planning_interface::MoveGroupInterface::Plan my_plan;
    bool success;

    // robot_state::RobotState start_state(*move_group.getCurrentState());
    // move_group.setStartState(start_state);

    double old_end_effector_x_pos = move_group.getCurrentPose("right_gripper").pose.position.x;

    double scale = 300.0;

    // move_group.getCurrentJointValues
    // std::vector<std::string> joint_names = move_group.getJointNames();
    // std::vector<std::string>::iterator itr = std::find(joint_names.begin(), joint_names.end(), "left_w2");
    // int desired_joint_name_index = std::distance(joint_names.begin(), itr);

    std::vector<double> left_joint_values;

    std::vector<std::string> left_joint_names = {"left_e0", "left_e1", "left_s0", "left_s1", "left_w0", "left_w1", "left_w2"};

    baxter_core_msgs::JointCommand msg;
    while(ros::ok())
    {
        if (ros::param::has("is_started"))
        {
            ros::param::get("is_started", is_started);

            if (is_started)
            {
                double diff = move_group.getCurrentPose("right_gripper").pose.position.x - old_end_effector_x_pos;
                old_end_effector_x_pos = move_group.getCurrentPose("right_gripper").pose.position.x;
                double rel_angle = -1.0 * diff * scale;
                rel_angle = rel_angle * pi / 180.0;

                std::vector<double> joint_values = std::move(move_group.getCurrentJointValues());
                for (int i = 0; i < 7; i++)
                {
                    if (i == 6)
                    {
                        left_joint_values.push_back(joint_values[i] + rel_angle);
                    }
                    else
                    {
                        left_joint_values.push_back(joint_values[i]);
                    }
                }

                msg.mode = 1;
                msg.command = left_joint_values;
                msg.names = left_joint_names;

                joint_command_pub.publish(msg);

                left_joint_values.clear();
            }
        }
    }
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "go_to_goal_service_node");

  EndEffectorAdjustor ea;

  ros::waitForShutdown();

  return 0;
}

#include <ros/ros.h>

#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit_msgs/DisplayRobotState.h>
#include <moveit_msgs/DisplayTrajectory.h>
#include <moveit_msgs/AttachedCollisionObject.h>
#include <moveit_msgs/CollisionObject.h>
#include <moveit_visual_tools/moveit_visual_tools.h>

#include <geometry_msgs/Pose.h>
#include <sensor_msgs/JointState.h>
#include <std_msgs/Float32.h>

#include "baxter_msgs_mine/GoToJointGoal.h"

#include <vector>
#include <string>

class GoToJointGoal
{
public:
  GoToJointGoal() : as(2)
  {
    as.start();

    ROS_INFO("GoToJointGoalService: GoToJointGoalService has been started...");

    go_to_joint_goal_service = nh.advertiseService("/go_to_joint_goal", &GoToJointGoal::go_to_joint_goal_clb, this);
  }

  ~GoToJointGoal()
  {
    ros::shutdown();
  }

  bool go_to_joint_goal_clb(baxter_msgs_mine::GoToJointGoalRequest &req,
                            baxter_msgs_mine::GoToJointGoalResponse &res);

private:
  ros::NodeHandle nh;
  ros::AsyncSpinner as;
  ros::ServiceServer go_to_joint_goal_service;
};

bool GoToJointGoal::go_to_joint_goal_clb(baxter_msgs_mine::GoToJointGoalRequest &req,
                              baxter_msgs_mine::GoToJointGoalResponse &res)
{
  ROS_INFO("GoToJointGoalService: Goal has been accepted...");

  // extract content of request
  const std::string limb = std::move(req.limb);
//   std::vector<std_msgs::Float32> goal = std::move(req.goal);

  // configure moveit
  std::string PLANNING_GROUP;
  if (limb == "left" || limb == "right")
  {
    PLANNING_GROUP = std::move(limb + "_arm");
  }
  else // for both arms
  {
    PLANNING_GROUP = std::move("both_arms");
  }

  moveit::planning_interface::MoveGroupInterface move_group(PLANNING_GROUP);
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const robot_state::JointModelGroup* joint_model_group = move_group.getCurrentState()->getJointModelGroup(PLANNING_GROUP);

  moveit::planning_interface::MoveGroupInterface::Plan my_plan;
  bool success;

  // get goal positions
  if (limb == "left" || limb == "right")
  {
    sensor_msgs::JointState cjs;
    cjs.name.resize(7);
    cjs.position.resize(7);
    cjs.name[0] = std::move(limb + "_e0");
    cjs.name[1] = std::move(limb + "_e1");
    cjs.name[2] = std::move(limb + "_s0");
    cjs.name[3] = std::move(limb + "_s1");
    cjs.name[4] = std::move(limb + "_w0");
    cjs.name[5] = std::move(limb + "_w1");
    cjs.name[6] = std::move(limb + "_w2");

    for (int i = 0; i < 7; i++)
    {
        cjs.position[i] = req.goal[i];
    }

    move_group.setJointValueTarget(cjs);
  }
  else // both arms
  {
    sensor_msgs::JointState cjs;
    cjs.name.resize(14);
    cjs.position.resize(14);
    cjs.name[0] = "left_e0";
    cjs.name[1] = "left_e1";
    cjs.name[2] = "left_s0";
    cjs.name[3] = "left_s1";
    cjs.name[4] = "left_w0";
    cjs.name[5] = "left_w1";
    cjs.name[6] = "left_w2";
    cjs.name[7] = "right_e0";
    cjs.name[8] = "right_e1";
    cjs.name[9] = "right_s0";
    cjs.name[10] = "right_s1";
    cjs.name[11] = "right_w0";
    cjs.name[12] = "right_w1";
    cjs.name[13] = "right_w2";

    for (int i = 0; i < 14; i++)
    {
        cjs.position[i] = req.goal[i];
    }

    move_group.setJointValueTarget(cjs);
  }

  ROS_INFO("GoToJointGoalService: Planning has been started...");

  success = (move_group.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS);

  if (success)
  {
    ROS_INFO("GoToJointGoalService: Planning finished successfully, execution has been started...");
    
    move_group.execute(my_plan);
  }

  res.success = success;

  return true;
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "go_to_joint_goal_service_node");

  GoToJointGoal gJg;

  ros::waitForShutdown();

  return 0;
}

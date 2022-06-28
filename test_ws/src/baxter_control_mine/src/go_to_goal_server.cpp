#include <ros/ros.h>

#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>
#include <moveit_msgs/DisplayRobotState.h>
#include <moveit_msgs/DisplayTrajectory.h>
#include <moveit_msgs/AttachedCollisionObject.h>
#include <moveit_msgs/CollisionObject.h>
#include <moveit_visual_tools/moveit_visual_tools.h>

#include <geometry_msgs/Pose.h>

#include "baxter_msgs_mine/GoToGoal.h"

#include <vector>
#include <string>

class GoToGoal
{
public:
  GoToGoal() : as(2)
  {
    as.start();

    ROS_INFO("GoToGoalService: GoToGoalService has been started...");

    go_to_goal_service = nh.advertiseService("/go_to_goal", &GoToGoal::go_to_goal_clb, this);
  }

  ~GoToGoal()
  {
    ros::shutdown();
  }

  bool go_to_goal_clb(baxter_msgs_mine::GoToGoalRequest &req,
                            baxter_msgs_mine::GoToGoalResponse &res);

private:
  ros::NodeHandle nh;
  ros::AsyncSpinner as;
  ros::ServiceServer go_to_goal_service;
};

bool GoToGoal::go_to_goal_clb(baxter_msgs_mine::GoToGoalRequest &req,
                              baxter_msgs_mine::GoToGoalResponse &res)
{
  ROS_INFO("GoToGoalService: Goal has been accepted...");

  // extract content of request
  bool pos_only_ik = req.pos_only_ik;
  int mode = req.mode;
  const std::string limb = std::move(req.limb);
  std::vector<geometry_msgs::Pose> goal = std::move(req.goal);

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

  ROS_INFO("GoToGoalService: I am here 1...");

  moveit::planning_interface::MoveGroupInterface move_group(PLANNING_GROUP);
  ROS_INFO("GoToGoalService: I am here 2...");
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const robot_state::JointModelGroup* joint_model_group = move_group.getCurrentState()->getJointModelGroup(PLANNING_GROUP);
  ROS_INFO("GoToGoalService: I am here 3...");

  moveit::planning_interface::MoveGroupInterface::Plan my_plan;
  bool success;

  robot_state::RobotState start_state(*move_group.getCurrentState());
  ROS_INFO("GoToGoalService: I am here 4...");
  move_group.setStartState(start_state);
  ROS_INFO("GoToGoalService: I am here 5...");

  // get goal positions
  if (limb == "left" || limb == "right")
  {
    geometry_msgs::Pose target_pose;
    target_pose = goal.front();
    const std::string ee = std::move(limb + "_gripper");

    if (mode == 0)
    {
      if (pos_only_ik)
      {
        move_group.setPositionTarget(target_pose.position.x, target_pose.position.y, target_pose.position.z, ee);
      }
      else
      {
        move_group.setPoseTarget(target_pose, ee);
      }
    }
    else if (mode == 1) // do cartesain trajectory planning
    {
      geometry_msgs::Pose initial_pose = move_group.getCurrentPose().pose;

      std::vector<geometry_msgs::Pose> waypoints;
      waypoints.push_back(initial_pose);
      waypoints.push_back(target_pose);
      
      // move_group.setMaxVelocityScalingFactor(0.1);

      moveit_msgs::RobotTrajectory trajectory;
      const double jump_threshold = 0.00;
      const double eef_step = 0.01;
      double fraction = move_group.computeCartesianPath(waypoints, eef_step, jump_threshold, trajectory);
      if (fraction != -1)
      {
        my_plan.trajectory_ = trajectory;
        success = true;
      }
      else
      {
        success = false;
      }
    }
  }
  else // both arms
  {
    geometry_msgs::Pose target_pose_left;
    geometry_msgs::Pose target_pose_right;
    target_pose_left = goal[0];
    target_pose_right = goal[1];
    if (pos_only_ik)
    {
      move_group.setPositionTarget(target_pose_left.position.x, target_pose_left.position.y, target_pose_left.position.z, "left_gripper");
      move_group.setPositionTarget(target_pose_right.position.x, target_pose_right.position.y, target_pose_right.position.z, "right_gripper");
    }
    else
    {
      ROS_INFO("GoToGoalService: I am here 6...");
      move_group.setPoseTarget(target_pose_left, "left_gripper");
      move_group.setPoseTarget(target_pose_right, "right_gripper");
      ROS_INFO("GoToGoalService: I am here 7...");
    }
  }

  ROS_INFO("GoToGoalService: Planning has been started...");

  if (mode == 0)
  {
    success = (move_group.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS);
    ROS_INFO("GoToGoalService: I am here 8...");
  }

  if (success)
  {
    ROS_INFO("GoToGoalService: Planning finished successfully, execution has been started...");
    
    move_group.execute(my_plan);
  }

  res.success = success;

  return true;
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "go_to_goal_service_node");

  GoToGoal gg;

  ros::waitForShutdown();

  return 0;
}

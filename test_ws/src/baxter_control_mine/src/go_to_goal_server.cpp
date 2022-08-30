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

  moveit::planning_interface::MoveGroupInterface move_group(PLANNING_GROUP);
  moveit::planning_interface::MoveGroupInterface move_group_left("left_arm");
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;
  const robot_state::JointModelGroup* joint_model_group = move_group.getCurrentState()->getJointModelGroup(PLANNING_GROUP);

  // namespace rvt = rviz_visual_tools;
  // moveit_visual_tools::MoveItVisualTools visual_tools("base");
  // visual_tools.deleteAllMarkers();

  // visual_tools.loadRemoteControl();

  moveit::planning_interface::MoveGroupInterface::Plan my_plan;
  bool success = false;

  robot_state::RobotState start_state(*move_group.getCurrentState());
  move_group.setStartState(start_state);
  move_group.setPlanningTime(120);
  // move_group.setNumPlanningAttempts(5);

  // get goal positions
  if (limb == "left" || limb == "right")
  {
    geometry_msgs::Pose target_pose;
    target_pose = goal.front();
    const std::string ee = std::move(limb + "_gripper");

    moveit_msgs::Constraints test_constraints;
    if (req.pos_constrained)
    {
      moveit_msgs::PositionConstraint position_constraint;
      position_constraint.header.frame_id = "base";
      position_constraint.link_name = move_group.getEndEffectorLink();
      position_constraint.target_point_offset.x = 0.1;
      position_constraint.target_point_offset.y = 0.1;
      position_constraint.target_point_offset.z = 0.1;
      position_constraint.weight = 1.0;
      int size = req.bounding_region_size;
      ROS_INFO("bounding region size = %d", size);
      if (size == 1)
      {
        geometry_msgs::Pose bounding_region_pose;
        // bounding_region_pose.position = move_group.getCurrentPose().pose.position;
        bounding_region_pose.position = move_group_left.getCurrentPose().pose.position;
        ROS_INFO("%f, %f, %f", bounding_region_pose.position.x, bounding_region_pose.position.y, bounding_region_pose.position.z);
        position_constraint.constraint_region.primitive_poses.push_back(bounding_region_pose);
        position_constraint.constraint_region.primitives.push_back(req.bounding_region[0]);

        // moveit_msgs::CollisionObject collision_object;
        // collision_object.header.frame_id = move_group.getPlanningFrame();
        // collision_object.id = "const_cone";
        // collision_object.primitives.push_back(req.bounding_region[0]);
        // collision_object.primitive_poses.push_back(bounding_region_pose);
        // collision_object.operation = collision_object.ADD;

        // std::vector<moveit_msgs::CollisionObject> collision_objects;
        // collision_objects.push_back(collision_object);

        // planning_scene_interface.addCollisionObjects(collision_objects);
        // visual_tools.trigger();

        // visual_tools.publishAxis(target_pose);
        // visual_tools.trigger();

        // visual_tools.prompt("Press 'next' in the RvizVisualToolsGui window to once the collision object appears in RViz");

        // moveit_msgs::OrientationConstraint orientation_constraint;
        // orientation_constraint.header.frame_id = "base";
        // orientation_constraint.link_name = move_group.getEndEffectorLink();
        // orientation_constraint.orientation = move_group.getCurrentPose().pose.orientation;
        // orientation_constraint.absolute_x_axis_tolerance = 0.8;
        // orientation_constraint.absolute_y_axis_tolerance = 0.8;
        // orientation_constraint.absolute_z_axis_tolerance = 0.8;
        // test_constraints.orientation_constraints.push_back(orientation_constraint);
      }
      else if (size == 2)
      {
        geometry_msgs::Pose bounding_region_pose1, bounding_region_pose2;
        bounding_region_pose1.position = move_group.getCurrentPose().pose.position;
        // bounding_region_pose2.position.x = move_group.getCurrentPose().pose.position.x;
        // bounding_region_pose2.position.y = move_group.getCurrentPose().pose.position.y;
        // bounding_region_pose2.position.z = move_group.getCurrentPose().pose.position.z + 0.1 + 50;
        position_constraint.constraint_region.primitive_poses.push_back(bounding_region_pose1);
        // position_constraint.constraint_region.primitive_poses.push_back(bounding_region_pose2);
        position_constraint.constraint_region.primitives.push_back(req.bounding_region[0]);
        // position_constraint.constraint_region.primitives.push_back(req.bounding_region[1]);
      }
      test_constraints.position_constraints.push_back(position_constraint);
    }
    if (req.orn_constrained)
    {
      moveit_msgs::OrientationConstraint orientation_constraint;
      orientation_constraint.header.frame_id = "base";
      orientation_constraint.link_name = move_group.getEndEffectorLink();
      orientation_constraint.orientation = move_group.getCurrentPose().pose.orientation;
      orientation_constraint.absolute_x_axis_tolerance = 1.5;
      orientation_constraint.absolute_y_axis_tolerance = 1.5;
      orientation_constraint.absolute_z_axis_tolerance = 1.5;
      test_constraints.orientation_constraints.push_back(orientation_constraint);
    }
    if (req.pos_constrained || req.orn_constrained)
      move_group.setPathConstraints(test_constraints);

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
      // move_group.setGoalOrientationTolerance(3.14);
      // move_group.setGoalPositionTolerance(0.01);
      moveit_msgs::OrientationConstraint oc;
      oc.header.frame_id = "base";
      oc.link_name = move_group.getEndEffectorLink();
      oc.orientation = target_pose.orientation;
      oc.absolute_x_axis_tolerance = 3.14;
      oc.absolute_y_axis_tolerance = 3.14;
      oc.absolute_z_axis_tolerance = 0.1;
      moveit_msgs::Constraints constraints;
      constraints.orientation_constraints.push_back(oc);
      // move_group.setPathConstraints(constraints);

      geometry_msgs::Pose initial_pose = move_group.getCurrentPose().pose;

      std::vector<geometry_msgs::Pose> waypoints;
      waypoints.push_back(initial_pose);
      waypoints.push_back(target_pose);
      
      // move_group.setMaxVelocityScalingFactor(0.1);

      moveit_msgs::RobotTrajectory trajectory;
      const double jump_threshold = 0.0;
      const double eef_step = 0.01;
      double fraction = move_group.computeCartesianPath(waypoints, eef_step, jump_threshold, trajectory);
      if (fraction != -1 && fraction >= 0.9)
      {
        my_plan.trajectory_ = trajectory;
        success = true;
        
        ROS_INFO("%.3lf percentage of the trajectory has been executed...", fraction);
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
      move_group.setPoseTarget(target_pose_left, "left_gripper");
      move_group.setPoseTarget(target_pose_right, "right_gripper");
    }
  }

  ROS_INFO("GoToGoalService: Planning has been started...");

  if (mode == 0)
  {
      success = (move_group.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS);
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

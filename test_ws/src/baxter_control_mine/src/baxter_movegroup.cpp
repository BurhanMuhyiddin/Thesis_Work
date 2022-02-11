#include <ros/ros.h>

#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>

#include <moveit_msgs/DisplayRobotState.h>
#include <moveit_msgs/DisplayTrajectory.h>

#include <moveit_msgs/AttachedCollisionObject.h>
#include <moveit_msgs/CollisionObject.h>

#include <moveit_visual_tools/moveit_visual_tools.h>

#include <vector>

#include "baxter_msgs_mine/PositionCommandMine.h"

class BaxterControl
{
public:
  BaxterControl(const std::string &move_group_name) : PLANNING_GROUP(move_group_name), spinner(2)
  {
    spinner.start();

    ROS_INFO("BaxterHomeWorkServer: Has been initiated...");

    move_group_interface_ptr = new moveit::planning_interface::MoveGroupInterface(PLANNING_GROUP);
    command_position_service = nh.advertiseService("/command_position", &BaxterControl::command_position_clb, this);

    add_object_to_the_scene();

    configure_planner();

    sleep(1.0);
  }

  ~BaxterControl()
  {
    delete move_group_interface_ptr;
    ros::shutdown();
  }

  void add_object_to_the_scene();

  void configure_planner();

  bool command_position_clb(baxter_msgs_mine::PositionCommandMineRequest &req,
                            baxter_msgs_mine::PositionCommandMineResponse &res);

private:
  const std::string PLANNING_GROUP;

  ros::NodeHandle nh;
  ros::AsyncSpinner spinner; // we need two threads, the second one for execution of the trajectory in callback
  ros::ServiceServer command_position_service;
  moveit::planning_interface::MoveGroupInterface *move_group_interface_ptr;
};

bool BaxterControl::command_position_clb(baxter_msgs_mine::PositionCommandMineRequest &req,
                            baxter_msgs_mine::PositionCommandMineResponse &res)
{
  if (req.position_command == "home")
  {
    ROS_INFO("BaxterHomeWorkServer: HOME is set as desired position...");
    std::vector<double> home_joint_values{0.6919, 0.0467, 0.0, 1.0495, 0.0, 0.8456, 0.0};
    move_group_interface_ptr->setJointValueTarget(home_joint_values);
  }
  else if (req.position_command == "work")
  {
    ROS_INFO("BaxterHomeWorkServer: WORK is set as desired position...");
    std::vector<double> work_joint_values{-0.561, -0.6201, 0.0, 0.683, 0.0, 0.906, 0.0};
    move_group_interface_ptr->setJointValueTarget(work_joint_values);
  }

  ROS_INFO("BaxterHomeWorkServer: Planning started...");
  moveit::planning_interface::MoveGroupInterface::Plan my_plan;
  bool success = (move_group_interface_ptr->plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS);
  ROS_INFO("BaxterHomeWorkServer: Planning finished successfully...");

  if (success)
  {
    ROS_INFO("BaxterHomeWorkServer: Trajectory is being executed...");
    move_group_interface_ptr->execute(my_plan);
    ROS_INFO("BaxterHomeWorkServer: Trajectory has been executed successfully...");
  }
  
  res.success = success;

  return true;
}

void BaxterControl::add_object_to_the_scene()
{
  moveit::planning_interface::PlanningSceneInterface planning_scene_interface;

  const robot_state::JointModelGroup* joint_model_group = move_group_interface_ptr->getCurrentState()->getJointModelGroup(PLANNING_GROUP);
  
  namespace rvt = rviz_visual_tools;
  moveit_visual_tools::MoveItVisualTools visual_tools("base");
  visual_tools.deleteAllMarkers();

  ROS_INFO("BaxterHomeWorkServer: Table object is being added...");

  moveit_msgs::CollisionObject collision_object;
  collision_object.header.frame_id = move_group_interface_ptr->getPlanningFrame();

  // The id of the object is used to identify it.
  collision_object.id = "table";

  // Define a box to add to the world.
  shape_msgs::SolidPrimitive primitive;
  primitive.type = primitive.BOX;
  primitive.dimensions.resize(3);
  primitive.dimensions[0] = 1.0;
  primitive.dimensions[1] = 0.1;
  primitive.dimensions[2] = 4.0;

  // Define a pose for the box (specified relative to base frame)
  geometry_msgs::Pose box_pose;
  box_pose.orientation.w = 0.7073883;
  box_pose.orientation.x = 0.7068252;   // RPY
  box_pose.orientation.y = 0.00;
  box_pose.orientation.z = 0.00;
  box_pose.position.x = 0.80; // this changes box's distance from robot, smaller-closer(-inf), higher-futher(+inf)  
  box_pose.position.y = -0.06;
  box_pose.position.z = -0.1538229; // this changes box's distance from gound, smaller-closer to ground(-inf), higher-closer to the air(+inf)  
                                            // take into account box thickness also
  collision_object.primitives.push_back(primitive);
  collision_object.primitive_poses.push_back(box_pose);
  collision_object.operation = collision_object.ADD;

  std::vector<moveit_msgs::CollisionObject> collision_objects;
  collision_objects.push_back(collision_object);

  planning_scene_interface.addCollisionObjects(collision_objects);

  visual_tools.trigger();
}

void BaxterControl::configure_planner()
{
  move_group_interface_ptr->setPlannerId("RRT");
  move_group_interface_ptr->setPlanningTime(5.0);
  move_group_interface_ptr->setNumPlanningAttempts(10);

  ROS_INFO("BaxterHomeWorkServer: Planneer has been configured...");
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "baxter_controller");

  BaxterControl bc("left_arm");

  ros::waitForShutdown();

  return 0;
}

#include <ros/ros.h>
#include <actionlib/server/simple_action_server.h>

#include <geometry_msgs/Pose.h>
#include <sensor_msgs/JointState.h>

#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>

#include <string>
#include <vector>

#include <baxter_msgs_mine/GoToPointAction.h>
#include <baxter_msgs_mine/GoToPointGoal.h>
#include <baxter_msgs_mine/GoToPointResult.h>
#include <baxter_msgs_mine/GoToPointFeedback.h>

#include <baxter_control_mine/CalculateIK.h>

class GoToGoal
{
protected:
    ros::NodeHandle _nh;
    actionlib::SimpleActionServer<baxter_msgs_mine::GoToPointAction> _as;
    baxter_msgs_mine::GoToPointResult _result;

public:
    GoToGoal() : _as(_nh, "/go_to_goal", boost::bind(&GoToGoal::onGoal, this, _1), false)
    {
        _as.start();
        ROS_INFO("GoToGoalActionServer: Simple Action Server has been started...");
    }

    void onGoal(const baxter_msgs_mine::GoToPointGoalConstPtr &goal)
    {
        ROS_INFO("GoToGoalActionServer: Goal received...");

        // solve inverse kinematics
        ros::ServiceClient cIKsc = _nh.serviceClient<baxter_control_mine::CalculateIK>("/calculate_ik");

        baxter_control_mine::CalculateIK cIKsrv;
        cIKsrv.request.desired_pose = goal->desired_pose;

        sensor_msgs::JointState jv;

        if (cIKsc.call(cIKsrv))
        {
            jv = cIKsrv.response.joints.front();
        }

        // plan trajectory to the desired joint values
        std::string PLANNING_GROUP = "left_arm";
        moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);

        move_group_interface.setJointValueTarget(jv);

        ROS_INFO("GoToGoalActionServer: Planning started...");
        moveit::planning_interface::MoveGroupInterface::Plan my_plan;
        bool success = (move_group_interface.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS);
        ROS_INFO("GoToGoalActionServer: Planning finished successfully...");


        bool is_preempted = false;
        // check for preemption
        if(_as.isPreemptRequested() || !ros::ok)
        {
            ROS_INFO("GoToGoalActionServer: PREEMPTED...");
            is_preempted = true;
            _as.setPreempted();
        }

        // execute the trajectory
        if (success && !is_preempted)
        {
            ROS_INFO("GoToGoalActionServer: Trajectory is being executed...");
            move_group_interface.execute(my_plan);
            _result.final_pose = goal->desired_pose;
            _as.setSucceeded(_result);
            ROS_INFO("GoToGoalActionServer: Trajectory has been executed successfully...");
        }
    }
};

int main(int argc, char **argv)
{
    ros::init(argc, argv, "go_to_goal_server_node");

    ros::AsyncSpinner spinner(2); // we need two threads, the second one for execution of the trajectory in callback
    spinner.start();

    GoToGoal gTg;

    ros::waitForShutdown();

    return 0;
}
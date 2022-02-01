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

#include <baxter_msgs_mine/CalculateIK.h>

class GoToGoal
{
public:
    GoToGoal(const std::string &planning_group) : 
            as(nh, "/go_to_goal", boost::bind(&GoToGoal::onGoal, this, _1), false), spinner(2), // we need two threads, 
                                                                                //the second one for execution of the trajectory in callback
            PLANNING_GROUP{planning_group}
    {
        spinner.start();

        as.start();
        ROS_INFO("GoToGoalActionServer: Simple Action Server has been started...");
    }

    ~GoToGoal() 
    {
        ros::shutdown();
    }

    void onGoal(const baxter_msgs_mine::GoToPointGoalConstPtr &goal);

private:
    std::string PLANNING_GROUP;

    ros::NodeHandle nh;
    ros::AsyncSpinner spinner;
    actionlib::SimpleActionServer<baxter_msgs_mine::GoToPointAction> as;
    baxter_msgs_mine::GoToPointResult result;
};

void GoToGoal::onGoal(const baxter_msgs_mine::GoToPointGoalConstPtr &goal)
{
    ROS_INFO("GoToGoalActionServer: Goal received...");

    // solve inverse kinematics
    ros::ServiceClient cIKsc = nh.serviceClient<baxter_msgs_mine::CalculateIK>("/calculate_ik");

    baxter_msgs_mine::CalculateIK cIKsrv;
    cIKsrv.request.desired_pose = goal->desired_pose;

    sensor_msgs::JointState jv;

    if (cIKsc.call(cIKsrv))
    {
        jv = cIKsrv.response.joints.front();
    }

    // plan trajectory to the desired joint values
    moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);

    move_group_interface.setJointValueTarget(jv);

    ROS_INFO("GoToGoalActionServer: Planning started...");
    moveit::planning_interface::MoveGroupInterface::Plan my_plan;
    bool success = (move_group_interface.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS);
    if (success)
        ROS_INFO("GoToGoalActionServer: Planning finished successfully...");
    else
        ROS_INFO("GoToGoalActionServer: Planning failed...");


    bool is_preempted = false;
    // check for preemption
    if(as.isPreemptRequested() || !ros::ok)
    {
        ROS_INFO("GoToGoalActionServer: PREEMPTED...");
        is_preempted = true;
        as.setPreempted();
    }

    // execute the trajectory
    if (success && !is_preempted)
    {
        ROS_INFO("GoToGoalActionServer: Trajectory is being executed...");
        move_group_interface.execute(my_plan);
        result.final_pose = goal->desired_pose;
        as.setSucceeded(result);
        ROS_INFO("GoToGoalActionServer: Trajectory has been executed successfully...");
    }
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "go_to_goal_server_node");

    GoToGoal gTg("left_arm");

    ros::waitForShutdown();

    return 0;
}
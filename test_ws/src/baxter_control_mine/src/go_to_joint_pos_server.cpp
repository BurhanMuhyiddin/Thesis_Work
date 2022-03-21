#include <ros/ros.h>
#include <actionlib/server/simple_action_server.h>

#include <geometry_msgs/Pose.h>
#include <sensor_msgs/JointState.h>

#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>

#include <string>
#include <vector>

#include <baxter_msgs_mine/GoToJointPosAction.h>
#include <baxter_msgs_mine/GoToJointPosGoal.h>
#include <baxter_msgs_mine/GoToJointPosResult.h>
#include <baxter_msgs_mine/GoToJointPosFeedback.h>

class GoToJointGoal
{
public:
    GoToJointGoal() :
            as(nh, "/go_to_joint_goal", boost::bind(&GoToJointGoal::onGoal, this, _1), false), spinner(2)
    {
        spinner.start();

        as.start();

        ROS_INFO("GoToJointGoalActionServer: Simple Action Server has been started...");
    }

    ~GoToJointGoal() 
    {
        ros::shutdown();
    }

    void onGoal(const baxter_msgs_mine::GoToJointPosGoalConstPtr &goal);

private:
    ros::NodeHandle nh;
    ros::AsyncSpinner spinner;
    actionlib::SimpleActionServer<baxter_msgs_mine::GoToJointPosAction> as;
    baxter_msgs_mine::GoToJointPosResult result;

    std::vector<double> last_commanded_joints;
    std::string last_moved_arm;
};

void GoToJointGoal::onGoal(const baxter_msgs_mine::GoToJointPosGoalConstPtr &goal)
{
    ROS_INFO("GoToJointGoalActionServer: Goal received...");

    ROS_INFO("GoToJointGoalActionServer: Planning started...");

    std::string PLANNING_GROUP = "both_arms";
    sensor_msgs::JointState cjs;

    last_commanded_joints.empty();

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

    if (goal->limb == "both")
    {
        ros::param::set("/limb", "both");

        for (int i = 0; i < 7; i++)
        {
            cjs.position[i] = goal->desired_pose[i];
            cjs.position[i+7] = goal->desired_pose[i+7];
        }
    }
    else if (goal->limb == "left")
    {
        ros::param::set("/limb", "left");

        for (int i = 0; i < 7; i++)
        {
            cjs.position[i] = goal->desired_pose[i];
            cjs.position[i+7] = 0.0000;
        }
    }
    else
    {
        ros::param::set("/limb", "right");

        for (int i = 0; i < 7; i++)
        {
            cjs.position[i] = 0.0000;
            cjs.position[i+7] = goal->desired_pose[i+7];
        }
    }

    // plan trajectory to the desired joint values
    moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);

    move_group_interface.setJointValueTarget(cjs);

    ROS_INFO("GoToJointGoalActionServer: Planning started...");
    moveit::planning_interface::MoveGroupInterface::Plan my_plan;
    try
    {
        bool success = (move_group_interface.plan(my_plan) == moveit::planning_interface::MoveItErrorCode::SUCCESS);
    }
    except(...)
    {
        result.final_pose.push_back(std::move(goal->desired_pose[0]));
        as.setSucceeded(result);
        ROS_INFO("GoToJointGoalActionServer: Don't move the robot...");
    }
    if (success)
        ROS_INFO("GoToJointGoalActionServer: Planning finished successfully...");
    else
        ROS_INFO("GoToJointGoalActionServer: Planning failed...");


    bool is_preempted = false;
    // check for preemption
    if(as.isPreemptRequested() || !ros::ok)
    {
        ROS_INFO("GoToJointGoalActionServer: PREEMPTED...");
        is_preempted = true;
        as.setPreempted();
    }

    // execute the trajectory
    if (success && !is_preempted)
    {
        ROS_INFO("GoToJointGoalActionServer: Trajectory is being executed...");
        move_group_interface.execute(my_plan);
        result.final_pose.push_back(std::move(goal->desired_pose[0]));
        as.setSucceeded(result);
        ROS_INFO("GoToJointGoalActionServer: Trajectory has been executed successfully...");
    }
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "go_to_joint_pos_server_node");

    GoToJointGoal gTJg;

    ros::waitForShutdown();

    return 0;
}
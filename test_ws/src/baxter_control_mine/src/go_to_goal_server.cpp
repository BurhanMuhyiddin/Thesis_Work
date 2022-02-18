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

#include <baxter_msgs_mine/GetCurrentJointStates.h>

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

    sensor_msgs::JointState cjs;

    cjs.name.resize(14);
    cjs.position.resize(14);

    cjs.name[0] = "left_s0";
    cjs.name[1] = "left_s1";
    cjs.name[2] = "left_e0";
    cjs.name[3] = "left_e1";
    cjs.name[4] = "left_w0";
    cjs.name[5] = "left_w1";
    cjs.name[6] = "left_w2";
    cjs.name[7] = "right_s0";
    cjs.name[8] = "right_s1";
    cjs.name[9] = "right_e0";
    cjs.name[10] = "right_e1";
    cjs.name[11] = "right_w0";
    cjs.name[12] = "right_w1";
    cjs.name[13] = "right_w2";

    // solve inverse kinematics   (left/right s0, s1, e0, e1, w0, w1, w2)
    ros::ServiceClient cIKsc = nh.serviceClient<baxter_msgs_mine::CalculateIK>("/calculate_ik");

    baxter_msgs_mine::CalculateIK cIKsrv;
    cIKsrv.request.limb = goal->limb;
    cIKsrv.request.desired_pose = goal->desired_pose;

    if (cIKsc.call(cIKsrv))
    {
        sensor_msgs::JointState jv = std::move(cIKsrv.response.joints.front());

        if (goal->limb == "right") // if we move just right arm, then make position of left arm as zero, because it will be set as velocity mode later
        {
            for (int i = 0; i < 7; i++)
            {
                cjs.position[i] = 0.0000;
                cjs.position[i+7] = jv.position[i];

                ros::param::set("/limb", "right"); // set parameter limb as right, so we know which arm to move
            }
        }
        else // if we move just left arm, then make position of right arm as zero, because it will be set as velocity mode later
        {
            for (int i = 0; i < 7; i++)
            {
                cjs.position[i] = jv.position[i];
                cjs.position[i+7] = 0.0000;

                ros::param::set("/limb", "left"); // set parameter limb as left, so we know which arm to move
            }
        }
    }

    ROS_INFO("GoToGoalActionServer: Planning started...");

    // plan trajectory to the desired joint values
    moveit::planning_interface::MoveGroupInterface move_group_interface(PLANNING_GROUP);

    move_group_interface.setJointValueTarget(cjs);

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

    GoToGoal gTg("both_arms");

    ros::waitForShutdown();

    return 0;
}
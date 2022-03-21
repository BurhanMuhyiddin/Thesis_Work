#include <ros/ros.h>
#include <actionlib/server/simple_action_server.h>

#include <geometry_msgs/Pose.h>
#include <sensor_msgs/JointState.h>

#include <moveit/move_group_interface/move_group_interface.h>
#include <moveit/planning_scene_interface/planning_scene_interface.h>

#include <string>
#include <vector>
#include <map>

#include <baxter_msgs_mine/GoToPointAction.h>
#include <baxter_msgs_mine/GoToPointGoal.h>
#include <baxter_msgs_mine/GoToPointResult.h>
#include <baxter_msgs_mine/GoToPointFeedback.h>

#include <baxter_msgs_mine/CalculateIK.h>

#include <baxter_msgs_mine/GetCurrentJointStates.h>

static const double THRESHOLD = 0.001;

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

        std::vector<double> init_left{0.712783, 0.294493, 0.43211};
        std::vector<double> init_right{0.730668, -0.412415, 0.371713};

        previous_pos["left"]  = std::move(init_left); // left arm previous pos
        previous_pos["right"] = std::move(init_right); // right arm previous pos

        ROS_INFO("GoToGoalActionServer: Simple Action Server has been started...");
    }

    ~GoToGoal() 
    {
        ros::shutdown();
    }

    void onGoal(const baxter_msgs_mine::GoToPointGoalConstPtr &goal);
    bool check_requirement(const baxter_msgs_mine::GoToPointGoalConstPtr &goal);

private:
    std::string PLANNING_GROUP;
    std::map<std::string, std::vector<double>> previous_pos;

    ros::NodeHandle nh;
    ros::AsyncSpinner spinner;
    actionlib::SimpleActionServer<baxter_msgs_mine::GoToPointAction> as;
    baxter_msgs_mine::GoToPointResult result;
};

bool GoToGoal::check_requirement(const baxter_msgs_mine::GoToPointGoalConstPtr &goal)
{
    std::vector<double> temp = std::move(previous_pos[goal->limb]);
    double prev_x = temp[0];
    double prev_y = temp[1];
    double prev_z = temp[2];

    // ROS_INFO("prev_x = %lf, prev_y = %lf, prev_z = %lf", prev_x, prev_y, prev_z);

    double robot_x = goal->desired_pose[0].position.x;
    double robot_y = goal->desired_pose[0].position.y;
    double robot_z = goal->desired_pose[0].position.z;

    // ROS_INFO("robot_x = %lf, robot_y = %lf, robot_z = %lf", robot_x, robot_y, robot_z);

    double magnitude_squared = (robot_x - prev_x)*(robot_x - prev_x) + (robot_y - prev_y)*(robot_y - prev_y) + (robot_z - prev_z)*(robot_z - prev_z);

    double magnitude = sqrt(magnitude_squared);

    // ROS_INFO("magnitude = %lf", magnitude);

    if (magnitude < THRESHOLD)
        return false;
    return true;
}

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
    ros::ServiceClient cIKsc_L = nh.serviceClient<baxter_msgs_mine::CalculateIK>("/calculate_ik");
    ros::ServiceClient cIKsc_R = nh.serviceClient<baxter_msgs_mine::CalculateIK>("/calculate_ik");

    baxter_msgs_mine::CalculateIK cIKsrv_L;
    baxter_msgs_mine::CalculateIK cIKsrv_R;

    bool res = true;

    if (goal->limb == "left")
    {
        res = check_requirement(goal);

        if (res)
        {
            cIKsrv_L.request.limb = goal->limb;
            cIKsrv_L.request.desired_pose = goal->desired_pose[0];

            if (cIKsc_L.call(cIKsrv_L))
            {
                // ROS_INFO(cIKsrv_L.response.joints.empty());
                sensor_msgs::JointState jv_L = std::move(cIKsrv_L.response.joints.front());

                for (int i = 0; i < 7; i++)
                {
                    cjs.position[i] = jv_L.position[i];
                    cjs.position[i+7] = 0.0000;

                    ros::param::set("/limb", "left"); // set parameter limb as left, so we know which arm to move
                }
            }
        }
    }
    else if (goal->limb == "right")
    {
        res = check_requirement(goal);

        if (res)
        {
            cIKsrv_R.request.limb = goal->limb;
            cIKsrv_R.request.desired_pose = goal->desired_pose[0];

            if (cIKsc_R.call(cIKsrv_R))
            {
                sensor_msgs::JointState jv_R = std::move(cIKsrv_R.response.joints.front());

                if (goal->limb == "right") // if we move just right arm, then make position of left arm as zero, because it will be set as velocity mode later
                {
                    for (int i = 0; i < 7; i++)
                    {
                        cjs.position[i] = 0.0000;
                        cjs.position[i+7] = jv_R.position[i];

                        ros::param::set("/limb", "right"); // set parameter limb as right, so we know which arm to move
                    }
                }
            }
        }
    }
    else
    {
        cIKsrv_L.request.limb = "left";
        cIKsrv_L.request.desired_pose = goal->desired_pose[0];
        cIKsrv_R.request.limb = "right";
        cIKsrv_R.request.desired_pose = goal->desired_pose[1];

        if (cIKsc_L.call(cIKsrv_L) && cIKsc_R.call(cIKsrv_R))
        {
            sensor_msgs::JointState jv_L = std::move(cIKsrv_L.response.joints.front());
            sensor_msgs::JointState jv_R = std::move(cIKsrv_R.response.joints.front());

            for (int i = 0; i < 7; i++)
            {
                cjs.position[i] = jv_L.position[i];
                cjs.position[i+7] = jv_R.position[i];

                ros::param::set("/limb", "both"); // set parameter limb as both, so we know which arm to move
            }
        }
    }

    if (res)
    {
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
            result.final_pose.push_back(std::move(goal->desired_pose[0]));
            result.final_pose.push_back(std::move(goal->desired_pose[1]));

            std::vector<double> temp{goal->desired_pose[0].position.x, 
                                    goal->desired_pose[0].position.y, 
                                    goal->desired_pose[0].position.z};
            previous_pos[goal->limb] = std::move(temp);

            as.setSucceeded(result);
            ROS_INFO("GoToGoalActionServer: Trajectory has been executed successfully...");
        }
    }
    else
    {
        result.final_pose.push_back(std::move(goal->desired_pose[0]));
        result.final_pose.push_back(std::move(goal->desired_pose[1]));

        std::vector<double> temp{goal->desired_pose[0].position.x, 
                                    goal->desired_pose[0].position.y, 
                                    goal->desired_pose[0].position.z};
        previous_pos[goal->limb] = std::move(temp);

        as.setSucceeded(result);
        ROS_INFO("GoToGoalActionServer: Trajectory is the same. So no motion...");
    }
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "go_to_goal_server_node");

    GoToGoal gTg("both_arms");

    ros::waitForShutdown();

    return 0;
}
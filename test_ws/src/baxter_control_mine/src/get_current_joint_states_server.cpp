#include <ros/ros.h>
#include <vector>

#include <mutex>

#include <sensor_msgs/JointState.h>

#include <baxter_msgs_mine/GetCurrentJointStates.h>

class GetCurrentJointState
{
public:
    GetCurrentJointState() : update_flag(false), spinner(2)
    {
        spinner.start();

        jointHandleServer = nh.advertiseService("/get_current_joint_states", &GetCurrentJointState::serve_joint_values_cb, this);
        jointHandlerSub = nh.subscribe("/robot/joint_states", 1000, &GetCurrentJointState::get_joint_values_cb, this);
    }

    bool serve_joint_values_cb(baxter_msgs_mine::GetCurrentJointStates::Request &req, baxter_msgs_mine::GetCurrentJointStates::Response &res);
    void get_joint_values_cb(const sensor_msgs::JointState::ConstPtr& msg);

    ~GetCurrentJointState()
    {
        ros::shutdown();
    }

private:
    ros::NodeHandle nh;
    ros::AsyncSpinner spinner;
    ros::ServiceServer jointHandleServer;
    ros::Subscriber jointHandlerSub;
    sensor_msgs::JointState joint_state;
    bool update_flag;
    std::mutex m;
};

void GetCurrentJointState::get_joint_values_cb(const sensor_msgs::JointState::ConstPtr& msg)
{
    joint_state = *msg;

    std::lock_guard<std::mutex> lock(m);
    update_flag = true;
}

bool GetCurrentJointState::serve_joint_values_cb(baxter_msgs_mine::GetCurrentJointStates::Request &req, baxter_msgs_mine::GetCurrentJointStates::Response &res)
{
    while(!update_flag); // wait untill joint values updated

    res.joint_state.position.resize(14);
    // left s0, s1, e0, e1, w0, w1, w2
    res.joint_state.position[0] = joint_state.position[4];
    res.joint_state.position[1] = joint_state.position[5];
    res.joint_state.position[2] = joint_state.position[2];
    res.joint_state.position[3] = joint_state.position[3];
    res.joint_state.position[4] = joint_state.position[6];
    res.joint_state.position[5] = joint_state.position[7];
    res.joint_state.position[6] = joint_state.position[8];
    
    // right s0, s1, e0, e1, w0, w1, w2
    res.joint_state.position[7] = joint_state.position[11];
    res.joint_state.position[8] = joint_state.position[12];
    res.joint_state.position[9] = joint_state.position[9];
    res.joint_state.position[10] = joint_state.position[10];
    res.joint_state.position[11] = joint_state.position[13];
    res.joint_state.position[12] = joint_state.position[14];
    res.joint_state.position[13] = joint_state.position[15];

    res.joint_state.name.resize(14);
    // left s0, s1, e0, e1, w0, w1, w2
    res.joint_state.name[0] = joint_state.name[4];
    res.joint_state.name[1] = joint_state.name[5];
    res.joint_state.name[2] = joint_state.name[2];
    res.joint_state.name[3] = joint_state.name[3];
    res.joint_state.name[4] = joint_state.name[6];
    res.joint_state.name[5] = joint_state.name[7];
    res.joint_state.name[6] = joint_state.name[8];
    
    // right s0, s1, e0, e1, w0, w1, w2
    res.joint_state.name[7] = joint_state.name[11];
    res.joint_state.name[8] = joint_state.name[12];
    res.joint_state.name[9] = joint_state.name[9];
    res.joint_state.name[10] = joint_state.name[10];
    res.joint_state.name[11] = joint_state.name[13];
    res.joint_state.name[12] = joint_state.name[14];
    res.joint_state.name[13] = joint_state.name[15];


    std::lock_guard<std::mutex> lock(m);
    update_flag = false;

    return true;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "get_current_joint_states_server_node");

    GetCurrentJointState gcjs;

    ros::waitForShutdown();

    return 0;
}
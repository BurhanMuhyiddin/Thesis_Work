#include <ros/ros.h>

#include <baxter_msgs_mine/ProcessImage.h>

class ProcessImage
{
public:
    ProcessImage()
    {
        img_process_service = nh.advertiseService("/process_img", &ProcessImage::extract_image_features_cb, this);

        ROS_INFO("Image processing server has been initiated...");
    }

    ~ProcessImage()
    {
        ros::shutdown();
    }

    bool extract_image_features_cb(baxter_msgs_mine::ProcessImage::Request &req, baxter_msgs_mine::ProcessImage::Request &res);

private:
    ros::NodeHandle nh;
    ros::ServiceServer img_process_service;
};

bool ProcessImage::extract_image_features_cb(baxter_msgs_mine::ProcessImage::Request &req, baxter_msgs_mine::ProcessImage::Request &res)
{
    ROS_INFO("Image features are being extracted...");
    ros::Duration(0.5).sleep();
    ROS_INFO("Image features have been extracted successfully...");
    return true;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "image_process_server_node");

    ProcessImage pi;

    ros::spin();

    return 0;
}


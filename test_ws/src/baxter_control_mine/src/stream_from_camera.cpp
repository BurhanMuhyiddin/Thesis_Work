#include <ros/ros.h>
#include <image_transport/image_transport.h>
#include <cv_bridge/cv_bridge.h>
#include <sensor_msgs/image_encodings.h>
#include <opencv2/core/utility.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/highgui/highgui.hpp>
#include "opencv2/imgcodecs.hpp"

static const std::string OPENCV_WINDOW = "Image window";

class ImageConverter
{
  ros::NodeHandle nh_;
  image_transport::ImageTransport it_;
  image_transport::Subscriber image_sub_;
  image_transport::Publisher image_pub_;

  cv::Mat gray_img;
  cv::Mat thresholded_img;
  cv::Mat element;

public:
  ImageConverter()
    : it_(nh_)
  {
    // Subscribe to input video feed and publish output video feed
    image_sub_ = it_.subscribe("/cameras/left_hand_camera/image", 1,
      &ImageConverter::imageCb, this);
    image_pub_ = it_.advertise("/image_converter/output_video", 1);

    cv::namedWindow(OPENCV_WINDOW);
  }

  ~ImageConverter()
  {
    cv::destroyWindow(OPENCV_WINDOW);
  }

  void imageCb(const sensor_msgs::ImageConstPtr& msg)
  {
    cv_bridge::CvImagePtr cv_ptr;
    try
    {
      cv_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
    }
    catch (cv_bridge::Exception& e)
    {
      ROS_ERROR("cv_bridge exception: %s", e.what());
      return;
    }

    cv::cvtColor(cv_ptr->image, gray_img, CV_BGR2GRAY);

    medianBlur(gray_img, gray_img, 3);

    GaussianBlur(cv_ptr->image, cv_ptr->image, cv::Size(5, 5), 0);

    // cv::threshold(gray_img, thresholded_img, 0, 255, CV_THRESH_BINARY | CV_THRESH_OTSU);
    cv::adaptiveThreshold(gray_img,thresholded_img,255,CV_ADAPTIVE_THRESH_GAUSSIAN_C,CV_THRESH_BINARY,7,11);

    cv::Mat element = cv::getStructuringElement( 0,
                      cv::Size(10, 10),
                      cv::Point(2, 2) );

    cv::erode(thresholded_img, thresholded_img, element );
    cv::morphologyEx( thresholded_img, thresholded_img, 2, element );

    cv::bitwise_not(thresholded_img, thresholded_img);

    std::vector<std::vector<cv::Point> > contours;
    std::vector<cv::Vec4i> hierarchy;
    cv::findContours(thresholded_img, contours, hierarchy, cv::RETR_TREE, cv::CHAIN_APPROX_NONE);

    std::vector<std::vector<cv::Point> > filtered_contours;

    for(int i = 0; i < contours.size(); i++)
    {
      cv::Mat mask = cv::Mat::zeros(cv_ptr->image.shape(), CV_8UC1);
      cv::Mat dst_img = cv::Mat::zeros(cv::Size(thresholded_img.cols, thresholded_img.rows), CV_8UC1);

      cv::drawContours(mask, contours[i], -1, (255), cv::FILLED);
      // gray_img.copyTo(dst_img, mask);
      // cv::Scalar mean_val = cv::mean(dst_img);
      // ROS_INFO("%f", mean_val.val[0]);
    }

    ROS_INFO("--------------------------------------");

    // for( size_t i = 0; i< contours.size(); i++ )
    // {
    //     drawContours( thresholded_img, contours, (int)i, color, 2, cv::LINE_8, hierarchy, 0 );
    // }
    // cv::Mat image_copy = thresholded_img.clone();
 
    cv::drawContours(cv_ptr->image, contours, -1, cv::Scalar(0, 255, 0), 2);

    // Update GUI Window
    cv::imshow(OPENCV_WINDOW, cv_ptr->image);
    // cv::imshow(OPENCV_WINDOW, gray_img);
    cv::waitKey(3);

    // Output modified video stream
    image_pub_.publish(cv_ptr->toImageMsg());
  }
};

int main(int argc, char** argv)
{
  ros::init(argc, argv, "image_converter");
  ImageConverter ic;
  ros::spin();
  return 0;
}
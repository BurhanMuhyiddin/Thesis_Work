// Generated by gencpp from file baxter_msgs_mine/ProcessImage.msg
// DO NOT EDIT!


#ifndef BAXTER_MSGS_MINE_MESSAGE_PROCESSIMAGE_H
#define BAXTER_MSGS_MINE_MESSAGE_PROCESSIMAGE_H

#include <ros/service_traits.h>


#include <baxter_msgs_mine/ProcessImageRequest.h>
#include <baxter_msgs_mine/ProcessImageResponse.h>


namespace baxter_msgs_mine
{

struct ProcessImage
{

typedef ProcessImageRequest Request;
typedef ProcessImageResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ProcessImage
} // namespace baxter_msgs_mine


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::baxter_msgs_mine::ProcessImage > {
  static const char* value()
  {
    return "0cd5eb6edb4597d1c4c00f6581a4729b";
  }

  static const char* value(const ::baxter_msgs_mine::ProcessImage&) { return value(); }
};

template<>
struct DataType< ::baxter_msgs_mine::ProcessImage > {
  static const char* value()
  {
    return "baxter_msgs_mine/ProcessImage";
  }

  static const char* value(const ::baxter_msgs_mine::ProcessImage&) { return value(); }
};


// service_traits::MD5Sum< ::baxter_msgs_mine::ProcessImageRequest> should match 
// service_traits::MD5Sum< ::baxter_msgs_mine::ProcessImage > 
template<>
struct MD5Sum< ::baxter_msgs_mine::ProcessImageRequest>
{
  static const char* value()
  {
    return MD5Sum< ::baxter_msgs_mine::ProcessImage >::value();
  }
  static const char* value(const ::baxter_msgs_mine::ProcessImageRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::baxter_msgs_mine::ProcessImageRequest> should match 
// service_traits::DataType< ::baxter_msgs_mine::ProcessImage > 
template<>
struct DataType< ::baxter_msgs_mine::ProcessImageRequest>
{
  static const char* value()
  {
    return DataType< ::baxter_msgs_mine::ProcessImage >::value();
  }
  static const char* value(const ::baxter_msgs_mine::ProcessImageRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::baxter_msgs_mine::ProcessImageResponse> should match 
// service_traits::MD5Sum< ::baxter_msgs_mine::ProcessImage > 
template<>
struct MD5Sum< ::baxter_msgs_mine::ProcessImageResponse>
{
  static const char* value()
  {
    return MD5Sum< ::baxter_msgs_mine::ProcessImage >::value();
  }
  static const char* value(const ::baxter_msgs_mine::ProcessImageResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::baxter_msgs_mine::ProcessImageResponse> should match 
// service_traits::DataType< ::baxter_msgs_mine::ProcessImage > 
template<>
struct DataType< ::baxter_msgs_mine::ProcessImageResponse>
{
  static const char* value()
  {
    return DataType< ::baxter_msgs_mine::ProcessImage >::value();
  }
  static const char* value(const ::baxter_msgs_mine::ProcessImageResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // BAXTER_MSGS_MINE_MESSAGE_PROCESSIMAGE_H
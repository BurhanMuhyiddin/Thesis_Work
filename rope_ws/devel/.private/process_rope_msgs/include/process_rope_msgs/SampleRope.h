// Generated by gencpp from file process_rope_msgs/SampleRope.msg
// DO NOT EDIT!


#ifndef PROCESS_ROPE_MSGS_MESSAGE_SAMPLEROPE_H
#define PROCESS_ROPE_MSGS_MESSAGE_SAMPLEROPE_H

#include <ros/service_traits.h>


#include <process_rope_msgs/SampleRopeRequest.h>
#include <process_rope_msgs/SampleRopeResponse.h>


namespace process_rope_msgs
{

struct SampleRope
{

typedef SampleRopeRequest Request;
typedef SampleRopeResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SampleRope
} // namespace process_rope_msgs


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::process_rope_msgs::SampleRope > {
  static const char* value()
  {
    return "51516dd966b40523ec3a38606b7163ae";
  }

  static const char* value(const ::process_rope_msgs::SampleRope&) { return value(); }
};

template<>
struct DataType< ::process_rope_msgs::SampleRope > {
  static const char* value()
  {
    return "process_rope_msgs/SampleRope";
  }

  static const char* value(const ::process_rope_msgs::SampleRope&) { return value(); }
};


// service_traits::MD5Sum< ::process_rope_msgs::SampleRopeRequest> should match 
// service_traits::MD5Sum< ::process_rope_msgs::SampleRope > 
template<>
struct MD5Sum< ::process_rope_msgs::SampleRopeRequest>
{
  static const char* value()
  {
    return MD5Sum< ::process_rope_msgs::SampleRope >::value();
  }
  static const char* value(const ::process_rope_msgs::SampleRopeRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::process_rope_msgs::SampleRopeRequest> should match 
// service_traits::DataType< ::process_rope_msgs::SampleRope > 
template<>
struct DataType< ::process_rope_msgs::SampleRopeRequest>
{
  static const char* value()
  {
    return DataType< ::process_rope_msgs::SampleRope >::value();
  }
  static const char* value(const ::process_rope_msgs::SampleRopeRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::process_rope_msgs::SampleRopeResponse> should match 
// service_traits::MD5Sum< ::process_rope_msgs::SampleRope > 
template<>
struct MD5Sum< ::process_rope_msgs::SampleRopeResponse>
{
  static const char* value()
  {
    return MD5Sum< ::process_rope_msgs::SampleRope >::value();
  }
  static const char* value(const ::process_rope_msgs::SampleRopeResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::process_rope_msgs::SampleRopeResponse> should match 
// service_traits::DataType< ::process_rope_msgs::SampleRope > 
template<>
struct DataType< ::process_rope_msgs::SampleRopeResponse>
{
  static const char* value()
  {
    return DataType< ::process_rope_msgs::SampleRope >::value();
  }
  static const char* value(const ::process_rope_msgs::SampleRopeResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // PROCESS_ROPE_MSGS_MESSAGE_SAMPLEROPE_H

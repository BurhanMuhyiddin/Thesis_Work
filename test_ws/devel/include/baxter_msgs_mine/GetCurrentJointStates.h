// Generated by gencpp from file baxter_msgs_mine/GetCurrentJointStates.msg
// DO NOT EDIT!


#ifndef BAXTER_MSGS_MINE_MESSAGE_GETCURRENTJOINTSTATES_H
#define BAXTER_MSGS_MINE_MESSAGE_GETCURRENTJOINTSTATES_H

#include <ros/service_traits.h>


#include <baxter_msgs_mine/GetCurrentJointStatesRequest.h>
#include <baxter_msgs_mine/GetCurrentJointStatesResponse.h>


namespace baxter_msgs_mine
{

struct GetCurrentJointStates
{

typedef GetCurrentJointStatesRequest Request;
typedef GetCurrentJointStatesResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GetCurrentJointStates
} // namespace baxter_msgs_mine


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::baxter_msgs_mine::GetCurrentJointStates > {
  static const char* value()
  {
    return "9ca061465ef0ed08771ed240c43789f5";
  }

  static const char* value(const ::baxter_msgs_mine::GetCurrentJointStates&) { return value(); }
};

template<>
struct DataType< ::baxter_msgs_mine::GetCurrentJointStates > {
  static const char* value()
  {
    return "baxter_msgs_mine/GetCurrentJointStates";
  }

  static const char* value(const ::baxter_msgs_mine::GetCurrentJointStates&) { return value(); }
};


// service_traits::MD5Sum< ::baxter_msgs_mine::GetCurrentJointStatesRequest> should match 
// service_traits::MD5Sum< ::baxter_msgs_mine::GetCurrentJointStates > 
template<>
struct MD5Sum< ::baxter_msgs_mine::GetCurrentJointStatesRequest>
{
  static const char* value()
  {
    return MD5Sum< ::baxter_msgs_mine::GetCurrentJointStates >::value();
  }
  static const char* value(const ::baxter_msgs_mine::GetCurrentJointStatesRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::baxter_msgs_mine::GetCurrentJointStatesRequest> should match 
// service_traits::DataType< ::baxter_msgs_mine::GetCurrentJointStates > 
template<>
struct DataType< ::baxter_msgs_mine::GetCurrentJointStatesRequest>
{
  static const char* value()
  {
    return DataType< ::baxter_msgs_mine::GetCurrentJointStates >::value();
  }
  static const char* value(const ::baxter_msgs_mine::GetCurrentJointStatesRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::baxter_msgs_mine::GetCurrentJointStatesResponse> should match 
// service_traits::MD5Sum< ::baxter_msgs_mine::GetCurrentJointStates > 
template<>
struct MD5Sum< ::baxter_msgs_mine::GetCurrentJointStatesResponse>
{
  static const char* value()
  {
    return MD5Sum< ::baxter_msgs_mine::GetCurrentJointStates >::value();
  }
  static const char* value(const ::baxter_msgs_mine::GetCurrentJointStatesResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::baxter_msgs_mine::GetCurrentJointStatesResponse> should match 
// service_traits::DataType< ::baxter_msgs_mine::GetCurrentJointStates > 
template<>
struct DataType< ::baxter_msgs_mine::GetCurrentJointStatesResponse>
{
  static const char* value()
  {
    return DataType< ::baxter_msgs_mine::GetCurrentJointStates >::value();
  }
  static const char* value(const ::baxter_msgs_mine::GetCurrentJointStatesResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // BAXTER_MSGS_MINE_MESSAGE_GETCURRENTJOINTSTATES_H

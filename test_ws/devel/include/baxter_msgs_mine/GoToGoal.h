// Generated by gencpp from file baxter_msgs_mine/GoToGoal.msg
// DO NOT EDIT!


#ifndef BAXTER_MSGS_MINE_MESSAGE_GOTOGOAL_H
#define BAXTER_MSGS_MINE_MESSAGE_GOTOGOAL_H

#include <ros/service_traits.h>


#include <baxter_msgs_mine/GoToGoalRequest.h>
#include <baxter_msgs_mine/GoToGoalResponse.h>


namespace baxter_msgs_mine
{

struct GoToGoal
{

typedef GoToGoalRequest Request;
typedef GoToGoalResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct GoToGoal
} // namespace baxter_msgs_mine


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::baxter_msgs_mine::GoToGoal > {
  static const char* value()
  {
    return "04d72039529027fa74e24860cee85ab7";
  }

  static const char* value(const ::baxter_msgs_mine::GoToGoal&) { return value(); }
};

template<>
struct DataType< ::baxter_msgs_mine::GoToGoal > {
  static const char* value()
  {
    return "baxter_msgs_mine/GoToGoal";
  }

  static const char* value(const ::baxter_msgs_mine::GoToGoal&) { return value(); }
};


// service_traits::MD5Sum< ::baxter_msgs_mine::GoToGoalRequest> should match 
// service_traits::MD5Sum< ::baxter_msgs_mine::GoToGoal > 
template<>
struct MD5Sum< ::baxter_msgs_mine::GoToGoalRequest>
{
  static const char* value()
  {
    return MD5Sum< ::baxter_msgs_mine::GoToGoal >::value();
  }
  static const char* value(const ::baxter_msgs_mine::GoToGoalRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::baxter_msgs_mine::GoToGoalRequest> should match 
// service_traits::DataType< ::baxter_msgs_mine::GoToGoal > 
template<>
struct DataType< ::baxter_msgs_mine::GoToGoalRequest>
{
  static const char* value()
  {
    return DataType< ::baxter_msgs_mine::GoToGoal >::value();
  }
  static const char* value(const ::baxter_msgs_mine::GoToGoalRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::baxter_msgs_mine::GoToGoalResponse> should match 
// service_traits::MD5Sum< ::baxter_msgs_mine::GoToGoal > 
template<>
struct MD5Sum< ::baxter_msgs_mine::GoToGoalResponse>
{
  static const char* value()
  {
    return MD5Sum< ::baxter_msgs_mine::GoToGoal >::value();
  }
  static const char* value(const ::baxter_msgs_mine::GoToGoalResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::baxter_msgs_mine::GoToGoalResponse> should match 
// service_traits::DataType< ::baxter_msgs_mine::GoToGoal > 
template<>
struct DataType< ::baxter_msgs_mine::GoToGoalResponse>
{
  static const char* value()
  {
    return DataType< ::baxter_msgs_mine::GoToGoal >::value();
  }
  static const char* value(const ::baxter_msgs_mine::GoToGoalResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // BAXTER_MSGS_MINE_MESSAGE_GOTOGOAL_H

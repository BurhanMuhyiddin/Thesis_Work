// Generated by gencpp from file nodelet/NodeletUnload.msg
// DO NOT EDIT!


#ifndef NODELET_MESSAGE_NODELETUNLOAD_H
#define NODELET_MESSAGE_NODELETUNLOAD_H

#include <ros/service_traits.h>


#include <nodelet/NodeletUnloadRequest.h>
#include <nodelet/NodeletUnloadResponse.h>


namespace nodelet
{

struct NodeletUnload
{

typedef NodeletUnloadRequest Request;
typedef NodeletUnloadResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct NodeletUnload
} // namespace nodelet


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::nodelet::NodeletUnload > {
  static const char* value()
  {
    return "d08a3b641c2f8680fbdfb1ea2e17a3e1";
  }

  static const char* value(const ::nodelet::NodeletUnload&) { return value(); }
};

template<>
struct DataType< ::nodelet::NodeletUnload > {
  static const char* value()
  {
    return "nodelet/NodeletUnload";
  }

  static const char* value(const ::nodelet::NodeletUnload&) { return value(); }
};


// service_traits::MD5Sum< ::nodelet::NodeletUnloadRequest> should match 
// service_traits::MD5Sum< ::nodelet::NodeletUnload > 
template<>
struct MD5Sum< ::nodelet::NodeletUnloadRequest>
{
  static const char* value()
  {
    return MD5Sum< ::nodelet::NodeletUnload >::value();
  }
  static const char* value(const ::nodelet::NodeletUnloadRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::nodelet::NodeletUnloadRequest> should match 
// service_traits::DataType< ::nodelet::NodeletUnload > 
template<>
struct DataType< ::nodelet::NodeletUnloadRequest>
{
  static const char* value()
  {
    return DataType< ::nodelet::NodeletUnload >::value();
  }
  static const char* value(const ::nodelet::NodeletUnloadRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::nodelet::NodeletUnloadResponse> should match 
// service_traits::MD5Sum< ::nodelet::NodeletUnload > 
template<>
struct MD5Sum< ::nodelet::NodeletUnloadResponse>
{
  static const char* value()
  {
    return MD5Sum< ::nodelet::NodeletUnload >::value();
  }
  static const char* value(const ::nodelet::NodeletUnloadResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::nodelet::NodeletUnloadResponse> should match 
// service_traits::DataType< ::nodelet::NodeletUnload > 
template<>
struct DataType< ::nodelet::NodeletUnloadResponse>
{
  static const char* value()
  {
    return DataType< ::nodelet::NodeletUnload >::value();
  }
  static const char* value(const ::nodelet::NodeletUnloadResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // NODELET_MESSAGE_NODELETUNLOAD_H

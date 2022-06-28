// Generated by gencpp from file topic_tools/DemuxAddResponse.msg
// DO NOT EDIT!


#ifndef TOPIC_TOOLS_MESSAGE_DEMUXADDRESPONSE_H
#define TOPIC_TOOLS_MESSAGE_DEMUXADDRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace topic_tools
{
template <class ContainerAllocator>
struct DemuxAddResponse_
{
  typedef DemuxAddResponse_<ContainerAllocator> Type;

  DemuxAddResponse_()
    {
    }
  DemuxAddResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::topic_tools::DemuxAddResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::topic_tools::DemuxAddResponse_<ContainerAllocator> const> ConstPtr;

}; // struct DemuxAddResponse_

typedef ::topic_tools::DemuxAddResponse_<std::allocator<void> > DemuxAddResponse;

typedef boost::shared_ptr< ::topic_tools::DemuxAddResponse > DemuxAddResponsePtr;
typedef boost::shared_ptr< ::topic_tools::DemuxAddResponse const> DemuxAddResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::topic_tools::DemuxAddResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::topic_tools::DemuxAddResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace topic_tools

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsMessage': True, 'IsFixedSize': True, 'HasHeader': False}
// {'std_msgs': ['/home/lar/ros/rope_ws/src/std_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__le__', '__lt__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsMessage< ::topic_tools::DemuxAddResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::topic_tools::DemuxAddResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::topic_tools::DemuxAddResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::topic_tools::DemuxAddResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::topic_tools::DemuxAddResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::topic_tools::DemuxAddResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::topic_tools::DemuxAddResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::topic_tools::DemuxAddResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::topic_tools::DemuxAddResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "topic_tools/DemuxAddResponse";
  }

  static const char* value(const ::topic_tools::DemuxAddResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::topic_tools::DemuxAddResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n\
";
  }

  static const char* value(const ::topic_tools::DemuxAddResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::topic_tools::DemuxAddResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct DemuxAddResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::topic_tools::DemuxAddResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::topic_tools::DemuxAddResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // TOPIC_TOOLS_MESSAGE_DEMUXADDRESPONSE_H
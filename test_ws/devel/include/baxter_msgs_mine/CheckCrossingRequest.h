// Generated by gencpp from file baxter_msgs_mine/CheckCrossingRequest.msg
// DO NOT EDIT!


#ifndef BAXTER_MSGS_MINE_MESSAGE_CHECKCROSSINGREQUEST_H
#define BAXTER_MSGS_MINE_MESSAGE_CHECKCROSSINGREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace baxter_msgs_mine
{
template <class ContainerAllocator>
struct CheckCrossingRequest_
{
  typedef CheckCrossingRequest_<ContainerAllocator> Type;

  CheckCrossingRequest_()
    : color()  {
    }
  CheckCrossingRequest_(const ContainerAllocator& _alloc)
    : color(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _color_type;
  _color_type color;





  typedef boost::shared_ptr< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> const> ConstPtr;

}; // struct CheckCrossingRequest_

typedef ::baxter_msgs_mine::CheckCrossingRequest_<std::allocator<void> > CheckCrossingRequest;

typedef boost::shared_ptr< ::baxter_msgs_mine::CheckCrossingRequest > CheckCrossingRequestPtr;
typedef boost::shared_ptr< ::baxter_msgs_mine::CheckCrossingRequest const> CheckCrossingRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace baxter_msgs_mine

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'baxter_msgs_mine': ['/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "89e44dcab627a2c43a70ae1100695caa";
  }

  static const char* value(const ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x89e44dcab627a2c4ULL;
  static const uint64_t static_value2 = 0x3a70ae1100695caaULL;
};

template<class ContainerAllocator>
struct DataType< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "baxter_msgs_mine/CheckCrossingRequest";
  }

  static const char* value(const ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string color\n\
";
  }

  static const char* value(const ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.color);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CheckCrossingRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::baxter_msgs_mine::CheckCrossingRequest_<ContainerAllocator>& v)
  {
    s << indent << "color: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.color);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BAXTER_MSGS_MINE_MESSAGE_CHECKCROSSINGREQUEST_H

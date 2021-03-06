// Generated by gencpp from file baxter_msgs_mine/CalculateIKRequest.msg
// DO NOT EDIT!


#ifndef BAXTER_MSGS_MINE_MESSAGE_CALCULATEIKREQUEST_H
#define BAXTER_MSGS_MINE_MESSAGE_CALCULATEIKREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Pose.h>

namespace baxter_msgs_mine
{
template <class ContainerAllocator>
struct CalculateIKRequest_
{
  typedef CalculateIKRequest_<ContainerAllocator> Type;

  CalculateIKRequest_()
    : desired_pose()
    , limb()  {
    }
  CalculateIKRequest_(const ContainerAllocator& _alloc)
    : desired_pose(_alloc)
    , limb(_alloc)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::Pose_<ContainerAllocator>  _desired_pose_type;
  _desired_pose_type desired_pose;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _limb_type;
  _limb_type limb;





  typedef boost::shared_ptr< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> const> ConstPtr;

}; // struct CalculateIKRequest_

typedef ::baxter_msgs_mine::CalculateIKRequest_<std::allocator<void> > CalculateIKRequest;

typedef boost::shared_ptr< ::baxter_msgs_mine::CalculateIKRequest > CalculateIKRequestPtr;
typedef boost::shared_ptr< ::baxter_msgs_mine::CalculateIKRequest const> CalculateIKRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace baxter_msgs_mine

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'baxter_msgs_mine': ['/home/lar/ros/test_ws/src/baxter_msgs_mine/msg', '/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "844bd63424146f6f878285d0c03bbeb2";
  }

  static const char* value(const ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x844bd63424146f6fULL;
  static const uint64_t static_value2 = 0x878285d0c03bbeb2ULL;
};

template<class ContainerAllocator>
struct DataType< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "baxter_msgs_mine/CalculateIKRequest";
  }

  static const char* value(const ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Pose desired_pose\n\
string limb\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose\n\
# A representation of pose in free space, composed of position and orientation. \n\
Point position\n\
Quaternion orientation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
";
  }

  static const char* value(const ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.desired_pose);
      stream.next(m.limb);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CalculateIKRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::baxter_msgs_mine::CalculateIKRequest_<ContainerAllocator>& v)
  {
    s << indent << "desired_pose: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "  ", v.desired_pose);
    s << indent << "limb: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.limb);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BAXTER_MSGS_MINE_MESSAGE_CALCULATEIKREQUEST_H

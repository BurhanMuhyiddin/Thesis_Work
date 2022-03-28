// Generated by gencpp from file baxter_msgs_mine/GoToGoalRequest.msg
// DO NOT EDIT!


#ifndef BAXTER_MSGS_MINE_MESSAGE_GOTOGOALREQUEST_H
#define BAXTER_MSGS_MINE_MESSAGE_GOTOGOALREQUEST_H


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
struct GoToGoalRequest_
{
  typedef GoToGoalRequest_<ContainerAllocator> Type;

  GoToGoalRequest_()
    : goal()
    , limb()
    , pos_only_ik(false)
    , mode(0)  {
    }
  GoToGoalRequest_(const ContainerAllocator& _alloc)
    : goal(_alloc)
    , limb(_alloc)
    , pos_only_ik(false)
    , mode(0)  {
  (void)_alloc;
    }



   typedef std::vector< ::geometry_msgs::Pose_<ContainerAllocator> , typename ContainerAllocator::template rebind< ::geometry_msgs::Pose_<ContainerAllocator> >::other >  _goal_type;
  _goal_type goal;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _limb_type;
  _limb_type limb;

   typedef uint8_t _pos_only_ik_type;
  _pos_only_ik_type pos_only_ik;

   typedef int8_t _mode_type;
  _mode_type mode;





  typedef boost::shared_ptr< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> const> ConstPtr;

}; // struct GoToGoalRequest_

typedef ::baxter_msgs_mine::GoToGoalRequest_<std::allocator<void> > GoToGoalRequest;

typedef boost::shared_ptr< ::baxter_msgs_mine::GoToGoalRequest > GoToGoalRequestPtr;
typedef boost::shared_ptr< ::baxter_msgs_mine::GoToGoalRequest const> GoToGoalRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "0224c030e3d1f33270c9c833db4d1c4b";
  }

  static const char* value(const ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x0224c030e3d1f332ULL;
  static const uint64_t static_value2 = 0x70c9c833db4d1c4bULL;
};

template<class ContainerAllocator>
struct DataType< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "baxter_msgs_mine/GoToGoalRequest";
  }

  static const char* value(const ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Pose[] goal\n\
string limb\n\
bool pos_only_ik\n\
int8 mode\n\
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

  static const char* value(const ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.goal);
      stream.next(m.limb);
      stream.next(m.pos_only_ik);
      stream.next(m.mode);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GoToGoalRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::baxter_msgs_mine::GoToGoalRequest_<ContainerAllocator>& v)
  {
    s << indent << "goal[]" << std::endl;
    for (size_t i = 0; i < v.goal.size(); ++i)
    {
      s << indent << "  goal[" << i << "]: ";
      s << std::endl;
      s << indent;
      Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "    ", v.goal[i]);
    }
    s << indent << "limb: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.limb);
    s << indent << "pos_only_ik: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.pos_only_ik);
    s << indent << "mode: ";
    Printer<int8_t>::stream(s, indent + "  ", v.mode);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BAXTER_MSGS_MINE_MESSAGE_GOTOGOALREQUEST_H
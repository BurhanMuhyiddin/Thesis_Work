// Generated by gencpp from file baxter_msgs_mine/GetCurrentJointStatesResponse.msg
// DO NOT EDIT!


#ifndef BAXTER_MSGS_MINE_MESSAGE_GETCURRENTJOINTSTATESRESPONSE_H
#define BAXTER_MSGS_MINE_MESSAGE_GETCURRENTJOINTSTATESRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <sensor_msgs/JointState.h>

namespace baxter_msgs_mine
{
template <class ContainerAllocator>
struct GetCurrentJointStatesResponse_
{
  typedef GetCurrentJointStatesResponse_<ContainerAllocator> Type;

  GetCurrentJointStatesResponse_()
    : joint_state()  {
    }
  GetCurrentJointStatesResponse_(const ContainerAllocator& _alloc)
    : joint_state(_alloc)  {
  (void)_alloc;
    }



   typedef  ::sensor_msgs::JointState_<ContainerAllocator>  _joint_state_type;
  _joint_state_type joint_state;





  typedef boost::shared_ptr< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> const> ConstPtr;

}; // struct GetCurrentJointStatesResponse_

typedef ::baxter_msgs_mine::GetCurrentJointStatesResponse_<std::allocator<void> > GetCurrentJointStatesResponse;

typedef boost::shared_ptr< ::baxter_msgs_mine::GetCurrentJointStatesResponse > GetCurrentJointStatesResponsePtr;
typedef boost::shared_ptr< ::baxter_msgs_mine::GetCurrentJointStatesResponse const> GetCurrentJointStatesResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9ca061465ef0ed08771ed240c43789f5";
  }

  static const char* value(const ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9ca061465ef0ed08ULL;
  static const uint64_t static_value2 = 0x771ed240c43789f5ULL;
};

template<class ContainerAllocator>
struct DataType< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "baxter_msgs_mine/GetCurrentJointStatesResponse";
  }

  static const char* value(const ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sensor_msgs/JointState joint_state\n\
\n\
================================================================================\n\
MSG: sensor_msgs/JointState\n\
# This is a message that holds data to describe the state of a set of torque controlled joints. \n\
#\n\
# The state of each joint (revolute or prismatic) is defined by:\n\
#  * the position of the joint (rad or m),\n\
#  * the velocity of the joint (rad/s or m/s) and \n\
#  * the effort that is applied in the joint (Nm or N).\n\
#\n\
# Each joint is uniquely identified by its name\n\
# The header specifies the time at which the joint states were recorded. All the joint states\n\
# in one message have to be recorded at the same time.\n\
#\n\
# This message consists of a multiple arrays, one for each part of the joint state. \n\
# The goal is to make each of the fields optional. When e.g. your joints have no\n\
# effort associated with them, you can leave the effort array empty. \n\
#\n\
# All arrays in this message should have the same size, or be empty.\n\
# This is the only way to uniquely associate the joint name with the correct\n\
# states.\n\
\n\
\n\
Header header\n\
\n\
string[] name\n\
float64[] position\n\
float64[] velocity\n\
float64[] effort\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
";
  }

  static const char* value(const ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.joint_state);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetCurrentJointStatesResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::baxter_msgs_mine::GetCurrentJointStatesResponse_<ContainerAllocator>& v)
  {
    s << indent << "joint_state: ";
    s << std::endl;
    Printer< ::sensor_msgs::JointState_<ContainerAllocator> >::stream(s, indent + "  ", v.joint_state);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BAXTER_MSGS_MINE_MESSAGE_GETCURRENTJOINTSTATESRESPONSE_H

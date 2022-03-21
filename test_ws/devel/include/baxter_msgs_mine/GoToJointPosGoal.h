// Generated by gencpp from file baxter_msgs_mine/GoToJointPosGoal.msg
// DO NOT EDIT!


#ifndef BAXTER_MSGS_MINE_MESSAGE_GOTOJOINTPOSGOAL_H
#define BAXTER_MSGS_MINE_MESSAGE_GOTOJOINTPOSGOAL_H


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
struct GoToJointPosGoal_
{
  typedef GoToJointPosGoal_<ContainerAllocator> Type;

  GoToJointPosGoal_()
    : desired_pose()
    , limb()  {
    }
  GoToJointPosGoal_(const ContainerAllocator& _alloc)
    : desired_pose(_alloc)
    , limb(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<float, typename ContainerAllocator::template rebind<float>::other >  _desired_pose_type;
  _desired_pose_type desired_pose;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _limb_type;
  _limb_type limb;





  typedef boost::shared_ptr< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> const> ConstPtr;

}; // struct GoToJointPosGoal_

typedef ::baxter_msgs_mine::GoToJointPosGoal_<std::allocator<void> > GoToJointPosGoal;

typedef boost::shared_ptr< ::baxter_msgs_mine::GoToJointPosGoal > GoToJointPosGoalPtr;
typedef boost::shared_ptr< ::baxter_msgs_mine::GoToJointPosGoal const> GoToJointPosGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b4a71d5db17a0134d8420bee776225cd";
  }

  static const char* value(const ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb4a71d5db17a0134ULL;
  static const uint64_t static_value2 = 0xd8420bee776225cdULL;
};

template<class ContainerAllocator>
struct DataType< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "baxter_msgs_mine/GoToJointPosGoal";
  }

  static const char* value(const ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
#goal\n\
float32[] desired_pose\n\
string limb\n\
";
  }

  static const char* value(const ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.desired_pose);
      stream.next(m.limb);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GoToJointPosGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::baxter_msgs_mine::GoToJointPosGoal_<ContainerAllocator>& v)
  {
    s << indent << "desired_pose[]" << std::endl;
    for (size_t i = 0; i < v.desired_pose.size(); ++i)
    {
      s << indent << "  desired_pose[" << i << "]: ";
      Printer<float>::stream(s, indent + "  ", v.desired_pose[i]);
    }
    s << indent << "limb: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.limb);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BAXTER_MSGS_MINE_MESSAGE_GOTOJOINTPOSGOAL_H

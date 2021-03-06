// Generated by gencpp from file move_rt/TaskParamUpdateRequest.msg
// DO NOT EDIT!


#ifndef MOVE_RT_MESSAGE_TASKPARAMUPDATEREQUEST_H
#define MOVE_RT_MESSAGE_TASKPARAMUPDATEREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace move_rt
{
template <class ContainerAllocator>
struct TaskParamUpdateRequest_
{
  typedef TaskParamUpdateRequest_<ContainerAllocator> Type;

  TaskParamUpdateRequest_()
    : data()  {
    }
  TaskParamUpdateRequest_(const ContainerAllocator& _alloc)
    : data(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<double, typename ContainerAllocator::template rebind<double>::other >  _data_type;
  _data_type data;





  typedef boost::shared_ptr< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> const> ConstPtr;

}; // struct TaskParamUpdateRequest_

typedef ::move_rt::TaskParamUpdateRequest_<std::allocator<void> > TaskParamUpdateRequest;

typedef boost::shared_ptr< ::move_rt::TaskParamUpdateRequest > TaskParamUpdateRequestPtr;
typedef boost::shared_ptr< ::move_rt::TaskParamUpdateRequest const> TaskParamUpdateRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace move_rt

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'move_rt': ['/home/lar/ros/baxter_ws/devel/share/move_rt/msg', '/home/lar/ros/baxter_ws/devel/share/move_rt/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "788898178a3da2c3718461eecda8f714";
  }

  static const char* value(const ::move_rt::TaskParamUpdateRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x788898178a3da2c3ULL;
  static const uint64_t static_value2 = 0x718461eecda8f714ULL;
};

template<class ContainerAllocator>
struct DataType< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "move_rt/TaskParamUpdateRequest";
  }

  static const char* value(const ::move_rt::TaskParamUpdateRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64[] data\n\
";
  }

  static const char* value(const ::move_rt::TaskParamUpdateRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.data);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct TaskParamUpdateRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::move_rt::TaskParamUpdateRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::move_rt::TaskParamUpdateRequest_<ContainerAllocator>& v)
  {
    s << indent << "data[]" << std::endl;
    for (size_t i = 0; i < v.data.size(); ++i)
    {
      s << indent << "  data[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.data[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOVE_RT_MESSAGE_TASKPARAMUPDATEREQUEST_H

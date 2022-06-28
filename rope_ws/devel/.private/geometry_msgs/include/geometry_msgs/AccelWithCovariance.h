// Generated by gencpp from file geometry_msgs/AccelWithCovariance.msg
// DO NOT EDIT!


#ifndef GEOMETRY_MSGS_MESSAGE_ACCELWITHCOVARIANCE_H
#define GEOMETRY_MSGS_MESSAGE_ACCELWITHCOVARIANCE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Accel.h>

namespace geometry_msgs
{
template <class ContainerAllocator>
struct AccelWithCovariance_
{
  typedef AccelWithCovariance_<ContainerAllocator> Type;

  AccelWithCovariance_()
    : accel()
    , covariance()  {
      covariance.assign(0.0);
  }
  AccelWithCovariance_(const ContainerAllocator& _alloc)
    : accel(_alloc)
    , covariance()  {
  (void)_alloc;
      covariance.assign(0.0);
  }



   typedef  ::geometry_msgs::Accel_<ContainerAllocator>  _accel_type;
  _accel_type accel;

   typedef boost::array<double, 36>  _covariance_type;
  _covariance_type covariance;





  typedef boost::shared_ptr< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> const> ConstPtr;

}; // struct AccelWithCovariance_

typedef ::geometry_msgs::AccelWithCovariance_<std::allocator<void> > AccelWithCovariance;

typedef boost::shared_ptr< ::geometry_msgs::AccelWithCovariance > AccelWithCovariancePtr;
typedef boost::shared_ptr< ::geometry_msgs::AccelWithCovariance const> AccelWithCovarianceConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace geometry_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsMessage': True, 'IsFixedSize': True, 'HasHeader': False}
// {'geometry_msgs': ['/home/lar/ros/rope_ws/src/common_msgs/geometry_msgs/msg'], 'std_msgs': ['/home/lar/ros/rope_ws/src/std_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__dir__', '__doc__', '__eq__', '__format__', '__ge__', '__getattribute__', '__gt__', '__hash__', '__init__', '__init_subclass__', '__le__', '__lt__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsMessage< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> >
{
  static const char* value()
  {
    return "ad5a718d699c6be72a02b8d6a139f334";
  }

  static const char* value(const ::geometry_msgs::AccelWithCovariance_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xad5a718d699c6be7ULL;
  static const uint64_t static_value2 = 0x2a02b8d6a139f334ULL;
};

template<class ContainerAllocator>
struct DataType< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/AccelWithCovariance";
  }

  static const char* value(const ::geometry_msgs::AccelWithCovariance_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# This expresses acceleration in free space with uncertainty.\n\
\n\
Accel accel\n\
\n\
# Row-major representation of the 6x6 covariance matrix\n\
# The orientation parameters use a fixed-axis representation.\n\
# In order, the parameters are:\n\
# (x, y, z, rotation about X axis, rotation about Y axis, rotation about Z axis)\n\
float64[36] covariance\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Accel\n\
# This expresses acceleration in free space broken into its linear and angular parts.\n\
Vector3  linear\n\
Vector3  angular\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Vector3\n\
# This represents a vector in free space. \n\
# It is only meant to represent a direction. Therefore, it does not\n\
# make sense to apply a translation to it (e.g., when applying a \n\
# generic rigid transformation to a Vector3, tf2 will only apply the\n\
# rotation). If you want your data to be translatable too, use the\n\
# geometry_msgs/Point message instead.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
";
  }

  static const char* value(const ::geometry_msgs::AccelWithCovariance_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.accel);
      stream.next(m.covariance);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct AccelWithCovariance_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::geometry_msgs::AccelWithCovariance_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::geometry_msgs::AccelWithCovariance_<ContainerAllocator>& v)
  {
    s << indent << "accel: ";
    s << std::endl;
    Printer< ::geometry_msgs::Accel_<ContainerAllocator> >::stream(s, indent + "  ", v.accel);
    s << indent << "covariance[]" << std::endl;
    for (size_t i = 0; i < v.covariance.size(); ++i)
    {
      s << indent << "  covariance[" << i << "]: ";
      Printer<double>::stream(s, indent + "  ", v.covariance[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // GEOMETRY_MSGS_MESSAGE_ACCELWITHCOVARIANCE_H

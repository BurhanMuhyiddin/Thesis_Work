// Generated by gencpp from file baxter_msgs_mine/CameraDebug.msg
// DO NOT EDIT!


#ifndef BAXTER_MSGS_MINE_MESSAGE_CAMERADEBUG_H
#define BAXTER_MSGS_MINE_MESSAGE_CAMERADEBUG_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <sensor_msgs/Image.h>
#include <sensor_msgs/Image.h>
#include <sensor_msgs/Image.h>

namespace baxter_msgs_mine
{
template <class ContainerAllocator>
struct CameraDebug_
{
  typedef CameraDebug_<ContainerAllocator> Type;

  CameraDebug_()
    : current_img()
    , target_img_mask()
    , current_img_mask()  {
    }
  CameraDebug_(const ContainerAllocator& _alloc)
    : current_img(_alloc)
    , target_img_mask(_alloc)
    , current_img_mask(_alloc)  {
  (void)_alloc;
    }



   typedef  ::sensor_msgs::Image_<ContainerAllocator>  _current_img_type;
  _current_img_type current_img;

   typedef  ::sensor_msgs::Image_<ContainerAllocator>  _target_img_mask_type;
  _target_img_mask_type target_img_mask;

   typedef  ::sensor_msgs::Image_<ContainerAllocator>  _current_img_mask_type;
  _current_img_mask_type current_img_mask;





  typedef boost::shared_ptr< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> const> ConstPtr;

}; // struct CameraDebug_

typedef ::baxter_msgs_mine::CameraDebug_<std::allocator<void> > CameraDebug;

typedef boost::shared_ptr< ::baxter_msgs_mine::CameraDebug > CameraDebugPtr;
typedef boost::shared_ptr< ::baxter_msgs_mine::CameraDebug const> CameraDebugConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> >
{
  static const char* value()
  {
    return "10aed15b2704434d6ba0464fd75c0420";
  }

  static const char* value(const ::baxter_msgs_mine::CameraDebug_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x10aed15b2704434dULL;
  static const uint64_t static_value2 = 0x6ba0464fd75c0420ULL;
};

template<class ContainerAllocator>
struct DataType< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> >
{
  static const char* value()
  {
    return "baxter_msgs_mine/CameraDebug";
  }

  static const char* value(const ::baxter_msgs_mine::CameraDebug_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sensor_msgs/Image current_img\n\
sensor_msgs/Image target_img_mask\n\
sensor_msgs/Image current_img_mask\n\
================================================================================\n\
MSG: sensor_msgs/Image\n\
# This message contains an uncompressed image\n\
# (0, 0) is at top-left corner of image\n\
#\n\
\n\
Header header        # Header timestamp should be acquisition time of image\n\
                     # Header frame_id should be optical frame of camera\n\
                     # origin of frame should be optical center of camera\n\
                     # +x should point to the right in the image\n\
                     # +y should point down in the image\n\
                     # +z should point into to plane of the image\n\
                     # If the frame_id here and the frame_id of the CameraInfo\n\
                     # message associated with the image conflict\n\
                     # the behavior is undefined\n\
\n\
uint32 height         # image height, that is, number of rows\n\
uint32 width          # image width, that is, number of columns\n\
\n\
# The legal values for encoding are in file src/image_encodings.cpp\n\
# If you want to standardize a new string format, join\n\
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.\n\
\n\
string encoding       # Encoding of pixels -- channel meaning, ordering, size\n\
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h\n\
\n\
uint8 is_bigendian    # is this data bigendian?\n\
uint32 step           # Full row length in bytes\n\
uint8[] data          # actual matrix data, size is (step * rows)\n\
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

  static const char* value(const ::baxter_msgs_mine::CameraDebug_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.current_img);
      stream.next(m.target_img_mask);
      stream.next(m.current_img_mask);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CameraDebug_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::baxter_msgs_mine::CameraDebug_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::baxter_msgs_mine::CameraDebug_<ContainerAllocator>& v)
  {
    s << indent << "current_img: ";
    s << std::endl;
    Printer< ::sensor_msgs::Image_<ContainerAllocator> >::stream(s, indent + "  ", v.current_img);
    s << indent << "target_img_mask: ";
    s << std::endl;
    Printer< ::sensor_msgs::Image_<ContainerAllocator> >::stream(s, indent + "  ", v.target_img_mask);
    s << indent << "current_img_mask: ";
    s << std::endl;
    Printer< ::sensor_msgs::Image_<ContainerAllocator> >::stream(s, indent + "  ", v.current_img_mask);
  }
};

} // namespace message_operations
} // namespace ros

#endif // BAXTER_MSGS_MINE_MESSAGE_CAMERADEBUG_H

// Generated by gencpp from file move_rt/ExecutingTrajectoryAction.msg
// DO NOT EDIT!


#ifndef MOVE_RT_MESSAGE_EXECUTINGTRAJECTORYACTION_H
#define MOVE_RT_MESSAGE_EXECUTINGTRAJECTORYACTION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <move_rt/ExecutingTrajectoryActionGoal.h>
#include <move_rt/ExecutingTrajectoryActionResult.h>
#include <move_rt/ExecutingTrajectoryActionFeedback.h>

namespace move_rt
{
template <class ContainerAllocator>
struct ExecutingTrajectoryAction_
{
  typedef ExecutingTrajectoryAction_<ContainerAllocator> Type;

  ExecutingTrajectoryAction_()
    : action_goal()
    , action_result()
    , action_feedback()  {
    }
  ExecutingTrajectoryAction_(const ContainerAllocator& _alloc)
    : action_goal(_alloc)
    , action_result(_alloc)
    , action_feedback(_alloc)  {
  (void)_alloc;
    }



   typedef  ::move_rt::ExecutingTrajectoryActionGoal_<ContainerAllocator>  _action_goal_type;
  _action_goal_type action_goal;

   typedef  ::move_rt::ExecutingTrajectoryActionResult_<ContainerAllocator>  _action_result_type;
  _action_result_type action_result;

   typedef  ::move_rt::ExecutingTrajectoryActionFeedback_<ContainerAllocator>  _action_feedback_type;
  _action_feedback_type action_feedback;





  typedef boost::shared_ptr< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> const> ConstPtr;

}; // struct ExecutingTrajectoryAction_

typedef ::move_rt::ExecutingTrajectoryAction_<std::allocator<void> > ExecutingTrajectoryAction;

typedef boost::shared_ptr< ::move_rt::ExecutingTrajectoryAction > ExecutingTrajectoryActionPtr;
typedef boost::shared_ptr< ::move_rt::ExecutingTrajectoryAction const> ExecutingTrajectoryActionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "38d685692801155402553f9de30e4b85";
  }

  static const char* value(const ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x38d6856928011554ULL;
  static const uint64_t static_value2 = 0x02553f9de30e4b85ULL;
};

template<class ContainerAllocator>
struct DataType< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "move_rt/ExecutingTrajectoryAction";
  }

  static const char* value(const ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
\n\
ExecutingTrajectoryActionGoal action_goal\n\
ExecutingTrajectoryActionResult action_result\n\
ExecutingTrajectoryActionFeedback action_feedback\n\
\n\
================================================================================\n\
MSG: move_rt/ExecutingTrajectoryActionGoal\n\
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
\n\
Header header\n\
actionlib_msgs/GoalID goal_id\n\
ExecutingTrajectoryGoal goal\n\
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
\n\
================================================================================\n\
MSG: actionlib_msgs/GoalID\n\
# The stamp should store the time at which this goal was requested.\n\
# It is used by an action server when it tries to preempt all\n\
# goals that were requested before a certain time\n\
time stamp\n\
\n\
# The id provides a way to associate feedback and\n\
# result message with specific goal requests. The id\n\
# specified must be unique.\n\
string id\n\
\n\
\n\
================================================================================\n\
MSG: move_rt/ExecutingTrajectoryGoal\n\
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
# Define the goal\n\
string trajectory_name\n\
float64 ee_error_th  # Specify error threshold\n\
\n\
================================================================================\n\
MSG: move_rt/ExecutingTrajectoryActionResult\n\
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
\n\
Header header\n\
actionlib_msgs/GoalStatus status\n\
ExecutingTrajectoryResult result\n\
\n\
================================================================================\n\
MSG: actionlib_msgs/GoalStatus\n\
GoalID goal_id\n\
uint8 status\n\
uint8 PENDING         = 0   # The goal has yet to be processed by the action server\n\
uint8 ACTIVE          = 1   # The goal is currently being processed by the action server\n\
uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing\n\
                            #   and has since completed its execution (Terminal State)\n\
uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)\n\
uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due\n\
                            #    to some failure (Terminal State)\n\
uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,\n\
                            #    because the goal was unattainable or invalid (Terminal State)\n\
uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing\n\
                            #    and has not yet completed execution\n\
uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,\n\
                            #    but the action server has not yet confirmed that the goal is canceled\n\
uint8 RECALLED        = 8   # The goal received a cancel request before it started executing\n\
                            #    and was successfully cancelled (Terminal State)\n\
uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be\n\
                            #    sent over the wire by an action server\n\
\n\
#Allow for the user to associate a string with GoalStatus for debugging\n\
string text\n\
\n\
\n\
================================================================================\n\
MSG: move_rt/ExecutingTrajectoryResult\n\
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
# Define the result\n\
int32 error_code\n\
int32 SUCCESSFUL = 0\n\
int32 INVALID_GOAL = -1\n\
int32 INVALID_JOINTS = -2\n\
int32 OLD_HEADER_TIMESTAMP = -3\n\
int32 PATH_TOLERANCE_VIOLATED = -4\n\
int32 GOAL_TOLERANCE_VIOLATED = -5\n\
\n\
================================================================================\n\
MSG: move_rt/ExecutingTrajectoryActionFeedback\n\
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
\n\
Header header\n\
actionlib_msgs/GoalStatus status\n\
ExecutingTrajectoryFeedback feedback\n\
\n\
================================================================================\n\
MSG: move_rt/ExecutingTrajectoryFeedback\n\
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
# Define a feedback message\n\
float64 percent_complete\n\
\n\
";
  }

  static const char* value(const ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.action_goal);
      stream.next(m.action_result);
      stream.next(m.action_feedback);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ExecutingTrajectoryAction_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::move_rt::ExecutingTrajectoryAction_<ContainerAllocator>& v)
  {
    s << indent << "action_goal: ";
    s << std::endl;
    Printer< ::move_rt::ExecutingTrajectoryActionGoal_<ContainerAllocator> >::stream(s, indent + "  ", v.action_goal);
    s << indent << "action_result: ";
    s << std::endl;
    Printer< ::move_rt::ExecutingTrajectoryActionResult_<ContainerAllocator> >::stream(s, indent + "  ", v.action_result);
    s << indent << "action_feedback: ";
    s << std::endl;
    Printer< ::move_rt::ExecutingTrajectoryActionFeedback_<ContainerAllocator> >::stream(s, indent + "  ", v.action_feedback);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MOVE_RT_MESSAGE_EXECUTINGTRAJECTORYACTION_H
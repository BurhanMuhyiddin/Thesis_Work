;; Auto-generated. Do not edit!


(when (boundp 'baxter_control_mine::CalculateIK)
  (if (not (find-package "BAXTER_CONTROL_MINE"))
    (make-package "BAXTER_CONTROL_MINE"))
  (shadow 'CalculateIK (find-package "BAXTER_CONTROL_MINE")))
(unless (find-package "BAXTER_CONTROL_MINE::CALCULATEIK")
  (make-package "BAXTER_CONTROL_MINE::CALCULATEIK"))
(unless (find-package "BAXTER_CONTROL_MINE::CALCULATEIKREQUEST")
  (make-package "BAXTER_CONTROL_MINE::CALCULATEIKREQUEST"))
(unless (find-package "BAXTER_CONTROL_MINE::CALCULATEIKRESPONSE")
  (make-package "BAXTER_CONTROL_MINE::CALCULATEIKRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass baxter_control_mine::CalculateIKRequest
  :super ros::object
  :slots (_desired_pose ))

(defmethod baxter_control_mine::CalculateIKRequest
  (:init
   (&key
    ((:desired_pose __desired_pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _desired_pose __desired_pose)
   self)
  (:desired_pose
   (&rest __desired_pose)
   (if (keywordp (car __desired_pose))
       (send* _desired_pose __desired_pose)
     (progn
       (if __desired_pose (setq _desired_pose (car __desired_pose)))
       _desired_pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _desired_pose
    (send _desired_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _desired_pose
       (send _desired_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _desired_pose
     (send _desired_pose :deserialize buf ptr-) (incf ptr- (send _desired_pose :serialization-length))
   ;;
   self)
  )

(defclass baxter_control_mine::CalculateIKResponse
  :super ros::object
  :slots (_joints ))

(defmethod baxter_control_mine::CalculateIKResponse
  (:init
   (&key
    ((:joints __joints) (let (r) (dotimes (i 0) (push (instance sensor_msgs::JointState :init) r)) r))
    )
   (send-super :init)
   (setq _joints __joints)
   self)
  (:joints
   (&rest __joints)
   (if (keywordp (car __joints))
       (send* _joints __joints)
     (progn
       (if __joints (setq _joints (car __joints)))
       _joints)))
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/JointState[] _joints
    (apply #'+ (send-all _joints :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/JointState[] _joints
     (write-long (length _joints) s)
     (dolist (elem _joints)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/JointState[] _joints
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _joints (let (r) (dotimes (i n) (push (instance sensor_msgs::JointState :init) r)) r))
     (dolist (elem- _joints)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass baxter_control_mine::CalculateIK
  :super ros::object
  :slots ())

(setf (get baxter_control_mine::CalculateIK :md5sum-) "bb5eb49bd79b58929d3000cf4f10e460")
(setf (get baxter_control_mine::CalculateIK :datatype-) "baxter_control_mine/CalculateIK")
(setf (get baxter_control_mine::CalculateIK :request) baxter_control_mine::CalculateIKRequest)
(setf (get baxter_control_mine::CalculateIK :response) baxter_control_mine::CalculateIKResponse)

(defmethod baxter_control_mine::CalculateIKRequest
  (:response () (instance baxter_control_mine::CalculateIKResponse :init)))

(setf (get baxter_control_mine::CalculateIKRequest :md5sum-) "bb5eb49bd79b58929d3000cf4f10e460")
(setf (get baxter_control_mine::CalculateIKRequest :datatype-) "baxter_control_mine/CalculateIKRequest")
(setf (get baxter_control_mine::CalculateIKRequest :definition-)
      "geometry_msgs/Pose desired_pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
sensor_msgs/JointState[] joints

================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
")

(setf (get baxter_control_mine::CalculateIKResponse :md5sum-) "bb5eb49bd79b58929d3000cf4f10e460")
(setf (get baxter_control_mine::CalculateIKResponse :datatype-) "baxter_control_mine/CalculateIKResponse")
(setf (get baxter_control_mine::CalculateIKResponse :definition-)
      "geometry_msgs/Pose desired_pose

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
sensor_msgs/JointState[] joints

================================================================================
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
")



(provide :baxter_control_mine/CalculateIK "bb5eb49bd79b58929d3000cf4f10e460")



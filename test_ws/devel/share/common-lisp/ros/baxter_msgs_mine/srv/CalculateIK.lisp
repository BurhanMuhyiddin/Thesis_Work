; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-srv)


;//! \htmlinclude CalculateIK-request.msg.html

(cl:defclass <CalculateIK-request> (roslisp-msg-protocol:ros-message)
  ((desired_pose
    :reader desired_pose
    :initarg :desired_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass CalculateIK-request (<CalculateIK-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CalculateIK-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CalculateIK-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<CalculateIK-request> is deprecated: use baxter_msgs_mine-srv:CalculateIK-request instead.")))

(cl:ensure-generic-function 'desired_pose-val :lambda-list '(m))
(cl:defmethod desired_pose-val ((m <CalculateIK-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:desired_pose-val is deprecated.  Use baxter_msgs_mine-srv:desired_pose instead.")
  (desired_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CalculateIK-request>) ostream)
  "Serializes a message object of type '<CalculateIK-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'desired_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CalculateIK-request>) istream)
  "Deserializes a message object of type '<CalculateIK-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'desired_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CalculateIK-request>)))
  "Returns string type for a service object of type '<CalculateIK-request>"
  "baxter_msgs_mine/CalculateIKRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CalculateIK-request)))
  "Returns string type for a service object of type 'CalculateIK-request"
  "baxter_msgs_mine/CalculateIKRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CalculateIK-request>)))
  "Returns md5sum for a message object of type '<CalculateIK-request>"
  "bb5eb49bd79b58929d3000cf4f10e460")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CalculateIK-request)))
  "Returns md5sum for a message object of type 'CalculateIK-request"
  "bb5eb49bd79b58929d3000cf4f10e460")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CalculateIK-request>)))
  "Returns full string definition for message of type '<CalculateIK-request>"
  (cl:format cl:nil "geometry_msgs/Pose desired_pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CalculateIK-request)))
  "Returns full string definition for message of type 'CalculateIK-request"
  (cl:format cl:nil "geometry_msgs/Pose desired_pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CalculateIK-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'desired_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CalculateIK-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CalculateIK-request
    (cl:cons ':desired_pose (desired_pose msg))
))
;//! \htmlinclude CalculateIK-response.msg.html

(cl:defclass <CalculateIK-response> (roslisp-msg-protocol:ros-message)
  ((joints
    :reader joints
    :initarg :joints
    :type (cl:vector sensor_msgs-msg:JointState)
   :initform (cl:make-array 0 :element-type 'sensor_msgs-msg:JointState :initial-element (cl:make-instance 'sensor_msgs-msg:JointState))))
)

(cl:defclass CalculateIK-response (<CalculateIK-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CalculateIK-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CalculateIK-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<CalculateIK-response> is deprecated: use baxter_msgs_mine-srv:CalculateIK-response instead.")))

(cl:ensure-generic-function 'joints-val :lambda-list '(m))
(cl:defmethod joints-val ((m <CalculateIK-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:joints-val is deprecated.  Use baxter_msgs_mine-srv:joints instead.")
  (joints m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CalculateIK-response>) ostream)
  "Serializes a message object of type '<CalculateIK-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'joints))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'joints))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CalculateIK-response>) istream)
  "Deserializes a message object of type '<CalculateIK-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'joints) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'joints)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'sensor_msgs-msg:JointState))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CalculateIK-response>)))
  "Returns string type for a service object of type '<CalculateIK-response>"
  "baxter_msgs_mine/CalculateIKResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CalculateIK-response)))
  "Returns string type for a service object of type 'CalculateIK-response"
  "baxter_msgs_mine/CalculateIKResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CalculateIK-response>)))
  "Returns md5sum for a message object of type '<CalculateIK-response>"
  "bb5eb49bd79b58929d3000cf4f10e460")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CalculateIK-response)))
  "Returns md5sum for a message object of type 'CalculateIK-response"
  "bb5eb49bd79b58929d3000cf4f10e460")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CalculateIK-response>)))
  "Returns full string definition for message of type '<CalculateIK-response>"
  (cl:format cl:nil "sensor_msgs/JointState[] joints~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CalculateIK-response)))
  "Returns full string definition for message of type 'CalculateIK-response"
  (cl:format cl:nil "sensor_msgs/JointState[] joints~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CalculateIK-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'joints) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CalculateIK-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CalculateIK-response
    (cl:cons ':joints (joints msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CalculateIK)))
  'CalculateIK-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CalculateIK)))
  'CalculateIK-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CalculateIK)))
  "Returns string type for a service object of type '<CalculateIK>"
  "baxter_msgs_mine/CalculateIK")
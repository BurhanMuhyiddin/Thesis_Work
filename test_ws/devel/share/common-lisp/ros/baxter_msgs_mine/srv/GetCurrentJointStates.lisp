; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-srv)


;//! \htmlinclude GetCurrentJointStates-request.msg.html

(cl:defclass <GetCurrentJointStates-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetCurrentJointStates-request (<GetCurrentJointStates-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetCurrentJointStates-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetCurrentJointStates-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<GetCurrentJointStates-request> is deprecated: use baxter_msgs_mine-srv:GetCurrentJointStates-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetCurrentJointStates-request>) ostream)
  "Serializes a message object of type '<GetCurrentJointStates-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetCurrentJointStates-request>) istream)
  "Deserializes a message object of type '<GetCurrentJointStates-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetCurrentJointStates-request>)))
  "Returns string type for a service object of type '<GetCurrentJointStates-request>"
  "baxter_msgs_mine/GetCurrentJointStatesRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetCurrentJointStates-request)))
  "Returns string type for a service object of type 'GetCurrentJointStates-request"
  "baxter_msgs_mine/GetCurrentJointStatesRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetCurrentJointStates-request>)))
  "Returns md5sum for a message object of type '<GetCurrentJointStates-request>"
  "9ca061465ef0ed08771ed240c43789f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetCurrentJointStates-request)))
  "Returns md5sum for a message object of type 'GetCurrentJointStates-request"
  "9ca061465ef0ed08771ed240c43789f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetCurrentJointStates-request>)))
  "Returns full string definition for message of type '<GetCurrentJointStates-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetCurrentJointStates-request)))
  "Returns full string definition for message of type 'GetCurrentJointStates-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetCurrentJointStates-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetCurrentJointStates-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetCurrentJointStates-request
))
;//! \htmlinclude GetCurrentJointStates-response.msg.html

(cl:defclass <GetCurrentJointStates-response> (roslisp-msg-protocol:ros-message)
  ((joint_state
    :reader joint_state
    :initarg :joint_state
    :type sensor_msgs-msg:JointState
    :initform (cl:make-instance 'sensor_msgs-msg:JointState)))
)

(cl:defclass GetCurrentJointStates-response (<GetCurrentJointStates-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetCurrentJointStates-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetCurrentJointStates-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<GetCurrentJointStates-response> is deprecated: use baxter_msgs_mine-srv:GetCurrentJointStates-response instead.")))

(cl:ensure-generic-function 'joint_state-val :lambda-list '(m))
(cl:defmethod joint_state-val ((m <GetCurrentJointStates-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:joint_state-val is deprecated.  Use baxter_msgs_mine-srv:joint_state instead.")
  (joint_state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetCurrentJointStates-response>) ostream)
  "Serializes a message object of type '<GetCurrentJointStates-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joint_state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetCurrentJointStates-response>) istream)
  "Deserializes a message object of type '<GetCurrentJointStates-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joint_state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetCurrentJointStates-response>)))
  "Returns string type for a service object of type '<GetCurrentJointStates-response>"
  "baxter_msgs_mine/GetCurrentJointStatesResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetCurrentJointStates-response)))
  "Returns string type for a service object of type 'GetCurrentJointStates-response"
  "baxter_msgs_mine/GetCurrentJointStatesResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetCurrentJointStates-response>)))
  "Returns md5sum for a message object of type '<GetCurrentJointStates-response>"
  "9ca061465ef0ed08771ed240c43789f5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetCurrentJointStates-response)))
  "Returns md5sum for a message object of type 'GetCurrentJointStates-response"
  "9ca061465ef0ed08771ed240c43789f5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetCurrentJointStates-response>)))
  "Returns full string definition for message of type '<GetCurrentJointStates-response>"
  (cl:format cl:nil "sensor_msgs/JointState joint_state~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetCurrentJointStates-response)))
  "Returns full string definition for message of type 'GetCurrentJointStates-response"
  (cl:format cl:nil "sensor_msgs/JointState joint_state~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetCurrentJointStates-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joint_state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetCurrentJointStates-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetCurrentJointStates-response
    (cl:cons ':joint_state (joint_state msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetCurrentJointStates)))
  'GetCurrentJointStates-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetCurrentJointStates)))
  'GetCurrentJointStates-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetCurrentJointStates)))
  "Returns string type for a service object of type '<GetCurrentJointStates>"
  "baxter_msgs_mine/GetCurrentJointStates")
; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-msg)


;//! \htmlinclude GoToPointResult.msg.html

(cl:defclass <GoToPointResult> (roslisp-msg-protocol:ros-message)
  ((final_pose
    :reader final_pose
    :initarg :final_pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass GoToPointResult (<GoToPointResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToPointResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToPointResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-msg:<GoToPointResult> is deprecated: use baxter_msgs_mine-msg:GoToPointResult instead.")))

(cl:ensure-generic-function 'final_pose-val :lambda-list '(m))
(cl:defmethod final_pose-val ((m <GoToPointResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-msg:final_pose-val is deprecated.  Use baxter_msgs_mine-msg:final_pose instead.")
  (final_pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToPointResult>) ostream)
  "Serializes a message object of type '<GoToPointResult>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'final_pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToPointResult>) istream)
  "Deserializes a message object of type '<GoToPointResult>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'final_pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToPointResult>)))
  "Returns string type for a message object of type '<GoToPointResult>"
  "baxter_msgs_mine/GoToPointResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToPointResult)))
  "Returns string type for a message object of type 'GoToPointResult"
  "baxter_msgs_mine/GoToPointResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToPointResult>)))
  "Returns md5sum for a message object of type '<GoToPointResult>"
  "02829f6272cbde592e4d28921cb69852")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToPointResult)))
  "Returns md5sum for a message object of type 'GoToPointResult"
  "02829f6272cbde592e4d28921cb69852")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToPointResult>)))
  "Returns full string definition for message of type '<GoToPointResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result~%geometry_msgs/Pose final_pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToPointResult)))
  "Returns full string definition for message of type 'GoToPointResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result~%geometry_msgs/Pose final_pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToPointResult>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'final_pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToPointResult>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToPointResult
    (cl:cons ':final_pose (final_pose msg))
))
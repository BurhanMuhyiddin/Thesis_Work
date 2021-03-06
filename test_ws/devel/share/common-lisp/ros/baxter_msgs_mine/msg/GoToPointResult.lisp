; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-msg)


;//! \htmlinclude GoToPointResult.msg.html

(cl:defclass <GoToPointResult> (roslisp-msg-protocol:ros-message)
  ((final_pose
    :reader final_pose
    :initarg :final_pose
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose))))
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'final_pose))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'final_pose))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToPointResult>) istream)
  "Deserializes a message object of type '<GoToPointResult>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'final_pose) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'final_pose)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
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
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result~%geometry_msgs/Pose[] final_pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToPointResult)))
  "Returns full string definition for message of type 'GoToPointResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#result~%geometry_msgs/Pose[] final_pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToPointResult>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'final_pose) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToPointResult>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToPointResult
    (cl:cons ':final_pose (final_pose msg))
))

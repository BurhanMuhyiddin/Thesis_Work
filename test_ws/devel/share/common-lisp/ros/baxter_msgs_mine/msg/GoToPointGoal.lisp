; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-msg)


;//! \htmlinclude GoToPointGoal.msg.html

(cl:defclass <GoToPointGoal> (roslisp-msg-protocol:ros-message)
  ((desired_pose
    :reader desired_pose
    :initarg :desired_pose
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose)))
   (limb
    :reader limb
    :initarg :limb
    :type cl:string
    :initform ""))
)

(cl:defclass GoToPointGoal (<GoToPointGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToPointGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToPointGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-msg:<GoToPointGoal> is deprecated: use baxter_msgs_mine-msg:GoToPointGoal instead.")))

(cl:ensure-generic-function 'desired_pose-val :lambda-list '(m))
(cl:defmethod desired_pose-val ((m <GoToPointGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-msg:desired_pose-val is deprecated.  Use baxter_msgs_mine-msg:desired_pose instead.")
  (desired_pose m))

(cl:ensure-generic-function 'limb-val :lambda-list '(m))
(cl:defmethod limb-val ((m <GoToPointGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-msg:limb-val is deprecated.  Use baxter_msgs_mine-msg:limb instead.")
  (limb m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToPointGoal>) ostream)
  "Serializes a message object of type '<GoToPointGoal>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'desired_pose))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'desired_pose))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'limb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'limb))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToPointGoal>) istream)
  "Deserializes a message object of type '<GoToPointGoal>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'desired_pose) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'desired_pose)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'limb) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'limb) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToPointGoal>)))
  "Returns string type for a message object of type '<GoToPointGoal>"
  "baxter_msgs_mine/GoToPointGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToPointGoal)))
  "Returns string type for a message object of type 'GoToPointGoal"
  "baxter_msgs_mine/GoToPointGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToPointGoal>)))
  "Returns md5sum for a message object of type '<GoToPointGoal>"
  "844bd63424146f6f878285d0c03bbeb2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToPointGoal)))
  "Returns md5sum for a message object of type 'GoToPointGoal"
  "844bd63424146f6f878285d0c03bbeb2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToPointGoal>)))
  "Returns full string definition for message of type '<GoToPointGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%geometry_msgs/Pose[] desired_pose~%string limb~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToPointGoal)))
  "Returns full string definition for message of type 'GoToPointGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%geometry_msgs/Pose[] desired_pose~%string limb~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToPointGoal>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'desired_pose) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:length (cl:slot-value msg 'limb))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToPointGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToPointGoal
    (cl:cons ':desired_pose (desired_pose msg))
    (cl:cons ':limb (limb msg))
))

; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-msg)


;//! \htmlinclude GoToJointPosGoal.msg.html

(cl:defclass <GoToJointPosGoal> (roslisp-msg-protocol:ros-message)
  ((desired_pose
    :reader desired_pose
    :initarg :desired_pose
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (limb
    :reader limb
    :initarg :limb
    :type cl:string
    :initform ""))
)

(cl:defclass GoToJointPosGoal (<GoToJointPosGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToJointPosGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToJointPosGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-msg:<GoToJointPosGoal> is deprecated: use baxter_msgs_mine-msg:GoToJointPosGoal instead.")))

(cl:ensure-generic-function 'desired_pose-val :lambda-list '(m))
(cl:defmethod desired_pose-val ((m <GoToJointPosGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-msg:desired_pose-val is deprecated.  Use baxter_msgs_mine-msg:desired_pose instead.")
  (desired_pose m))

(cl:ensure-generic-function 'limb-val :lambda-list '(m))
(cl:defmethod limb-val ((m <GoToJointPosGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-msg:limb-val is deprecated.  Use baxter_msgs_mine-msg:limb instead.")
  (limb m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToJointPosGoal>) ostream)
  "Serializes a message object of type '<GoToJointPosGoal>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'desired_pose))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'desired_pose))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'limb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'limb))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToJointPosGoal>) istream)
  "Deserializes a message object of type '<GoToJointPosGoal>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'desired_pose) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'desired_pose)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToJointPosGoal>)))
  "Returns string type for a message object of type '<GoToJointPosGoal>"
  "baxter_msgs_mine/GoToJointPosGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToJointPosGoal)))
  "Returns string type for a message object of type 'GoToJointPosGoal"
  "baxter_msgs_mine/GoToJointPosGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToJointPosGoal>)))
  "Returns md5sum for a message object of type '<GoToJointPosGoal>"
  "b4a71d5db17a0134d8420bee776225cd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToJointPosGoal)))
  "Returns md5sum for a message object of type 'GoToJointPosGoal"
  "b4a71d5db17a0134d8420bee776225cd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToJointPosGoal>)))
  "Returns full string definition for message of type '<GoToJointPosGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%float32[] desired_pose~%string limb~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToJointPosGoal)))
  "Returns full string definition for message of type 'GoToJointPosGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%float32[] desired_pose~%string limb~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToJointPosGoal>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'desired_pose) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:length (cl:slot-value msg 'limb))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToJointPosGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToJointPosGoal
    (cl:cons ':desired_pose (desired_pose msg))
    (cl:cons ':limb (limb msg))
))

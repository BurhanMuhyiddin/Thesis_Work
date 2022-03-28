; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-srv)


;//! \htmlinclude GoToJointGoal-request.msg.html

(cl:defclass <GoToJointGoal-request> (roslisp-msg-protocol:ros-message)
  ((goal
    :reader goal
    :initarg :goal
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (limb
    :reader limb
    :initarg :limb
    :type cl:string
    :initform ""))
)

(cl:defclass GoToJointGoal-request (<GoToJointGoal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToJointGoal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToJointGoal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<GoToJointGoal-request> is deprecated: use baxter_msgs_mine-srv:GoToJointGoal-request instead.")))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <GoToJointGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:goal-val is deprecated.  Use baxter_msgs_mine-srv:goal instead.")
  (goal m))

(cl:ensure-generic-function 'limb-val :lambda-list '(m))
(cl:defmethod limb-val ((m <GoToJointGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:limb-val is deprecated.  Use baxter_msgs_mine-srv:limb instead.")
  (limb m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToJointGoal-request>) ostream)
  "Serializes a message object of type '<GoToJointGoal-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'goal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'goal))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'limb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'limb))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToJointGoal-request>) istream)
  "Deserializes a message object of type '<GoToJointGoal-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'goal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'goal)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToJointGoal-request>)))
  "Returns string type for a service object of type '<GoToJointGoal-request>"
  "baxter_msgs_mine/GoToJointGoalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToJointGoal-request)))
  "Returns string type for a service object of type 'GoToJointGoal-request"
  "baxter_msgs_mine/GoToJointGoalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToJointGoal-request>)))
  "Returns md5sum for a message object of type '<GoToJointGoal-request>"
  "81a2c4bff10997d9f224ac63631e3d27")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToJointGoal-request)))
  "Returns md5sum for a message object of type 'GoToJointGoal-request"
  "81a2c4bff10997d9f224ac63631e3d27")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToJointGoal-request>)))
  "Returns full string definition for message of type '<GoToJointGoal-request>"
  (cl:format cl:nil "float32[] goal~%string limb~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToJointGoal-request)))
  "Returns full string definition for message of type 'GoToJointGoal-request"
  (cl:format cl:nil "float32[] goal~%string limb~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToJointGoal-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'goal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4 (cl:length (cl:slot-value msg 'limb))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToJointGoal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToJointGoal-request
    (cl:cons ':goal (goal msg))
    (cl:cons ':limb (limb msg))
))
;//! \htmlinclude GoToJointGoal-response.msg.html

(cl:defclass <GoToJointGoal-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GoToJointGoal-response (<GoToJointGoal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToJointGoal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToJointGoal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<GoToJointGoal-response> is deprecated: use baxter_msgs_mine-srv:GoToJointGoal-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GoToJointGoal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:success-val is deprecated.  Use baxter_msgs_mine-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToJointGoal-response>) ostream)
  "Serializes a message object of type '<GoToJointGoal-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToJointGoal-response>) istream)
  "Deserializes a message object of type '<GoToJointGoal-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToJointGoal-response>)))
  "Returns string type for a service object of type '<GoToJointGoal-response>"
  "baxter_msgs_mine/GoToJointGoalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToJointGoal-response)))
  "Returns string type for a service object of type 'GoToJointGoal-response"
  "baxter_msgs_mine/GoToJointGoalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToJointGoal-response>)))
  "Returns md5sum for a message object of type '<GoToJointGoal-response>"
  "81a2c4bff10997d9f224ac63631e3d27")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToJointGoal-response)))
  "Returns md5sum for a message object of type 'GoToJointGoal-response"
  "81a2c4bff10997d9f224ac63631e3d27")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToJointGoal-response>)))
  "Returns full string definition for message of type '<GoToJointGoal-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToJointGoal-response)))
  "Returns full string definition for message of type 'GoToJointGoal-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToJointGoal-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToJointGoal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToJointGoal-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GoToJointGoal)))
  'GoToJointGoal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GoToJointGoal)))
  'GoToJointGoal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToJointGoal)))
  "Returns string type for a service object of type '<GoToJointGoal>"
  "baxter_msgs_mine/GoToJointGoal")
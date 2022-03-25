; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-srv)


;//! \htmlinclude GoToGoal-request.msg.html

(cl:defclass <GoToGoal-request> (roslisp-msg-protocol:ros-message)
  ((goal
    :reader goal
    :initarg :goal
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose)))
   (limb
    :reader limb
    :initarg :limb
    :type cl:string
    :initform "")
   (pos_only_ik
    :reader pos_only_ik
    :initarg :pos_only_ik
    :type cl:boolean
    :initform cl:nil)
   (mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass GoToGoal-request (<GoToGoal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToGoal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToGoal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<GoToGoal-request> is deprecated: use baxter_msgs_mine-srv:GoToGoal-request instead.")))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <GoToGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:goal-val is deprecated.  Use baxter_msgs_mine-srv:goal instead.")
  (goal m))

(cl:ensure-generic-function 'limb-val :lambda-list '(m))
(cl:defmethod limb-val ((m <GoToGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:limb-val is deprecated.  Use baxter_msgs_mine-srv:limb instead.")
  (limb m))

(cl:ensure-generic-function 'pos_only_ik-val :lambda-list '(m))
(cl:defmethod pos_only_ik-val ((m <GoToGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:pos_only_ik-val is deprecated.  Use baxter_msgs_mine-srv:pos_only_ik instead.")
  (pos_only_ik m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <GoToGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:mode-val is deprecated.  Use baxter_msgs_mine-srv:mode instead.")
  (mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToGoal-request>) ostream)
  "Serializes a message object of type '<GoToGoal-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'goal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'goal))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'limb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'limb))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pos_only_ik) 1 0)) ostream)
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToGoal-request>) istream)
  "Deserializes a message object of type '<GoToGoal-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'goal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'goal)))
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
    (cl:setf (cl:slot-value msg 'pos_only_ik) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToGoal-request>)))
  "Returns string type for a service object of type '<GoToGoal-request>"
  "baxter_msgs_mine/GoToGoalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToGoal-request)))
  "Returns string type for a service object of type 'GoToGoal-request"
  "baxter_msgs_mine/GoToGoalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToGoal-request>)))
  "Returns md5sum for a message object of type '<GoToGoal-request>"
  "9ed4b1d775387f17722043ec8051bd52")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToGoal-request)))
  "Returns md5sum for a message object of type 'GoToGoal-request"
  "9ed4b1d775387f17722043ec8051bd52")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToGoal-request>)))
  "Returns full string definition for message of type '<GoToGoal-request>"
  (cl:format cl:nil "geometry_msgs/Pose[] goal~%string limb~%bool pos_only_ik~%int8 mode~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToGoal-request)))
  "Returns full string definition for message of type 'GoToGoal-request"
  (cl:format cl:nil "geometry_msgs/Pose[] goal~%string limb~%bool pos_only_ik~%int8 mode~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToGoal-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'goal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:length (cl:slot-value msg 'limb))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToGoal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToGoal-request
    (cl:cons ':goal (goal msg))
    (cl:cons ':limb (limb msg))
    (cl:cons ':pos_only_ik (pos_only_ik msg))
    (cl:cons ':mode (mode msg))
))
;//! \htmlinclude GoToGoal-response.msg.html

(cl:defclass <GoToGoal-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GoToGoal-response (<GoToGoal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToGoal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToGoal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<GoToGoal-response> is deprecated: use baxter_msgs_mine-srv:GoToGoal-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GoToGoal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:success-val is deprecated.  Use baxter_msgs_mine-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToGoal-response>) ostream)
  "Serializes a message object of type '<GoToGoal-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToGoal-response>) istream)
  "Deserializes a message object of type '<GoToGoal-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToGoal-response>)))
  "Returns string type for a service object of type '<GoToGoal-response>"
  "baxter_msgs_mine/GoToGoalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToGoal-response)))
  "Returns string type for a service object of type 'GoToGoal-response"
  "baxter_msgs_mine/GoToGoalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToGoal-response>)))
  "Returns md5sum for a message object of type '<GoToGoal-response>"
  "9ed4b1d775387f17722043ec8051bd52")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToGoal-response)))
  "Returns md5sum for a message object of type 'GoToGoal-response"
  "9ed4b1d775387f17722043ec8051bd52")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToGoal-response>)))
  "Returns full string definition for message of type '<GoToGoal-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToGoal-response)))
  "Returns full string definition for message of type 'GoToGoal-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToGoal-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToGoal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToGoal-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GoToGoal)))
  'GoToGoal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GoToGoal)))
  'GoToGoal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToGoal)))
  "Returns string type for a service object of type '<GoToGoal>"
  "baxter_msgs_mine/GoToGoal")
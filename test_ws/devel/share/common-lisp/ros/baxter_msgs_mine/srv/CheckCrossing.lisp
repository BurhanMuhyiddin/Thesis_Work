; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-srv)


;//! \htmlinclude CheckCrossing-request.msg.html

(cl:defclass <CheckCrossing-request> (roslisp-msg-protocol:ros-message)
  ((color
    :reader color
    :initarg :color
    :type cl:string
    :initform ""))
)

(cl:defclass CheckCrossing-request (<CheckCrossing-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckCrossing-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckCrossing-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<CheckCrossing-request> is deprecated: use baxter_msgs_mine-srv:CheckCrossing-request instead.")))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <CheckCrossing-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:color-val is deprecated.  Use baxter_msgs_mine-srv:color instead.")
  (color m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckCrossing-request>) ostream)
  "Serializes a message object of type '<CheckCrossing-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'color))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'color))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckCrossing-request>) istream)
  "Deserializes a message object of type '<CheckCrossing-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'color) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'color) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckCrossing-request>)))
  "Returns string type for a service object of type '<CheckCrossing-request>"
  "baxter_msgs_mine/CheckCrossingRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckCrossing-request)))
  "Returns string type for a service object of type 'CheckCrossing-request"
  "baxter_msgs_mine/CheckCrossingRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckCrossing-request>)))
  "Returns md5sum for a message object of type '<CheckCrossing-request>"
  "43681e71f21e5675de1d59f1aa7c14d7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckCrossing-request)))
  "Returns md5sum for a message object of type 'CheckCrossing-request"
  "43681e71f21e5675de1d59f1aa7c14d7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckCrossing-request>)))
  "Returns full string definition for message of type '<CheckCrossing-request>"
  (cl:format cl:nil "string color~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckCrossing-request)))
  "Returns full string definition for message of type 'CheckCrossing-request"
  (cl:format cl:nil "string color~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckCrossing-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'color))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckCrossing-request>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckCrossing-request
    (cl:cons ':color (color msg))
))
;//! \htmlinclude CheckCrossing-response.msg.html

(cl:defclass <CheckCrossing-response> (roslisp-msg-protocol:ros-message)
  ((limb
    :reader limb
    :initarg :limb
    :type cl:string
    :initform "")
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass CheckCrossing-response (<CheckCrossing-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CheckCrossing-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CheckCrossing-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<CheckCrossing-response> is deprecated: use baxter_msgs_mine-srv:CheckCrossing-response instead.")))

(cl:ensure-generic-function 'limb-val :lambda-list '(m))
(cl:defmethod limb-val ((m <CheckCrossing-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:limb-val is deprecated.  Use baxter_msgs_mine-srv:limb instead.")
  (limb m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <CheckCrossing-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:success-val is deprecated.  Use baxter_msgs_mine-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CheckCrossing-response>) ostream)
  "Serializes a message object of type '<CheckCrossing-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'limb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'limb))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CheckCrossing-response>) istream)
  "Deserializes a message object of type '<CheckCrossing-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'limb) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'limb) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CheckCrossing-response>)))
  "Returns string type for a service object of type '<CheckCrossing-response>"
  "baxter_msgs_mine/CheckCrossingResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckCrossing-response)))
  "Returns string type for a service object of type 'CheckCrossing-response"
  "baxter_msgs_mine/CheckCrossingResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CheckCrossing-response>)))
  "Returns md5sum for a message object of type '<CheckCrossing-response>"
  "43681e71f21e5675de1d59f1aa7c14d7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CheckCrossing-response)))
  "Returns md5sum for a message object of type 'CheckCrossing-response"
  "43681e71f21e5675de1d59f1aa7c14d7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CheckCrossing-response>)))
  "Returns full string definition for message of type '<CheckCrossing-response>"
  (cl:format cl:nil "string limb~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CheckCrossing-response)))
  "Returns full string definition for message of type 'CheckCrossing-response"
  (cl:format cl:nil "string limb~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CheckCrossing-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'limb))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CheckCrossing-response>))
  "Converts a ROS message object to a list"
  (cl:list 'CheckCrossing-response
    (cl:cons ':limb (limb msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'CheckCrossing)))
  'CheckCrossing-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'CheckCrossing)))
  'CheckCrossing-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CheckCrossing)))
  "Returns string type for a service object of type '<CheckCrossing>"
  "baxter_msgs_mine/CheckCrossing")
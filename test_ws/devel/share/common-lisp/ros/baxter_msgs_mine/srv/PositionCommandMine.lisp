; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-srv)


;//! \htmlinclude PositionCommandMine-request.msg.html

(cl:defclass <PositionCommandMine-request> (roslisp-msg-protocol:ros-message)
  ((position_command
    :reader position_command
    :initarg :position_command
    :type cl:string
    :initform ""))
)

(cl:defclass PositionCommandMine-request (<PositionCommandMine-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PositionCommandMine-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PositionCommandMine-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<PositionCommandMine-request> is deprecated: use baxter_msgs_mine-srv:PositionCommandMine-request instead.")))

(cl:ensure-generic-function 'position_command-val :lambda-list '(m))
(cl:defmethod position_command-val ((m <PositionCommandMine-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:position_command-val is deprecated.  Use baxter_msgs_mine-srv:position_command instead.")
  (position_command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PositionCommandMine-request>) ostream)
  "Serializes a message object of type '<PositionCommandMine-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'position_command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'position_command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PositionCommandMine-request>) istream)
  "Deserializes a message object of type '<PositionCommandMine-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'position_command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'position_command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PositionCommandMine-request>)))
  "Returns string type for a service object of type '<PositionCommandMine-request>"
  "baxter_msgs_mine/PositionCommandMineRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PositionCommandMine-request)))
  "Returns string type for a service object of type 'PositionCommandMine-request"
  "baxter_msgs_mine/PositionCommandMineRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PositionCommandMine-request>)))
  "Returns md5sum for a message object of type '<PositionCommandMine-request>"
  "90005b3bd3e0858473cd0f1bcad7b688")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PositionCommandMine-request)))
  "Returns md5sum for a message object of type 'PositionCommandMine-request"
  "90005b3bd3e0858473cd0f1bcad7b688")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PositionCommandMine-request>)))
  "Returns full string definition for message of type '<PositionCommandMine-request>"
  (cl:format cl:nil "string position_command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PositionCommandMine-request)))
  "Returns full string definition for message of type 'PositionCommandMine-request"
  (cl:format cl:nil "string position_command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PositionCommandMine-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'position_command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PositionCommandMine-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PositionCommandMine-request
    (cl:cons ':position_command (position_command msg))
))
;//! \htmlinclude PositionCommandMine-response.msg.html

(cl:defclass <PositionCommandMine-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PositionCommandMine-response (<PositionCommandMine-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PositionCommandMine-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PositionCommandMine-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<PositionCommandMine-response> is deprecated: use baxter_msgs_mine-srv:PositionCommandMine-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <PositionCommandMine-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:success-val is deprecated.  Use baxter_msgs_mine-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PositionCommandMine-response>) ostream)
  "Serializes a message object of type '<PositionCommandMine-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PositionCommandMine-response>) istream)
  "Deserializes a message object of type '<PositionCommandMine-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PositionCommandMine-response>)))
  "Returns string type for a service object of type '<PositionCommandMine-response>"
  "baxter_msgs_mine/PositionCommandMineResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PositionCommandMine-response)))
  "Returns string type for a service object of type 'PositionCommandMine-response"
  "baxter_msgs_mine/PositionCommandMineResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PositionCommandMine-response>)))
  "Returns md5sum for a message object of type '<PositionCommandMine-response>"
  "90005b3bd3e0858473cd0f1bcad7b688")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PositionCommandMine-response)))
  "Returns md5sum for a message object of type 'PositionCommandMine-response"
  "90005b3bd3e0858473cd0f1bcad7b688")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PositionCommandMine-response>)))
  "Returns full string definition for message of type '<PositionCommandMine-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PositionCommandMine-response)))
  "Returns full string definition for message of type 'PositionCommandMine-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PositionCommandMine-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PositionCommandMine-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PositionCommandMine-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PositionCommandMine)))
  'PositionCommandMine-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PositionCommandMine)))
  'PositionCommandMine-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PositionCommandMine)))
  "Returns string type for a service object of type '<PositionCommandMine>"
  "baxter_msgs_mine/PositionCommandMine")
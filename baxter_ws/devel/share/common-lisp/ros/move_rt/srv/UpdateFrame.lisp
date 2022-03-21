; Auto-generated. Do not edit!


(cl:in-package move_rt-srv)


;//! \htmlinclude UpdateFrame-request.msg.html

(cl:defclass <UpdateFrame-request> (roslisp-msg-protocol:ros-message)
  ((frame
    :reader frame
    :initarg :frame
    :type cl:string
    :initform ""))
)

(cl:defclass UpdateFrame-request (<UpdateFrame-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UpdateFrame-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UpdateFrame-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_rt-srv:<UpdateFrame-request> is deprecated: use move_rt-srv:UpdateFrame-request instead.")))

(cl:ensure-generic-function 'frame-val :lambda-list '(m))
(cl:defmethod frame-val ((m <UpdateFrame-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_rt-srv:frame-val is deprecated.  Use move_rt-srv:frame instead.")
  (frame m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UpdateFrame-request>) ostream)
  "Serializes a message object of type '<UpdateFrame-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'frame))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'frame))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UpdateFrame-request>) istream)
  "Deserializes a message object of type '<UpdateFrame-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'frame) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'frame) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UpdateFrame-request>)))
  "Returns string type for a service object of type '<UpdateFrame-request>"
  "move_rt/UpdateFrameRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UpdateFrame-request)))
  "Returns string type for a service object of type 'UpdateFrame-request"
  "move_rt/UpdateFrameRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UpdateFrame-request>)))
  "Returns md5sum for a message object of type '<UpdateFrame-request>"
  "323fd8a2fa219baecffe89d7ec1e70e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UpdateFrame-request)))
  "Returns md5sum for a message object of type 'UpdateFrame-request"
  "323fd8a2fa219baecffe89d7ec1e70e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UpdateFrame-request>)))
  "Returns full string definition for message of type '<UpdateFrame-request>"
  (cl:format cl:nil "string frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UpdateFrame-request)))
  "Returns full string definition for message of type 'UpdateFrame-request"
  (cl:format cl:nil "string frame~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UpdateFrame-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'frame))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UpdateFrame-request>))
  "Converts a ROS message object to a list"
  (cl:list 'UpdateFrame-request
    (cl:cons ':frame (frame msg))
))
;//! \htmlinclude UpdateFrame-response.msg.html

(cl:defclass <UpdateFrame-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass UpdateFrame-response (<UpdateFrame-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <UpdateFrame-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'UpdateFrame-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_rt-srv:<UpdateFrame-response> is deprecated: use move_rt-srv:UpdateFrame-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <UpdateFrame-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_rt-srv:result-val is deprecated.  Use move_rt-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <UpdateFrame-response>) ostream)
  "Serializes a message object of type '<UpdateFrame-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <UpdateFrame-response>) istream)
  "Deserializes a message object of type '<UpdateFrame-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<UpdateFrame-response>)))
  "Returns string type for a service object of type '<UpdateFrame-response>"
  "move_rt/UpdateFrameResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UpdateFrame-response)))
  "Returns string type for a service object of type 'UpdateFrame-response"
  "move_rt/UpdateFrameResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<UpdateFrame-response>)))
  "Returns md5sum for a message object of type '<UpdateFrame-response>"
  "323fd8a2fa219baecffe89d7ec1e70e3")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'UpdateFrame-response)))
  "Returns md5sum for a message object of type 'UpdateFrame-response"
  "323fd8a2fa219baecffe89d7ec1e70e3")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<UpdateFrame-response>)))
  "Returns full string definition for message of type '<UpdateFrame-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'UpdateFrame-response)))
  "Returns full string definition for message of type 'UpdateFrame-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <UpdateFrame-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <UpdateFrame-response>))
  "Converts a ROS message object to a list"
  (cl:list 'UpdateFrame-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'UpdateFrame)))
  'UpdateFrame-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'UpdateFrame)))
  'UpdateFrame-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'UpdateFrame)))
  "Returns string type for a service object of type '<UpdateFrame>"
  "move_rt/UpdateFrame")
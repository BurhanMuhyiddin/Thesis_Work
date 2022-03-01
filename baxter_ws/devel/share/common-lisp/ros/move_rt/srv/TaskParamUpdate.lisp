; Auto-generated. Do not edit!


(cl:in-package move_rt-srv)


;//! \htmlinclude TaskParamUpdate-request.msg.html

(cl:defclass <TaskParamUpdate-request> (roslisp-msg-protocol:ros-message)
  ((data
    :reader data
    :initarg :data
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass TaskParamUpdate-request (<TaskParamUpdate-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TaskParamUpdate-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TaskParamUpdate-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_rt-srv:<TaskParamUpdate-request> is deprecated: use move_rt-srv:TaskParamUpdate-request instead.")))

(cl:ensure-generic-function 'data-val :lambda-list '(m))
(cl:defmethod data-val ((m <TaskParamUpdate-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_rt-srv:data-val is deprecated.  Use move_rt-srv:data instead.")
  (data m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TaskParamUpdate-request>) ostream)
  "Serializes a message object of type '<TaskParamUpdate-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'data))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'data))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TaskParamUpdate-request>) istream)
  "Deserializes a message object of type '<TaskParamUpdate-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'data) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'data)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TaskParamUpdate-request>)))
  "Returns string type for a service object of type '<TaskParamUpdate-request>"
  "move_rt/TaskParamUpdateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TaskParamUpdate-request)))
  "Returns string type for a service object of type 'TaskParamUpdate-request"
  "move_rt/TaskParamUpdateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TaskParamUpdate-request>)))
  "Returns md5sum for a message object of type '<TaskParamUpdate-request>"
  "ae13d2079549ecafaa66d49d24c80c49")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TaskParamUpdate-request)))
  "Returns md5sum for a message object of type 'TaskParamUpdate-request"
  "ae13d2079549ecafaa66d49d24c80c49")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TaskParamUpdate-request>)))
  "Returns full string definition for message of type '<TaskParamUpdate-request>"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TaskParamUpdate-request)))
  "Returns full string definition for message of type 'TaskParamUpdate-request"
  (cl:format cl:nil "float64[] data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TaskParamUpdate-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'data) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TaskParamUpdate-request>))
  "Converts a ROS message object to a list"
  (cl:list 'TaskParamUpdate-request
    (cl:cons ':data (data msg))
))
;//! \htmlinclude TaskParamUpdate-response.msg.html

(cl:defclass <TaskParamUpdate-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass TaskParamUpdate-response (<TaskParamUpdate-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TaskParamUpdate-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TaskParamUpdate-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_rt-srv:<TaskParamUpdate-response> is deprecated: use move_rt-srv:TaskParamUpdate-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <TaskParamUpdate-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_rt-srv:result-val is deprecated.  Use move_rt-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TaskParamUpdate-response>) ostream)
  "Serializes a message object of type '<TaskParamUpdate-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TaskParamUpdate-response>) istream)
  "Deserializes a message object of type '<TaskParamUpdate-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TaskParamUpdate-response>)))
  "Returns string type for a service object of type '<TaskParamUpdate-response>"
  "move_rt/TaskParamUpdateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TaskParamUpdate-response)))
  "Returns string type for a service object of type 'TaskParamUpdate-response"
  "move_rt/TaskParamUpdateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TaskParamUpdate-response>)))
  "Returns md5sum for a message object of type '<TaskParamUpdate-response>"
  "ae13d2079549ecafaa66d49d24c80c49")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TaskParamUpdate-response)))
  "Returns md5sum for a message object of type 'TaskParamUpdate-response"
  "ae13d2079549ecafaa66d49d24c80c49")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TaskParamUpdate-response>)))
  "Returns full string definition for message of type '<TaskParamUpdate-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TaskParamUpdate-response)))
  "Returns full string definition for message of type 'TaskParamUpdate-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TaskParamUpdate-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TaskParamUpdate-response>))
  "Converts a ROS message object to a list"
  (cl:list 'TaskParamUpdate-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'TaskParamUpdate)))
  'TaskParamUpdate-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'TaskParamUpdate)))
  'TaskParamUpdate-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TaskParamUpdate)))
  "Returns string type for a service object of type '<TaskParamUpdate>"
  "move_rt/TaskParamUpdate")
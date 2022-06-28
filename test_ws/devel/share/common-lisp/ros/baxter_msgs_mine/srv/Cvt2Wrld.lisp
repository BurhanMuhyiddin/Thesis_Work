; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-srv)


;//! \htmlinclude Cvt2Wrld-request.msg.html

(cl:defclass <Cvt2Wrld-request> (roslisp-msg-protocol:ros-message)
  ((img_points
    :reader img_points
    :initarg :img_points
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (limb
    :reader limb
    :initarg :limb
    :type cl:string
    :initform ""))
)

(cl:defclass Cvt2Wrld-request (<Cvt2Wrld-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Cvt2Wrld-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Cvt2Wrld-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<Cvt2Wrld-request> is deprecated: use baxter_msgs_mine-srv:Cvt2Wrld-request instead.")))

(cl:ensure-generic-function 'img_points-val :lambda-list '(m))
(cl:defmethod img_points-val ((m <Cvt2Wrld-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:img_points-val is deprecated.  Use baxter_msgs_mine-srv:img_points instead.")
  (img_points m))

(cl:ensure-generic-function 'limb-val :lambda-list '(m))
(cl:defmethod limb-val ((m <Cvt2Wrld-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:limb-val is deprecated.  Use baxter_msgs_mine-srv:limb instead.")
  (limb m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Cvt2Wrld-request>) ostream)
  "Serializes a message object of type '<Cvt2Wrld-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'img_points))))
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
   (cl:slot-value msg 'img_points))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'limb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'limb))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Cvt2Wrld-request>) istream)
  "Deserializes a message object of type '<Cvt2Wrld-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'img_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'img_points)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Cvt2Wrld-request>)))
  "Returns string type for a service object of type '<Cvt2Wrld-request>"
  "baxter_msgs_mine/Cvt2WrldRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Cvt2Wrld-request)))
  "Returns string type for a service object of type 'Cvt2Wrld-request"
  "baxter_msgs_mine/Cvt2WrldRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Cvt2Wrld-request>)))
  "Returns md5sum for a message object of type '<Cvt2Wrld-request>"
  "2ce5c3384f15a765a1063a3a6f79f77c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Cvt2Wrld-request)))
  "Returns md5sum for a message object of type 'Cvt2Wrld-request"
  "2ce5c3384f15a765a1063a3a6f79f77c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Cvt2Wrld-request>)))
  "Returns full string definition for message of type '<Cvt2Wrld-request>"
  (cl:format cl:nil "float64[] img_points~%string limb~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Cvt2Wrld-request)))
  "Returns full string definition for message of type 'Cvt2Wrld-request"
  (cl:format cl:nil "float64[] img_points~%string limb~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Cvt2Wrld-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'img_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     4 (cl:length (cl:slot-value msg 'limb))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Cvt2Wrld-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Cvt2Wrld-request
    (cl:cons ':img_points (img_points msg))
    (cl:cons ':limb (limb msg))
))
;//! \htmlinclude Cvt2Wrld-response.msg.html

(cl:defclass <Cvt2Wrld-response> (roslisp-msg-protocol:ros-message)
  ((wrld_points
    :reader wrld_points
    :initarg :wrld_points
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Cvt2Wrld-response (<Cvt2Wrld-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Cvt2Wrld-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Cvt2Wrld-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<Cvt2Wrld-response> is deprecated: use baxter_msgs_mine-srv:Cvt2Wrld-response instead.")))

(cl:ensure-generic-function 'wrld_points-val :lambda-list '(m))
(cl:defmethod wrld_points-val ((m <Cvt2Wrld-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:wrld_points-val is deprecated.  Use baxter_msgs_mine-srv:wrld_points instead.")
  (wrld_points m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <Cvt2Wrld-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:success-val is deprecated.  Use baxter_msgs_mine-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Cvt2Wrld-response>) ostream)
  "Serializes a message object of type '<Cvt2Wrld-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'wrld_points))))
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
   (cl:slot-value msg 'wrld_points))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Cvt2Wrld-response>) istream)
  "Deserializes a message object of type '<Cvt2Wrld-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'wrld_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'wrld_points)))
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
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Cvt2Wrld-response>)))
  "Returns string type for a service object of type '<Cvt2Wrld-response>"
  "baxter_msgs_mine/Cvt2WrldResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Cvt2Wrld-response)))
  "Returns string type for a service object of type 'Cvt2Wrld-response"
  "baxter_msgs_mine/Cvt2WrldResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Cvt2Wrld-response>)))
  "Returns md5sum for a message object of type '<Cvt2Wrld-response>"
  "2ce5c3384f15a765a1063a3a6f79f77c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Cvt2Wrld-response)))
  "Returns md5sum for a message object of type 'Cvt2Wrld-response"
  "2ce5c3384f15a765a1063a3a6f79f77c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Cvt2Wrld-response>)))
  "Returns full string definition for message of type '<Cvt2Wrld-response>"
  (cl:format cl:nil "float64[] wrld_points~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Cvt2Wrld-response)))
  "Returns full string definition for message of type 'Cvt2Wrld-response"
  (cl:format cl:nil "float64[] wrld_points~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Cvt2Wrld-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'wrld_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Cvt2Wrld-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Cvt2Wrld-response
    (cl:cons ':wrld_points (wrld_points msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Cvt2Wrld)))
  'Cvt2Wrld-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Cvt2Wrld)))
  'Cvt2Wrld-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Cvt2Wrld)))
  "Returns string type for a service object of type '<Cvt2Wrld>"
  "baxter_msgs_mine/Cvt2Wrld")
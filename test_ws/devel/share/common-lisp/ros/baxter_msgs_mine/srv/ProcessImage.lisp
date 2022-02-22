; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-srv)


;//! \htmlinclude ProcessImage-request.msg.html

(cl:defclass <ProcessImage-request> (roslisp-msg-protocol:ros-message)
  ((img
    :reader img
    :initarg :img
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (color
    :reader color
    :initarg :color
    :type cl:string
    :initform "")
   (limb
    :reader limb
    :initarg :limb
    :type cl:string
    :initform ""))
)

(cl:defclass ProcessImage-request (<ProcessImage-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ProcessImage-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ProcessImage-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<ProcessImage-request> is deprecated: use baxter_msgs_mine-srv:ProcessImage-request instead.")))

(cl:ensure-generic-function 'img-val :lambda-list '(m))
(cl:defmethod img-val ((m <ProcessImage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:img-val is deprecated.  Use baxter_msgs_mine-srv:img instead.")
  (img m))

(cl:ensure-generic-function 'color-val :lambda-list '(m))
(cl:defmethod color-val ((m <ProcessImage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:color-val is deprecated.  Use baxter_msgs_mine-srv:color instead.")
  (color m))

(cl:ensure-generic-function 'limb-val :lambda-list '(m))
(cl:defmethod limb-val ((m <ProcessImage-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:limb-val is deprecated.  Use baxter_msgs_mine-srv:limb instead.")
  (limb m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ProcessImage-request>) ostream)
  "Serializes a message object of type '<ProcessImage-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'img) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'color))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'color))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'limb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'limb))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ProcessImage-request>) istream)
  "Deserializes a message object of type '<ProcessImage-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'img) istream)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'color) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'color) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ProcessImage-request>)))
  "Returns string type for a service object of type '<ProcessImage-request>"
  "baxter_msgs_mine/ProcessImageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProcessImage-request)))
  "Returns string type for a service object of type 'ProcessImage-request"
  "baxter_msgs_mine/ProcessImageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ProcessImage-request>)))
  "Returns md5sum for a message object of type '<ProcessImage-request>"
  "8ddaef76372bb3744b202ff9f1b2b0db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ProcessImage-request)))
  "Returns md5sum for a message object of type 'ProcessImage-request"
  "8ddaef76372bb3744b202ff9f1b2b0db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ProcessImage-request>)))
  "Returns full string definition for message of type '<ProcessImage-request>"
  (cl:format cl:nil "sensor_msgs/Image img~%string color~%string limb~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ProcessImage-request)))
  "Returns full string definition for message of type 'ProcessImage-request"
  (cl:format cl:nil "sensor_msgs/Image img~%string color~%string limb~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ProcessImage-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'img))
     4 (cl:length (cl:slot-value msg 'color))
     4 (cl:length (cl:slot-value msg 'limb))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ProcessImage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ProcessImage-request
    (cl:cons ':img (img msg))
    (cl:cons ':color (color msg))
    (cl:cons ':limb (limb msg))
))
;//! \htmlinclude ProcessImage-response.msg.html

(cl:defclass <ProcessImage-response> (roslisp-msg-protocol:ros-message)
  ((extracted_features
    :reader extracted_features
    :initarg :extracted_features
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0))
   (success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass ProcessImage-response (<ProcessImage-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ProcessImage-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ProcessImage-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<ProcessImage-response> is deprecated: use baxter_msgs_mine-srv:ProcessImage-response instead.")))

(cl:ensure-generic-function 'extracted_features-val :lambda-list '(m))
(cl:defmethod extracted_features-val ((m <ProcessImage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:extracted_features-val is deprecated.  Use baxter_msgs_mine-srv:extracted_features instead.")
  (extracted_features m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <ProcessImage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:success-val is deprecated.  Use baxter_msgs_mine-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ProcessImage-response>) ostream)
  "Serializes a message object of type '<ProcessImage-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'extracted_features))))
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
   (cl:slot-value msg 'extracted_features))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ProcessImage-response>) istream)
  "Deserializes a message object of type '<ProcessImage-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'extracted_features) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'extracted_features)))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ProcessImage-response>)))
  "Returns string type for a service object of type '<ProcessImage-response>"
  "baxter_msgs_mine/ProcessImageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProcessImage-response)))
  "Returns string type for a service object of type 'ProcessImage-response"
  "baxter_msgs_mine/ProcessImageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ProcessImage-response>)))
  "Returns md5sum for a message object of type '<ProcessImage-response>"
  "8ddaef76372bb3744b202ff9f1b2b0db")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ProcessImage-response)))
  "Returns md5sum for a message object of type 'ProcessImage-response"
  "8ddaef76372bb3744b202ff9f1b2b0db")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ProcessImage-response>)))
  "Returns full string definition for message of type '<ProcessImage-response>"
  (cl:format cl:nil "float64[] extracted_features~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ProcessImage-response)))
  "Returns full string definition for message of type 'ProcessImage-response"
  (cl:format cl:nil "float64[] extracted_features~%bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ProcessImage-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'extracted_features) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ProcessImage-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ProcessImage-response
    (cl:cons ':extracted_features (extracted_features msg))
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ProcessImage)))
  'ProcessImage-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ProcessImage)))
  'ProcessImage-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ProcessImage)))
  "Returns string type for a service object of type '<ProcessImage>"
  "baxter_msgs_mine/ProcessImage")
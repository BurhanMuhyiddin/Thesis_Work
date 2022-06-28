; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-msg)


;//! \htmlinclude CameraDebug.msg.html

(cl:defclass <CameraDebug> (roslisp-msg-protocol:ros-message)
  ((current_img
    :reader current_img
    :initarg :current_img
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (target_img_mask
    :reader target_img_mask
    :initarg :target_img_mask
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image))
   (current_img_mask
    :reader current_img_mask
    :initarg :current_img_mask
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass CameraDebug (<CameraDebug>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CameraDebug>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CameraDebug)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-msg:<CameraDebug> is deprecated: use baxter_msgs_mine-msg:CameraDebug instead.")))

(cl:ensure-generic-function 'current_img-val :lambda-list '(m))
(cl:defmethod current_img-val ((m <CameraDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-msg:current_img-val is deprecated.  Use baxter_msgs_mine-msg:current_img instead.")
  (current_img m))

(cl:ensure-generic-function 'target_img_mask-val :lambda-list '(m))
(cl:defmethod target_img_mask-val ((m <CameraDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-msg:target_img_mask-val is deprecated.  Use baxter_msgs_mine-msg:target_img_mask instead.")
  (target_img_mask m))

(cl:ensure-generic-function 'current_img_mask-val :lambda-list '(m))
(cl:defmethod current_img_mask-val ((m <CameraDebug>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-msg:current_img_mask-val is deprecated.  Use baxter_msgs_mine-msg:current_img_mask instead.")
  (current_img_mask m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CameraDebug>) ostream)
  "Serializes a message object of type '<CameraDebug>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'current_img) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'target_img_mask) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'current_img_mask) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CameraDebug>) istream)
  "Deserializes a message object of type '<CameraDebug>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'current_img) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'target_img_mask) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'current_img_mask) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CameraDebug>)))
  "Returns string type for a message object of type '<CameraDebug>"
  "baxter_msgs_mine/CameraDebug")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CameraDebug)))
  "Returns string type for a message object of type 'CameraDebug"
  "baxter_msgs_mine/CameraDebug")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CameraDebug>)))
  "Returns md5sum for a message object of type '<CameraDebug>"
  "10aed15b2704434d6ba0464fd75c0420")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CameraDebug)))
  "Returns md5sum for a message object of type 'CameraDebug"
  "10aed15b2704434d6ba0464fd75c0420")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CameraDebug>)))
  "Returns full string definition for message of type '<CameraDebug>"
  (cl:format cl:nil "sensor_msgs/Image current_img~%sensor_msgs/Image target_img_mask~%sensor_msgs/Image current_img_mask~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CameraDebug)))
  "Returns full string definition for message of type 'CameraDebug"
  (cl:format cl:nil "sensor_msgs/Image current_img~%sensor_msgs/Image target_img_mask~%sensor_msgs/Image current_img_mask~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CameraDebug>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'current_img))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'target_img_mask))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'current_img_mask))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CameraDebug>))
  "Converts a ROS message object to a list"
  (cl:list 'CameraDebug
    (cl:cons ':current_img (current_img msg))
    (cl:cons ':target_img_mask (target_img_mask msg))
    (cl:cons ':current_img_mask (current_img_mask msg))
))

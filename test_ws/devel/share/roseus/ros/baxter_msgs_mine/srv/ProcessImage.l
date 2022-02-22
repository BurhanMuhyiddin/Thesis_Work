;; Auto-generated. Do not edit!


(when (boundp 'baxter_msgs_mine::ProcessImage)
  (if (not (find-package "BAXTER_MSGS_MINE"))
    (make-package "BAXTER_MSGS_MINE"))
  (shadow 'ProcessImage (find-package "BAXTER_MSGS_MINE")))
(unless (find-package "BAXTER_MSGS_MINE::PROCESSIMAGE")
  (make-package "BAXTER_MSGS_MINE::PROCESSIMAGE"))
(unless (find-package "BAXTER_MSGS_MINE::PROCESSIMAGEREQUEST")
  (make-package "BAXTER_MSGS_MINE::PROCESSIMAGEREQUEST"))
(unless (find-package "BAXTER_MSGS_MINE::PROCESSIMAGERESPONSE")
  (make-package "BAXTER_MSGS_MINE::PROCESSIMAGERESPONSE"))

(in-package "ROS")

(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))




(defclass baxter_msgs_mine::ProcessImageRequest
  :super ros::object
  :slots (_img _color _limb ))

(defmethod baxter_msgs_mine::ProcessImageRequest
  (:init
   (&key
    ((:img __img) (instance sensor_msgs::Image :init))
    ((:color __color) "")
    ((:limb __limb) "")
    )
   (send-super :init)
   (setq _img __img)
   (setq _color (string __color))
   (setq _limb (string __limb))
   self)
  (:img
   (&rest __img)
   (if (keywordp (car __img))
       (send* _img __img)
     (progn
       (if __img (setq _img (car __img)))
       _img)))
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:limb
   (&optional __limb)
   (if __limb (setq _limb __limb)) _limb)
  (:serialization-length
   ()
   (+
    ;; sensor_msgs/Image _img
    (send _img :serialization-length)
    ;; string _color
    4 (length _color)
    ;; string _limb
    4 (length _limb)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; sensor_msgs/Image _img
       (send _img :serialize s)
     ;; string _color
       (write-long (length _color) s) (princ _color s)
     ;; string _limb
       (write-long (length _limb) s) (princ _limb s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; sensor_msgs/Image _img
     (send _img :deserialize buf ptr-) (incf ptr- (send _img :serialization-length))
   ;; string _color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _limb
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _limb (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass baxter_msgs_mine::ProcessImageResponse
  :super ros::object
  :slots (_extracted_features _success ))

(defmethod baxter_msgs_mine::ProcessImageResponse
  (:init
   (&key
    ((:extracted_features __extracted_features) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _extracted_features __extracted_features)
   (setq _success __success)
   self)
  (:extracted_features
   (&optional __extracted_features)
   (if __extracted_features (setq _extracted_features __extracted_features)) _extracted_features)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; float64[] _extracted_features
    (* 8    (length _extracted_features)) 4
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _extracted_features
     (write-long (length _extracted_features) s)
     (dotimes (i (length _extracted_features))
       (sys::poke (elt _extracted_features i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _extracted_features
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _extracted_features (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _extracted_features i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass baxter_msgs_mine::ProcessImage
  :super ros::object
  :slots ())

(setf (get baxter_msgs_mine::ProcessImage :md5sum-) "8ddaef76372bb3744b202ff9f1b2b0db")
(setf (get baxter_msgs_mine::ProcessImage :datatype-) "baxter_msgs_mine/ProcessImage")
(setf (get baxter_msgs_mine::ProcessImage :request) baxter_msgs_mine::ProcessImageRequest)
(setf (get baxter_msgs_mine::ProcessImage :response) baxter_msgs_mine::ProcessImageResponse)

(defmethod baxter_msgs_mine::ProcessImageRequest
  (:response () (instance baxter_msgs_mine::ProcessImageResponse :init)))

(setf (get baxter_msgs_mine::ProcessImageRequest :md5sum-) "8ddaef76372bb3744b202ff9f1b2b0db")
(setf (get baxter_msgs_mine::ProcessImageRequest :datatype-) "baxter_msgs_mine/ProcessImageRequest")
(setf (get baxter_msgs_mine::ProcessImageRequest :definition-)
      "sensor_msgs/Image img
string color
string limb

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
---
float64[] extracted_features
bool success
")

(setf (get baxter_msgs_mine::ProcessImageResponse :md5sum-) "8ddaef76372bb3744b202ff9f1b2b0db")
(setf (get baxter_msgs_mine::ProcessImageResponse :datatype-) "baxter_msgs_mine/ProcessImageResponse")
(setf (get baxter_msgs_mine::ProcessImageResponse :definition-)
      "sensor_msgs/Image img
string color
string limb

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id
---
float64[] extracted_features
bool success
")



(provide :baxter_msgs_mine/ProcessImage "8ddaef76372bb3744b202ff9f1b2b0db")



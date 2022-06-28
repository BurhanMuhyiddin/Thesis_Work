;; Auto-generated. Do not edit!


(when (boundp 'process_rope_msgs::SampleRope)
  (if (not (find-package "PROCESS_ROPE_MSGS"))
    (make-package "PROCESS_ROPE_MSGS"))
  (shadow 'SampleRope (find-package "PROCESS_ROPE_MSGS")))
(unless (find-package "PROCESS_ROPE_MSGS::SAMPLEROPE")
  (make-package "PROCESS_ROPE_MSGS::SAMPLEROPE"))
(unless (find-package "PROCESS_ROPE_MSGS::SAMPLEROPEREQUEST")
  (make-package "PROCESS_ROPE_MSGS::SAMPLEROPEREQUEST"))
(unless (find-package "PROCESS_ROPE_MSGS::SAMPLEROPERESPONSE")
  (make-package "PROCESS_ROPE_MSGS::SAMPLEROPERESPONSE"))

(in-package "ROS")





(defclass process_rope_msgs::SampleRopeRequest
  :super ros::object
  :slots (_type _limb _sample_target ))

(defmethod process_rope_msgs::SampleRopeRequest
  (:init
   (&key
    ((:type __type) 0)
    ((:limb __limb) "")
    ((:sample_target __sample_target) nil)
    )
   (send-super :init)
   (setq _type (round __type))
   (setq _limb (string __limb))
   (setq _sample_target __sample_target)
   self)
  (:type
   (&optional __type)
   (if __type (setq _type __type)) _type)
  (:limb
   (&optional __limb)
   (if __limb (setq _limb __limb)) _limb)
  (:sample_target
   (&optional __sample_target)
   (if __sample_target (setq _sample_target __sample_target)) _sample_target)
  (:serialization-length
   ()
   (+
    ;; char _type
    1
    ;; string _limb
    4 (length _limb)
    ;; bool _sample_target
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; char _type
       (write-byte _type s)
     ;; string _limb
       (write-long (length _limb) s) (princ _limb s)
     ;; bool _sample_target
       (if _sample_target (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; char _type
     (setq _type (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; string _limb
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _limb (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _sample_target
     (setq _sample_target (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass process_rope_msgs::SampleRopeResponse
  :super ros::object
  :slots (_sampled_target_points _sampled_current_points _pick_points _pick_img_points _place_points _place_img_points _h_limb _success ))

(defmethod process_rope_msgs::SampleRopeResponse
  (:init
   (&key
    ((:sampled_target_points __sampled_target_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:sampled_current_points __sampled_current_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pick_points __pick_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:pick_img_points __pick_img_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:place_points __place_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:place_img_points __place_img_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:h_limb __h_limb) "")
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _sampled_target_points __sampled_target_points)
   (setq _sampled_current_points __sampled_current_points)
   (setq _pick_points __pick_points)
   (setq _pick_img_points __pick_img_points)
   (setq _place_points __place_points)
   (setq _place_img_points __place_img_points)
   (setq _h_limb (string __h_limb))
   (setq _success __success)
   self)
  (:sampled_target_points
   (&optional __sampled_target_points)
   (if __sampled_target_points (setq _sampled_target_points __sampled_target_points)) _sampled_target_points)
  (:sampled_current_points
   (&optional __sampled_current_points)
   (if __sampled_current_points (setq _sampled_current_points __sampled_current_points)) _sampled_current_points)
  (:pick_points
   (&optional __pick_points)
   (if __pick_points (setq _pick_points __pick_points)) _pick_points)
  (:pick_img_points
   (&optional __pick_img_points)
   (if __pick_img_points (setq _pick_img_points __pick_img_points)) _pick_img_points)
  (:place_points
   (&optional __place_points)
   (if __place_points (setq _place_points __place_points)) _place_points)
  (:place_img_points
   (&optional __place_img_points)
   (if __place_img_points (setq _place_img_points __place_img_points)) _place_img_points)
  (:h_limb
   (&optional __h_limb)
   (if __h_limb (setq _h_limb __h_limb)) _h_limb)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; float64[] _sampled_target_points
    (* 8    (length _sampled_target_points)) 4
    ;; float64[] _sampled_current_points
    (* 8    (length _sampled_current_points)) 4
    ;; float64[] _pick_points
    (* 8    (length _pick_points)) 4
    ;; float64[] _pick_img_points
    (* 8    (length _pick_img_points)) 4
    ;; float64[] _place_points
    (* 8    (length _place_points)) 4
    ;; float64[] _place_img_points
    (* 8    (length _place_img_points)) 4
    ;; string _h_limb
    4 (length _h_limb)
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _sampled_target_points
     (write-long (length _sampled_target_points) s)
     (dotimes (i (length _sampled_target_points))
       (sys::poke (elt _sampled_target_points i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _sampled_current_points
     (write-long (length _sampled_current_points) s)
     (dotimes (i (length _sampled_current_points))
       (sys::poke (elt _sampled_current_points i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _pick_points
     (write-long (length _pick_points) s)
     (dotimes (i (length _pick_points))
       (sys::poke (elt _pick_points i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _pick_img_points
     (write-long (length _pick_img_points) s)
     (dotimes (i (length _pick_img_points))
       (sys::poke (elt _pick_img_points i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _place_points
     (write-long (length _place_points) s)
     (dotimes (i (length _place_points))
       (sys::poke (elt _place_points i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[] _place_img_points
     (write-long (length _place_img_points) s)
     (dotimes (i (length _place_img_points))
       (sys::poke (elt _place_img_points i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; string _h_limb
       (write-long (length _h_limb) s) (princ _h_limb s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _sampled_target_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sampled_target_points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sampled_target_points i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _sampled_current_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _sampled_current_points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _sampled_current_points i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _pick_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pick_points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pick_points i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _pick_img_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pick_img_points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _pick_img_points i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _place_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _place_points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _place_points i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64[] _place_img_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _place_img_points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _place_img_points i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; string _h_limb
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _h_limb (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass process_rope_msgs::SampleRope
  :super ros::object
  :slots ())

(setf (get process_rope_msgs::SampleRope :md5sum-) "51516dd966b40523ec3a38606b7163ae")
(setf (get process_rope_msgs::SampleRope :datatype-) "process_rope_msgs/SampleRope")
(setf (get process_rope_msgs::SampleRope :request) process_rope_msgs::SampleRopeRequest)
(setf (get process_rope_msgs::SampleRope :response) process_rope_msgs::SampleRopeResponse)

(defmethod process_rope_msgs::SampleRopeRequest
  (:response () (instance process_rope_msgs::SampleRopeResponse :init)))

(setf (get process_rope_msgs::SampleRopeRequest :md5sum-) "51516dd966b40523ec3a38606b7163ae")
(setf (get process_rope_msgs::SampleRopeRequest :datatype-) "process_rope_msgs/SampleRopeRequest")
(setf (get process_rope_msgs::SampleRopeRequest :definition-)
      "char type
string limb
bool sample_target
---
float64[] sampled_target_points
float64[] sampled_current_points
float64[] pick_points
float64[] pick_img_points
float64[] place_points
float64[] place_img_points
string h_limb
bool success

")

(setf (get process_rope_msgs::SampleRopeResponse :md5sum-) "51516dd966b40523ec3a38606b7163ae")
(setf (get process_rope_msgs::SampleRopeResponse :datatype-) "process_rope_msgs/SampleRopeResponse")
(setf (get process_rope_msgs::SampleRopeResponse :definition-)
      "char type
string limb
bool sample_target
---
float64[] sampled_target_points
float64[] sampled_current_points
float64[] pick_points
float64[] pick_img_points
float64[] place_points
float64[] place_img_points
string h_limb
bool success

")



(provide :process_rope_msgs/SampleRope "51516dd966b40523ec3a38606b7163ae")



;; Auto-generated. Do not edit!


(when (boundp 'baxter_msgs_mine::Cvt2Wrld)
  (if (not (find-package "BAXTER_MSGS_MINE"))
    (make-package "BAXTER_MSGS_MINE"))
  (shadow 'Cvt2Wrld (find-package "BAXTER_MSGS_MINE")))
(unless (find-package "BAXTER_MSGS_MINE::CVT2WRLD")
  (make-package "BAXTER_MSGS_MINE::CVT2WRLD"))
(unless (find-package "BAXTER_MSGS_MINE::CVT2WRLDREQUEST")
  (make-package "BAXTER_MSGS_MINE::CVT2WRLDREQUEST"))
(unless (find-package "BAXTER_MSGS_MINE::CVT2WRLDRESPONSE")
  (make-package "BAXTER_MSGS_MINE::CVT2WRLDRESPONSE"))

(in-package "ROS")





(defclass baxter_msgs_mine::Cvt2WrldRequest
  :super ros::object
  :slots (_img_points _limb ))

(defmethod baxter_msgs_mine::Cvt2WrldRequest
  (:init
   (&key
    ((:img_points __img_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:limb __limb) "")
    )
   (send-super :init)
   (setq _img_points __img_points)
   (setq _limb (string __limb))
   self)
  (:img_points
   (&optional __img_points)
   (if __img_points (setq _img_points __img_points)) _img_points)
  (:limb
   (&optional __limb)
   (if __limb (setq _limb __limb)) _limb)
  (:serialization-length
   ()
   (+
    ;; float64[] _img_points
    (* 8    (length _img_points)) 4
    ;; string _limb
    4 (length _limb)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _img_points
     (write-long (length _img_points) s)
     (dotimes (i (length _img_points))
       (sys::poke (elt _img_points i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; string _limb
       (write-long (length _limb) s) (princ _limb s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _img_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _img_points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _img_points i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; string _limb
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _limb (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass baxter_msgs_mine::Cvt2WrldResponse
  :super ros::object
  :slots (_wrld_points _success ))

(defmethod baxter_msgs_mine::Cvt2WrldResponse
  (:init
   (&key
    ((:wrld_points __wrld_points) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _wrld_points __wrld_points)
   (setq _success __success)
   self)
  (:wrld_points
   (&optional __wrld_points)
   (if __wrld_points (setq _wrld_points __wrld_points)) _wrld_points)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; float64[] _wrld_points
    (* 8    (length _wrld_points)) 4
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _wrld_points
     (write-long (length _wrld_points) s)
     (dotimes (i (length _wrld_points))
       (sys::poke (elt _wrld_points i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _wrld_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _wrld_points (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _wrld_points i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass baxter_msgs_mine::Cvt2Wrld
  :super ros::object
  :slots ())

(setf (get baxter_msgs_mine::Cvt2Wrld :md5sum-) "2ce5c3384f15a765a1063a3a6f79f77c")
(setf (get baxter_msgs_mine::Cvt2Wrld :datatype-) "baxter_msgs_mine/Cvt2Wrld")
(setf (get baxter_msgs_mine::Cvt2Wrld :request) baxter_msgs_mine::Cvt2WrldRequest)
(setf (get baxter_msgs_mine::Cvt2Wrld :response) baxter_msgs_mine::Cvt2WrldResponse)

(defmethod baxter_msgs_mine::Cvt2WrldRequest
  (:response () (instance baxter_msgs_mine::Cvt2WrldResponse :init)))

(setf (get baxter_msgs_mine::Cvt2WrldRequest :md5sum-) "2ce5c3384f15a765a1063a3a6f79f77c")
(setf (get baxter_msgs_mine::Cvt2WrldRequest :datatype-) "baxter_msgs_mine/Cvt2WrldRequest")
(setf (get baxter_msgs_mine::Cvt2WrldRequest :definition-)
      "float64[] img_points
string limb
---
float64[] wrld_points
bool success
")

(setf (get baxter_msgs_mine::Cvt2WrldResponse :md5sum-) "2ce5c3384f15a765a1063a3a6f79f77c")
(setf (get baxter_msgs_mine::Cvt2WrldResponse :datatype-) "baxter_msgs_mine/Cvt2WrldResponse")
(setf (get baxter_msgs_mine::Cvt2WrldResponse :definition-)
      "float64[] img_points
string limb
---
float64[] wrld_points
bool success
")



(provide :baxter_msgs_mine/Cvt2Wrld "2ce5c3384f15a765a1063a3a6f79f77c")



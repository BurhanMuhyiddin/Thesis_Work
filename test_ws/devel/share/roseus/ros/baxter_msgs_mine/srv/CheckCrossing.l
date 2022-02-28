;; Auto-generated. Do not edit!


(when (boundp 'baxter_msgs_mine::CheckCrossing)
  (if (not (find-package "BAXTER_MSGS_MINE"))
    (make-package "BAXTER_MSGS_MINE"))
  (shadow 'CheckCrossing (find-package "BAXTER_MSGS_MINE")))
(unless (find-package "BAXTER_MSGS_MINE::CHECKCROSSING")
  (make-package "BAXTER_MSGS_MINE::CHECKCROSSING"))
(unless (find-package "BAXTER_MSGS_MINE::CHECKCROSSINGREQUEST")
  (make-package "BAXTER_MSGS_MINE::CHECKCROSSINGREQUEST"))
(unless (find-package "BAXTER_MSGS_MINE::CHECKCROSSINGRESPONSE")
  (make-package "BAXTER_MSGS_MINE::CHECKCROSSINGRESPONSE"))

(in-package "ROS")





(defclass baxter_msgs_mine::CheckCrossingRequest
  :super ros::object
  :slots (_color ))

(defmethod baxter_msgs_mine::CheckCrossingRequest
  (:init
   (&key
    ((:color __color) "")
    )
   (send-super :init)
   (setq _color (string __color))
   self)
  (:color
   (&optional __color)
   (if __color (setq _color __color)) _color)
  (:serialization-length
   ()
   (+
    ;; string _color
    4 (length _color)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _color
       (write-long (length _color) s) (princ _color s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _color
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _color (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass baxter_msgs_mine::CheckCrossingResponse
  :super ros::object
  :slots (_limb _success ))

(defmethod baxter_msgs_mine::CheckCrossingResponse
  (:init
   (&key
    ((:limb __limb) "")
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _limb (string __limb))
   (setq _success __success)
   self)
  (:limb
   (&optional __limb)
   (if __limb (setq _limb __limb)) _limb)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; string _limb
    4 (length _limb)
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _limb
       (write-long (length _limb) s) (princ _limb s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _limb
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _limb (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass baxter_msgs_mine::CheckCrossing
  :super ros::object
  :slots ())

(setf (get baxter_msgs_mine::CheckCrossing :md5sum-) "43681e71f21e5675de1d59f1aa7c14d7")
(setf (get baxter_msgs_mine::CheckCrossing :datatype-) "baxter_msgs_mine/CheckCrossing")
(setf (get baxter_msgs_mine::CheckCrossing :request) baxter_msgs_mine::CheckCrossingRequest)
(setf (get baxter_msgs_mine::CheckCrossing :response) baxter_msgs_mine::CheckCrossingResponse)

(defmethod baxter_msgs_mine::CheckCrossingRequest
  (:response () (instance baxter_msgs_mine::CheckCrossingResponse :init)))

(setf (get baxter_msgs_mine::CheckCrossingRequest :md5sum-) "43681e71f21e5675de1d59f1aa7c14d7")
(setf (get baxter_msgs_mine::CheckCrossingRequest :datatype-) "baxter_msgs_mine/CheckCrossingRequest")
(setf (get baxter_msgs_mine::CheckCrossingRequest :definition-)
      "string color
---
string limb
bool success
")

(setf (get baxter_msgs_mine::CheckCrossingResponse :md5sum-) "43681e71f21e5675de1d59f1aa7c14d7")
(setf (get baxter_msgs_mine::CheckCrossingResponse :datatype-) "baxter_msgs_mine/CheckCrossingResponse")
(setf (get baxter_msgs_mine::CheckCrossingResponse :definition-)
      "string color
---
string limb
bool success
")



(provide :baxter_msgs_mine/CheckCrossing "43681e71f21e5675de1d59f1aa7c14d7")



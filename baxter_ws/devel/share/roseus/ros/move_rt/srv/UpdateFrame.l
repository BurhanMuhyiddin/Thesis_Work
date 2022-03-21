;; Auto-generated. Do not edit!


(when (boundp 'move_rt::UpdateFrame)
  (if (not (find-package "MOVE_RT"))
    (make-package "MOVE_RT"))
  (shadow 'UpdateFrame (find-package "MOVE_RT")))
(unless (find-package "MOVE_RT::UPDATEFRAME")
  (make-package "MOVE_RT::UPDATEFRAME"))
(unless (find-package "MOVE_RT::UPDATEFRAMEREQUEST")
  (make-package "MOVE_RT::UPDATEFRAMEREQUEST"))
(unless (find-package "MOVE_RT::UPDATEFRAMERESPONSE")
  (make-package "MOVE_RT::UPDATEFRAMERESPONSE"))

(in-package "ROS")





(defclass move_rt::UpdateFrameRequest
  :super ros::object
  :slots (_frame ))

(defmethod move_rt::UpdateFrameRequest
  (:init
   (&key
    ((:frame __frame) "")
    )
   (send-super :init)
   (setq _frame (string __frame))
   self)
  (:frame
   (&optional __frame)
   (if __frame (setq _frame __frame)) _frame)
  (:serialization-length
   ()
   (+
    ;; string _frame
    4 (length _frame)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _frame
       (write-long (length _frame) s) (princ _frame s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _frame
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _frame (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass move_rt::UpdateFrameResponse
  :super ros::object
  :slots (_result ))

(defmethod move_rt::UpdateFrameResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass move_rt::UpdateFrame
  :super ros::object
  :slots ())

(setf (get move_rt::UpdateFrame :md5sum-) "323fd8a2fa219baecffe89d7ec1e70e3")
(setf (get move_rt::UpdateFrame :datatype-) "move_rt/UpdateFrame")
(setf (get move_rt::UpdateFrame :request) move_rt::UpdateFrameRequest)
(setf (get move_rt::UpdateFrame :response) move_rt::UpdateFrameResponse)

(defmethod move_rt::UpdateFrameRequest
  (:response () (instance move_rt::UpdateFrameResponse :init)))

(setf (get move_rt::UpdateFrameRequest :md5sum-) "323fd8a2fa219baecffe89d7ec1e70e3")
(setf (get move_rt::UpdateFrameRequest :datatype-) "move_rt/UpdateFrameRequest")
(setf (get move_rt::UpdateFrameRequest :definition-)
      "string frame
---
bool result

")

(setf (get move_rt::UpdateFrameResponse :md5sum-) "323fd8a2fa219baecffe89d7ec1e70e3")
(setf (get move_rt::UpdateFrameResponse :datatype-) "move_rt/UpdateFrameResponse")
(setf (get move_rt::UpdateFrameResponse :definition-)
      "string frame
---
bool result

")



(provide :move_rt/UpdateFrame "323fd8a2fa219baecffe89d7ec1e70e3")



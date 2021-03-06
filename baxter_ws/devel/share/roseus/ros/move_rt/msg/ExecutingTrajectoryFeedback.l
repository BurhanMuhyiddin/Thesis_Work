;; Auto-generated. Do not edit!


(when (boundp 'move_rt::ExecutingTrajectoryFeedback)
  (if (not (find-package "MOVE_RT"))
    (make-package "MOVE_RT"))
  (shadow 'ExecutingTrajectoryFeedback (find-package "MOVE_RT")))
(unless (find-package "MOVE_RT::EXECUTINGTRAJECTORYFEEDBACK")
  (make-package "MOVE_RT::EXECUTINGTRAJECTORYFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude ExecutingTrajectoryFeedback.msg.html


(defclass move_rt::ExecutingTrajectoryFeedback
  :super ros::object
  :slots (_percent_complete ))

(defmethod move_rt::ExecutingTrajectoryFeedback
  (:init
   (&key
    ((:percent_complete __percent_complete) 0.0)
    )
   (send-super :init)
   (setq _percent_complete (float __percent_complete))
   self)
  (:percent_complete
   (&optional __percent_complete)
   (if __percent_complete (setq _percent_complete __percent_complete)) _percent_complete)
  (:serialization-length
   ()
   (+
    ;; float64 _percent_complete
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _percent_complete
       (sys::poke _percent_complete (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _percent_complete
     (setq _percent_complete (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get move_rt::ExecutingTrajectoryFeedback :md5sum-) "cc6abe8bc172f00995b2c3f53015f718")
(setf (get move_rt::ExecutingTrajectoryFeedback :datatype-) "move_rt/ExecutingTrajectoryFeedback")
(setf (get move_rt::ExecutingTrajectoryFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Define a feedback message
float64 percent_complete


")



(provide :move_rt/ExecutingTrajectoryFeedback "cc6abe8bc172f00995b2c3f53015f718")



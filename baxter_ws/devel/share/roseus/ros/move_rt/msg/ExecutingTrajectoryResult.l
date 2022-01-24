;; Auto-generated. Do not edit!


(when (boundp 'move_rt::ExecutingTrajectoryResult)
  (if (not (find-package "MOVE_RT"))
    (make-package "MOVE_RT"))
  (shadow 'ExecutingTrajectoryResult (find-package "MOVE_RT")))
(unless (find-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT")
  (make-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT"))

(in-package "ROS")
;;//! \htmlinclude ExecutingTrajectoryResult.msg.html


(intern "*SUCCESSFUL*" (find-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT"))
(shadow '*SUCCESSFUL* (find-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT"))
(defconstant move_rt::ExecutingTrajectoryResult::*SUCCESSFUL* 0)
(intern "*INVALID_GOAL*" (find-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT"))
(shadow '*INVALID_GOAL* (find-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT"))
(defconstant move_rt::ExecutingTrajectoryResult::*INVALID_GOAL* -1)
(intern "*INVALID_JOINTS*" (find-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT"))
(shadow '*INVALID_JOINTS* (find-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT"))
(defconstant move_rt::ExecutingTrajectoryResult::*INVALID_JOINTS* -2)
(intern "*OLD_HEADER_TIMESTAMP*" (find-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT"))
(shadow '*OLD_HEADER_TIMESTAMP* (find-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT"))
(defconstant move_rt::ExecutingTrajectoryResult::*OLD_HEADER_TIMESTAMP* -3)
(intern "*PATH_TOLERANCE_VIOLATED*" (find-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT"))
(shadow '*PATH_TOLERANCE_VIOLATED* (find-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT"))
(defconstant move_rt::ExecutingTrajectoryResult::*PATH_TOLERANCE_VIOLATED* -4)
(intern "*GOAL_TOLERANCE_VIOLATED*" (find-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT"))
(shadow '*GOAL_TOLERANCE_VIOLATED* (find-package "MOVE_RT::EXECUTINGTRAJECTORYRESULT"))
(defconstant move_rt::ExecutingTrajectoryResult::*GOAL_TOLERANCE_VIOLATED* -5)
(defclass move_rt::ExecutingTrajectoryResult
  :super ros::object
  :slots (_error_code ))

(defmethod move_rt::ExecutingTrajectoryResult
  (:init
   (&key
    ((:error_code __error_code) 0)
    )
   (send-super :init)
   (setq _error_code (round __error_code))
   self)
  (:error_code
   (&optional __error_code)
   (if __error_code (setq _error_code __error_code)) _error_code)
  (:serialization-length
   ()
   (+
    ;; int32 _error_code
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _error_code
       (write-long _error_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _error_code
     (setq _error_code (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get move_rt::ExecutingTrajectoryResult :md5sum-) "6243274b5d629dc838814109754410d5")
(setf (get move_rt::ExecutingTrajectoryResult :datatype-) "move_rt/ExecutingTrajectoryResult")
(setf (get move_rt::ExecutingTrajectoryResult :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Define the result
int32 error_code
int32 SUCCESSFUL = 0
int32 INVALID_GOAL = -1
int32 INVALID_JOINTS = -2
int32 OLD_HEADER_TIMESTAMP = -3
int32 PATH_TOLERANCE_VIOLATED = -4
int32 GOAL_TOLERANCE_VIOLATED = -5

")



(provide :move_rt/ExecutingTrajectoryResult "6243274b5d629dc838814109754410d5")


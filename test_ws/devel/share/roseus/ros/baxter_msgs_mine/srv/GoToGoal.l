;; Auto-generated. Do not edit!


(when (boundp 'baxter_msgs_mine::GoToGoal)
  (if (not (find-package "BAXTER_MSGS_MINE"))
    (make-package "BAXTER_MSGS_MINE"))
  (shadow 'GoToGoal (find-package "BAXTER_MSGS_MINE")))
(unless (find-package "BAXTER_MSGS_MINE::GOTOGOAL")
  (make-package "BAXTER_MSGS_MINE::GOTOGOAL"))
(unless (find-package "BAXTER_MSGS_MINE::GOTOGOALREQUEST")
  (make-package "BAXTER_MSGS_MINE::GOTOGOALREQUEST"))
(unless (find-package "BAXTER_MSGS_MINE::GOTOGOALRESPONSE")
  (make-package "BAXTER_MSGS_MINE::GOTOGOALRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass baxter_msgs_mine::GoToGoalRequest
  :super ros::object
  :slots (_goal _limb _pos_only_ik ))

(defmethod baxter_msgs_mine::GoToGoalRequest
  (:init
   (&key
    ((:goal __goal) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Pose :init) r)) r))
    ((:limb __limb) "")
    ((:pos_only_ik __pos_only_ik) nil)
    )
   (send-super :init)
   (setq _goal __goal)
   (setq _limb (string __limb))
   (setq _pos_only_ik __pos_only_ik)
   self)
  (:goal
   (&rest __goal)
   (if (keywordp (car __goal))
       (send* _goal __goal)
     (progn
       (if __goal (setq _goal (car __goal)))
       _goal)))
  (:limb
   (&optional __limb)
   (if __limb (setq _limb __limb)) _limb)
  (:pos_only_ik
   (&optional __pos_only_ik)
   (if __pos_only_ik (setq _pos_only_ik __pos_only_ik)) _pos_only_ik)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose[] _goal
    (apply #'+ (send-all _goal :serialization-length)) 4
    ;; string _limb
    4 (length _limb)
    ;; bool _pos_only_ik
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose[] _goal
     (write-long (length _goal) s)
     (dolist (elem _goal)
       (send elem :serialize s)
       )
     ;; string _limb
       (write-long (length _limb) s) (princ _limb s)
     ;; bool _pos_only_ik
       (if _pos_only_ik (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose[] _goal
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _goal (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _goal)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string _limb
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _limb (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; bool _pos_only_ik
     (setq _pos_only_ik (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass baxter_msgs_mine::GoToGoalResponse
  :super ros::object
  :slots (_success ))

(defmethod baxter_msgs_mine::GoToGoalResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass baxter_msgs_mine::GoToGoal
  :super ros::object
  :slots ())

(setf (get baxter_msgs_mine::GoToGoal :md5sum-) "020d1aceb48caf436ac8ca2d5b166385")
(setf (get baxter_msgs_mine::GoToGoal :datatype-) "baxter_msgs_mine/GoToGoal")
(setf (get baxter_msgs_mine::GoToGoal :request) baxter_msgs_mine::GoToGoalRequest)
(setf (get baxter_msgs_mine::GoToGoal :response) baxter_msgs_mine::GoToGoalResponse)

(defmethod baxter_msgs_mine::GoToGoalRequest
  (:response () (instance baxter_msgs_mine::GoToGoalResponse :init)))

(setf (get baxter_msgs_mine::GoToGoalRequest :md5sum-) "020d1aceb48caf436ac8ca2d5b166385")
(setf (get baxter_msgs_mine::GoToGoalRequest :datatype-) "baxter_msgs_mine/GoToGoalRequest")
(setf (get baxter_msgs_mine::GoToGoalRequest :definition-)
      "geometry_msgs/Pose[] goal
string limb
bool pos_only_ik

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success
")

(setf (get baxter_msgs_mine::GoToGoalResponse :md5sum-) "020d1aceb48caf436ac8ca2d5b166385")
(setf (get baxter_msgs_mine::GoToGoalResponse :datatype-) "baxter_msgs_mine/GoToGoalResponse")
(setf (get baxter_msgs_mine::GoToGoalResponse :definition-)
      "geometry_msgs/Pose[] goal
string limb
bool pos_only_ik

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success
")



(provide :baxter_msgs_mine/GoToGoal "020d1aceb48caf436ac8ca2d5b166385")



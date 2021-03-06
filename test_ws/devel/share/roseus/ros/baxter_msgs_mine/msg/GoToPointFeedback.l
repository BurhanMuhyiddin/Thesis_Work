;; Auto-generated. Do not edit!


(when (boundp 'baxter_msgs_mine::GoToPointFeedback)
  (if (not (find-package "BAXTER_MSGS_MINE"))
    (make-package "BAXTER_MSGS_MINE"))
  (shadow 'GoToPointFeedback (find-package "BAXTER_MSGS_MINE")))
(unless (find-package "BAXTER_MSGS_MINE::GOTOPOINTFEEDBACK")
  (make-package "BAXTER_MSGS_MINE::GOTOPOINTFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude GoToPointFeedback.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass baxter_msgs_mine::GoToPointFeedback
  :super ros::object
  :slots (_current_pose ))

(defmethod baxter_msgs_mine::GoToPointFeedback
  (:init
   (&key
    ((:current_pose __current_pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _current_pose __current_pose)
   self)
  (:current_pose
   (&rest __current_pose)
   (if (keywordp (car __current_pose))
       (send* _current_pose __current_pose)
     (progn
       (if __current_pose (setq _current_pose (car __current_pose)))
       _current_pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _current_pose
    (send _current_pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _current_pose
       (send _current_pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _current_pose
     (send _current_pose :deserialize buf ptr-) (incf ptr- (send _current_pose :serialization-length))
   ;;
   self)
  )

(setf (get baxter_msgs_mine::GoToPointFeedback :md5sum-) "8aa49ba45d5b9d2df8a650fff8d23e31")
(setf (get baxter_msgs_mine::GoToPointFeedback :datatype-) "baxter_msgs_mine/GoToPointFeedback")
(setf (get baxter_msgs_mine::GoToPointFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#feedback
geometry_msgs/Pose current_pose

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

")



(provide :baxter_msgs_mine/GoToPointFeedback "8aa49ba45d5b9d2df8a650fff8d23e31")



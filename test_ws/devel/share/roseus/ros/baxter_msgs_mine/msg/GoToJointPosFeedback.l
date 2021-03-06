;; Auto-generated. Do not edit!


(when (boundp 'baxter_msgs_mine::GoToJointPosFeedback)
  (if (not (find-package "BAXTER_MSGS_MINE"))
    (make-package "BAXTER_MSGS_MINE"))
  (shadow 'GoToJointPosFeedback (find-package "BAXTER_MSGS_MINE")))
(unless (find-package "BAXTER_MSGS_MINE::GOTOJOINTPOSFEEDBACK")
  (make-package "BAXTER_MSGS_MINE::GOTOJOINTPOSFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude GoToJointPosFeedback.msg.html


(defclass baxter_msgs_mine::GoToJointPosFeedback
  :super ros::object
  :slots (_current_pose ))

(defmethod baxter_msgs_mine::GoToJointPosFeedback
  (:init
   (&key
    ((:current_pose __current_pose) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _current_pose __current_pose)
   self)
  (:current_pose
   (&optional __current_pose)
   (if __current_pose (setq _current_pose __current_pose)) _current_pose)
  (:serialization-length
   ()
   (+
    ;; float32[] _current_pose
    (* 4    (length _current_pose)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _current_pose
     (write-long (length _current_pose) s)
     (dotimes (i (length _current_pose))
       (sys::poke (elt _current_pose i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _current_pose
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _current_pose (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _current_pose i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get baxter_msgs_mine::GoToJointPosFeedback :md5sum-) "08f77cad95bf249f1c96e79e0b413d06")
(setf (get baxter_msgs_mine::GoToJointPosFeedback :datatype-) "baxter_msgs_mine/GoToJointPosFeedback")
(setf (get baxter_msgs_mine::GoToJointPosFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#feedback
float32[] current_pose

")



(provide :baxter_msgs_mine/GoToJointPosFeedback "08f77cad95bf249f1c96e79e0b413d06")



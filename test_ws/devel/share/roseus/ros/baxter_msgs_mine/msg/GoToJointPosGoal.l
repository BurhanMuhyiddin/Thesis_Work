;; Auto-generated. Do not edit!


(when (boundp 'baxter_msgs_mine::GoToJointPosGoal)
  (if (not (find-package "BAXTER_MSGS_MINE"))
    (make-package "BAXTER_MSGS_MINE"))
  (shadow 'GoToJointPosGoal (find-package "BAXTER_MSGS_MINE")))
(unless (find-package "BAXTER_MSGS_MINE::GOTOJOINTPOSGOAL")
  (make-package "BAXTER_MSGS_MINE::GOTOJOINTPOSGOAL"))

(in-package "ROS")
;;//! \htmlinclude GoToJointPosGoal.msg.html


(defclass baxter_msgs_mine::GoToJointPosGoal
  :super ros::object
  :slots (_desired_pose _limb ))

(defmethod baxter_msgs_mine::GoToJointPosGoal
  (:init
   (&key
    ((:desired_pose __desired_pose) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:limb __limb) "")
    )
   (send-super :init)
   (setq _desired_pose __desired_pose)
   (setq _limb (string __limb))
   self)
  (:desired_pose
   (&optional __desired_pose)
   (if __desired_pose (setq _desired_pose __desired_pose)) _desired_pose)
  (:limb
   (&optional __limb)
   (if __limb (setq _limb __limb)) _limb)
  (:serialization-length
   ()
   (+
    ;; float32[] _desired_pose
    (* 4    (length _desired_pose)) 4
    ;; string _limb
    4 (length _limb)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _desired_pose
     (write-long (length _desired_pose) s)
     (dotimes (i (length _desired_pose))
       (sys::poke (elt _desired_pose i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; string _limb
       (write-long (length _limb) s) (princ _limb s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _desired_pose
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _desired_pose (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _desired_pose i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; string _limb
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _limb (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get baxter_msgs_mine::GoToJointPosGoal :md5sum-) "b4a71d5db17a0134d8420bee776225cd")
(setf (get baxter_msgs_mine::GoToJointPosGoal :datatype-) "baxter_msgs_mine/GoToJointPosGoal")
(setf (get baxter_msgs_mine::GoToJointPosGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#goal
float32[] desired_pose
string limb

")



(provide :baxter_msgs_mine/GoToJointPosGoal "b4a71d5db17a0134d8420bee776225cd")


;; Auto-generated. Do not edit!


(when (boundp 'baxter_msgs_mine::GoToJointGoal)
  (if (not (find-package "BAXTER_MSGS_MINE"))
    (make-package "BAXTER_MSGS_MINE"))
  (shadow 'GoToJointGoal (find-package "BAXTER_MSGS_MINE")))
(unless (find-package "BAXTER_MSGS_MINE::GOTOJOINTGOAL")
  (make-package "BAXTER_MSGS_MINE::GOTOJOINTGOAL"))
(unless (find-package "BAXTER_MSGS_MINE::GOTOJOINTGOALREQUEST")
  (make-package "BAXTER_MSGS_MINE::GOTOJOINTGOALREQUEST"))
(unless (find-package "BAXTER_MSGS_MINE::GOTOJOINTGOALRESPONSE")
  (make-package "BAXTER_MSGS_MINE::GOTOJOINTGOALRESPONSE"))

(in-package "ROS")





(defclass baxter_msgs_mine::GoToJointGoalRequest
  :super ros::object
  :slots (_goal _limb ))

(defmethod baxter_msgs_mine::GoToJointGoalRequest
  (:init
   (&key
    ((:goal __goal) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:limb __limb) "")
    )
   (send-super :init)
   (setq _goal __goal)
   (setq _limb (string __limb))
   self)
  (:goal
   (&optional __goal)
   (if __goal (setq _goal __goal)) _goal)
  (:limb
   (&optional __limb)
   (if __limb (setq _limb __limb)) _limb)
  (:serialization-length
   ()
   (+
    ;; float32[] _goal
    (* 4    (length _goal)) 4
    ;; string _limb
    4 (length _limb)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _goal
     (write-long (length _goal) s)
     (dotimes (i (length _goal))
       (sys::poke (elt _goal i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; string _limb
       (write-long (length _limb) s) (princ _limb s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _goal
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _goal (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _goal i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;; string _limb
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _limb (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass baxter_msgs_mine::GoToJointGoalResponse
  :super ros::object
  :slots (_success ))

(defmethod baxter_msgs_mine::GoToJointGoalResponse
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

(defclass baxter_msgs_mine::GoToJointGoal
  :super ros::object
  :slots ())

(setf (get baxter_msgs_mine::GoToJointGoal :md5sum-) "81a2c4bff10997d9f224ac63631e3d27")
(setf (get baxter_msgs_mine::GoToJointGoal :datatype-) "baxter_msgs_mine/GoToJointGoal")
(setf (get baxter_msgs_mine::GoToJointGoal :request) baxter_msgs_mine::GoToJointGoalRequest)
(setf (get baxter_msgs_mine::GoToJointGoal :response) baxter_msgs_mine::GoToJointGoalResponse)

(defmethod baxter_msgs_mine::GoToJointGoalRequest
  (:response () (instance baxter_msgs_mine::GoToJointGoalResponse :init)))

(setf (get baxter_msgs_mine::GoToJointGoalRequest :md5sum-) "81a2c4bff10997d9f224ac63631e3d27")
(setf (get baxter_msgs_mine::GoToJointGoalRequest :datatype-) "baxter_msgs_mine/GoToJointGoalRequest")
(setf (get baxter_msgs_mine::GoToJointGoalRequest :definition-)
      "float32[] goal
string limb
---
bool success
")

(setf (get baxter_msgs_mine::GoToJointGoalResponse :md5sum-) "81a2c4bff10997d9f224ac63631e3d27")
(setf (get baxter_msgs_mine::GoToJointGoalResponse :datatype-) "baxter_msgs_mine/GoToJointGoalResponse")
(setf (get baxter_msgs_mine::GoToJointGoalResponse :definition-)
      "float32[] goal
string limb
---
bool success
")



(provide :baxter_msgs_mine/GoToJointGoal "81a2c4bff10997d9f224ac63631e3d27")



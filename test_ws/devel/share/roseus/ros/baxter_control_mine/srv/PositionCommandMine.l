;; Auto-generated. Do not edit!


(when (boundp 'baxter_control_mine::PositionCommandMine)
  (if (not (find-package "BAXTER_CONTROL_MINE"))
    (make-package "BAXTER_CONTROL_MINE"))
  (shadow 'PositionCommandMine (find-package "BAXTER_CONTROL_MINE")))
(unless (find-package "BAXTER_CONTROL_MINE::POSITIONCOMMANDMINE")
  (make-package "BAXTER_CONTROL_MINE::POSITIONCOMMANDMINE"))
(unless (find-package "BAXTER_CONTROL_MINE::POSITIONCOMMANDMINEREQUEST")
  (make-package "BAXTER_CONTROL_MINE::POSITIONCOMMANDMINEREQUEST"))
(unless (find-package "BAXTER_CONTROL_MINE::POSITIONCOMMANDMINERESPONSE")
  (make-package "BAXTER_CONTROL_MINE::POSITIONCOMMANDMINERESPONSE"))

(in-package "ROS")





(defclass baxter_control_mine::PositionCommandMineRequest
  :super ros::object
  :slots (_position_command ))

(defmethod baxter_control_mine::PositionCommandMineRequest
  (:init
   (&key
    ((:position_command __position_command) "")
    )
   (send-super :init)
   (setq _position_command (string __position_command))
   self)
  (:position_command
   (&optional __position_command)
   (if __position_command (setq _position_command __position_command)) _position_command)
  (:serialization-length
   ()
   (+
    ;; string _position_command
    4 (length _position_command)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _position_command
       (write-long (length _position_command) s) (princ _position_command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _position_command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _position_command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass baxter_control_mine::PositionCommandMineResponse
  :super ros::object
  :slots (_success ))

(defmethod baxter_control_mine::PositionCommandMineResponse
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

(defclass baxter_control_mine::PositionCommandMine
  :super ros::object
  :slots ())

(setf (get baxter_control_mine::PositionCommandMine :md5sum-) "90005b3bd3e0858473cd0f1bcad7b688")
(setf (get baxter_control_mine::PositionCommandMine :datatype-) "baxter_control_mine/PositionCommandMine")
(setf (get baxter_control_mine::PositionCommandMine :request) baxter_control_mine::PositionCommandMineRequest)
(setf (get baxter_control_mine::PositionCommandMine :response) baxter_control_mine::PositionCommandMineResponse)

(defmethod baxter_control_mine::PositionCommandMineRequest
  (:response () (instance baxter_control_mine::PositionCommandMineResponse :init)))

(setf (get baxter_control_mine::PositionCommandMineRequest :md5sum-) "90005b3bd3e0858473cd0f1bcad7b688")
(setf (get baxter_control_mine::PositionCommandMineRequest :datatype-) "baxter_control_mine/PositionCommandMineRequest")
(setf (get baxter_control_mine::PositionCommandMineRequest :definition-)
      "string position_command
---
bool success
")

(setf (get baxter_control_mine::PositionCommandMineResponse :md5sum-) "90005b3bd3e0858473cd0f1bcad7b688")
(setf (get baxter_control_mine::PositionCommandMineResponse :datatype-) "baxter_control_mine/PositionCommandMineResponse")
(setf (get baxter_control_mine::PositionCommandMineResponse :definition-)
      "string position_command
---
bool success
")



(provide :baxter_control_mine/PositionCommandMine "90005b3bd3e0858473cd0f1bcad7b688")




(cl:in-package :asdf)

(defsystem "baxter_msgs_mine-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
)
  :components ((:file "_package")
    (:file "CalculateIK" :depends-on ("_package_CalculateIK"))
    (:file "_package_CalculateIK" :depends-on ("_package"))
    (:file "GetCurrentJointStates" :depends-on ("_package_GetCurrentJointStates"))
    (:file "_package_GetCurrentJointStates" :depends-on ("_package"))
    (:file "PositionCommandMine" :depends-on ("_package_PositionCommandMine"))
    (:file "_package_PositionCommandMine" :depends-on ("_package"))
    (:file "ProcessImage" :depends-on ("_package_ProcessImage"))
    (:file "_package_ProcessImage" :depends-on ("_package"))
  ))
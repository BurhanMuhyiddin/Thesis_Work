
(cl:in-package :asdf)

(defsystem "baxter_msgs_mine-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CameraDebug" :depends-on ("_package_CameraDebug"))
    (:file "_package_CameraDebug" :depends-on ("_package"))
    (:file "GoToPointAction" :depends-on ("_package_GoToPointAction"))
    (:file "_package_GoToPointAction" :depends-on ("_package"))
    (:file "GoToPointActionFeedback" :depends-on ("_package_GoToPointActionFeedback"))
    (:file "_package_GoToPointActionFeedback" :depends-on ("_package"))
    (:file "GoToPointActionGoal" :depends-on ("_package_GoToPointActionGoal"))
    (:file "_package_GoToPointActionGoal" :depends-on ("_package"))
    (:file "GoToPointActionResult" :depends-on ("_package_GoToPointActionResult"))
    (:file "_package_GoToPointActionResult" :depends-on ("_package"))
    (:file "GoToPointFeedback" :depends-on ("_package_GoToPointFeedback"))
    (:file "_package_GoToPointFeedback" :depends-on ("_package"))
    (:file "GoToPointGoal" :depends-on ("_package_GoToPointGoal"))
    (:file "_package_GoToPointGoal" :depends-on ("_package"))
    (:file "GoToPointResult" :depends-on ("_package_GoToPointResult"))
    (:file "_package_GoToPointResult" :depends-on ("_package"))
  ))
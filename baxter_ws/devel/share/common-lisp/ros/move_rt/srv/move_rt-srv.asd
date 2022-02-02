
(cl:in-package :asdf)

(defsystem "move_rt-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "TaskParamUpdate" :depends-on ("_package_TaskParamUpdate"))
    (:file "_package_TaskParamUpdate" :depends-on ("_package"))
    (:file "UpdateFrame" :depends-on ("_package_UpdateFrame"))
    (:file "_package_UpdateFrame" :depends-on ("_package"))
  ))
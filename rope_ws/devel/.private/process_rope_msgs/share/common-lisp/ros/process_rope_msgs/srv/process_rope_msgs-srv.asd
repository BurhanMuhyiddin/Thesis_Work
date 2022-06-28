
(cl:in-package :asdf)

(defsystem "process_rope_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SampleRope" :depends-on ("_package_SampleRope"))
    (:file "_package_SampleRope" :depends-on ("_package"))
  ))
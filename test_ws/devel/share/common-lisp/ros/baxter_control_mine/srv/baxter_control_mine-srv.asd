
(cl:in-package :asdf)

(defsystem "baxter_control_mine-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PositionCommandMine" :depends-on ("_package_PositionCommandMine"))
    (:file "_package_PositionCommandMine" :depends-on ("_package"))
  ))
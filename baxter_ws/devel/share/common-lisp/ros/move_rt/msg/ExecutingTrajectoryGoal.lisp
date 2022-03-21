; Auto-generated. Do not edit!


(cl:in-package move_rt-msg)


;//! \htmlinclude ExecutingTrajectoryGoal.msg.html

(cl:defclass <ExecutingTrajectoryGoal> (roslisp-msg-protocol:ros-message)
  ((trajectory_name
    :reader trajectory_name
    :initarg :trajectory_name
    :type cl:string
    :initform "")
   (ee_error_th
    :reader ee_error_th
    :initarg :ee_error_th
    :type cl:float
    :initform 0.0))
)

(cl:defclass ExecutingTrajectoryGoal (<ExecutingTrajectoryGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecutingTrajectoryGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecutingTrajectoryGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_rt-msg:<ExecutingTrajectoryGoal> is deprecated: use move_rt-msg:ExecutingTrajectoryGoal instead.")))

(cl:ensure-generic-function 'trajectory_name-val :lambda-list '(m))
(cl:defmethod trajectory_name-val ((m <ExecutingTrajectoryGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_rt-msg:trajectory_name-val is deprecated.  Use move_rt-msg:trajectory_name instead.")
  (trajectory_name m))

(cl:ensure-generic-function 'ee_error_th-val :lambda-list '(m))
(cl:defmethod ee_error_th-val ((m <ExecutingTrajectoryGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_rt-msg:ee_error_th-val is deprecated.  Use move_rt-msg:ee_error_th instead.")
  (ee_error_th m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecutingTrajectoryGoal>) ostream)
  "Serializes a message object of type '<ExecutingTrajectoryGoal>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'trajectory_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'trajectory_name))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'ee_error_th))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecutingTrajectoryGoal>) istream)
  "Deserializes a message object of type '<ExecutingTrajectoryGoal>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'trajectory_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'trajectory_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'ee_error_th) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecutingTrajectoryGoal>)))
  "Returns string type for a message object of type '<ExecutingTrajectoryGoal>"
  "move_rt/ExecutingTrajectoryGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutingTrajectoryGoal)))
  "Returns string type for a message object of type 'ExecutingTrajectoryGoal"
  "move_rt/ExecutingTrajectoryGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecutingTrajectoryGoal>)))
  "Returns md5sum for a message object of type '<ExecutingTrajectoryGoal>"
  "d8f8c747702d98a2b465764ab182b654")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecutingTrajectoryGoal)))
  "Returns md5sum for a message object of type 'ExecutingTrajectoryGoal"
  "d8f8c747702d98a2b465764ab182b654")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecutingTrajectoryGoal>)))
  "Returns full string definition for message of type '<ExecutingTrajectoryGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the goal~%string trajectory_name~%float64 ee_error_th  # Specify error threshold~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecutingTrajectoryGoal)))
  "Returns full string definition for message of type 'ExecutingTrajectoryGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the goal~%string trajectory_name~%float64 ee_error_th  # Specify error threshold~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecutingTrajectoryGoal>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'trajectory_name))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecutingTrajectoryGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecutingTrajectoryGoal
    (cl:cons ':trajectory_name (trajectory_name msg))
    (cl:cons ':ee_error_th (ee_error_th msg))
))

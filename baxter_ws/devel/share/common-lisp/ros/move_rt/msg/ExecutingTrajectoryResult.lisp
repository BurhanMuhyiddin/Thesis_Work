; Auto-generated. Do not edit!


(cl:in-package move_rt-msg)


;//! \htmlinclude ExecutingTrajectoryResult.msg.html

(cl:defclass <ExecutingTrajectoryResult> (roslisp-msg-protocol:ros-message)
  ((error_code
    :reader error_code
    :initarg :error_code
    :type cl:integer
    :initform 0))
)

(cl:defclass ExecutingTrajectoryResult (<ExecutingTrajectoryResult>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ExecutingTrajectoryResult>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ExecutingTrajectoryResult)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name move_rt-msg:<ExecutingTrajectoryResult> is deprecated: use move_rt-msg:ExecutingTrajectoryResult instead.")))

(cl:ensure-generic-function 'error_code-val :lambda-list '(m))
(cl:defmethod error_code-val ((m <ExecutingTrajectoryResult>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader move_rt-msg:error_code-val is deprecated.  Use move_rt-msg:error_code instead.")
  (error_code m))
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql '<ExecutingTrajectoryResult>)))
    "Constants for message type '<ExecutingTrajectoryResult>"
  '((:SUCCESSFUL . 0)
    (:INVALID_GOAL . -1)
    (:INVALID_JOINTS . -2)
    (:OLD_HEADER_TIMESTAMP . -3)
    (:PATH_TOLERANCE_VIOLATED . -4)
    (:GOAL_TOLERANCE_VIOLATED . -5))
)
(cl:defmethod roslisp-msg-protocol:symbol-codes ((msg-type (cl:eql 'ExecutingTrajectoryResult)))
    "Constants for message type 'ExecutingTrajectoryResult"
  '((:SUCCESSFUL . 0)
    (:INVALID_GOAL . -1)
    (:INVALID_JOINTS . -2)
    (:OLD_HEADER_TIMESTAMP . -3)
    (:PATH_TOLERANCE_VIOLATED . -4)
    (:GOAL_TOLERANCE_VIOLATED . -5))
)
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ExecutingTrajectoryResult>) ostream)
  "Serializes a message object of type '<ExecutingTrajectoryResult>"
  (cl:let* ((signed (cl:slot-value msg 'error_code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ExecutingTrajectoryResult>) istream)
  "Deserializes a message object of type '<ExecutingTrajectoryResult>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'error_code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ExecutingTrajectoryResult>)))
  "Returns string type for a message object of type '<ExecutingTrajectoryResult>"
  "move_rt/ExecutingTrajectoryResult")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ExecutingTrajectoryResult)))
  "Returns string type for a message object of type 'ExecutingTrajectoryResult"
  "move_rt/ExecutingTrajectoryResult")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ExecutingTrajectoryResult>)))
  "Returns md5sum for a message object of type '<ExecutingTrajectoryResult>"
  "6243274b5d629dc838814109754410d5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ExecutingTrajectoryResult)))
  "Returns md5sum for a message object of type 'ExecutingTrajectoryResult"
  "6243274b5d629dc838814109754410d5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ExecutingTrajectoryResult>)))
  "Returns full string definition for message of type '<ExecutingTrajectoryResult>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the result~%int32 error_code~%int32 SUCCESSFUL = 0~%int32 INVALID_GOAL = -1~%int32 INVALID_JOINTS = -2~%int32 OLD_HEADER_TIMESTAMP = -3~%int32 PATH_TOLERANCE_VIOLATED = -4~%int32 GOAL_TOLERANCE_VIOLATED = -5~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ExecutingTrajectoryResult)))
  "Returns full string definition for message of type 'ExecutingTrajectoryResult"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Define the result~%int32 error_code~%int32 SUCCESSFUL = 0~%int32 INVALID_GOAL = -1~%int32 INVALID_JOINTS = -2~%int32 OLD_HEADER_TIMESTAMP = -3~%int32 PATH_TOLERANCE_VIOLATED = -4~%int32 GOAL_TOLERANCE_VIOLATED = -5~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ExecutingTrajectoryResult>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ExecutingTrajectoryResult>))
  "Converts a ROS message object to a list"
  (cl:list 'ExecutingTrajectoryResult
    (cl:cons ':error_code (error_code msg))
))

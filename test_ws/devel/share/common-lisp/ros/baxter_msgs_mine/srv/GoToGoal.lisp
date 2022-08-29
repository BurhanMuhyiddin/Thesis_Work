; Auto-generated. Do not edit!


(cl:in-package baxter_msgs_mine-srv)


;//! \htmlinclude GoToGoal-request.msg.html

(cl:defclass <GoToGoal-request> (roslisp-msg-protocol:ros-message)
  ((goal
    :reader goal
    :initarg :goal
    :type (cl:vector geometry_msgs-msg:Pose)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Pose :initial-element (cl:make-instance 'geometry_msgs-msg:Pose)))
   (limb
    :reader limb
    :initarg :limb
    :type cl:string
    :initform "")
   (mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0)
   (bounding_region
    :reader bounding_region
    :initarg :bounding_region
    :type (cl:vector shape_msgs-msg:SolidPrimitive)
   :initform (cl:make-array 0 :element-type 'shape_msgs-msg:SolidPrimitive :initial-element (cl:make-instance 'shape_msgs-msg:SolidPrimitive)))
   (bounding_region_size
    :reader bounding_region_size
    :initarg :bounding_region_size
    :type cl:fixnum
    :initform 0)
   (pos_constrained
    :reader pos_constrained
    :initarg :pos_constrained
    :type cl:boolean
    :initform cl:nil)
   (orn_constrained
    :reader orn_constrained
    :initarg :orn_constrained
    :type cl:boolean
    :initform cl:nil)
   (pos_only_ik
    :reader pos_only_ik
    :initarg :pos_only_ik
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GoToGoal-request (<GoToGoal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToGoal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToGoal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<GoToGoal-request> is deprecated: use baxter_msgs_mine-srv:GoToGoal-request instead.")))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <GoToGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:goal-val is deprecated.  Use baxter_msgs_mine-srv:goal instead.")
  (goal m))

(cl:ensure-generic-function 'limb-val :lambda-list '(m))
(cl:defmethod limb-val ((m <GoToGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:limb-val is deprecated.  Use baxter_msgs_mine-srv:limb instead.")
  (limb m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <GoToGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:mode-val is deprecated.  Use baxter_msgs_mine-srv:mode instead.")
  (mode m))

(cl:ensure-generic-function 'bounding_region-val :lambda-list '(m))
(cl:defmethod bounding_region-val ((m <GoToGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:bounding_region-val is deprecated.  Use baxter_msgs_mine-srv:bounding_region instead.")
  (bounding_region m))

(cl:ensure-generic-function 'bounding_region_size-val :lambda-list '(m))
(cl:defmethod bounding_region_size-val ((m <GoToGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:bounding_region_size-val is deprecated.  Use baxter_msgs_mine-srv:bounding_region_size instead.")
  (bounding_region_size m))

(cl:ensure-generic-function 'pos_constrained-val :lambda-list '(m))
(cl:defmethod pos_constrained-val ((m <GoToGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:pos_constrained-val is deprecated.  Use baxter_msgs_mine-srv:pos_constrained instead.")
  (pos_constrained m))

(cl:ensure-generic-function 'orn_constrained-val :lambda-list '(m))
(cl:defmethod orn_constrained-val ((m <GoToGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:orn_constrained-val is deprecated.  Use baxter_msgs_mine-srv:orn_constrained instead.")
  (orn_constrained m))

(cl:ensure-generic-function 'pos_only_ik-val :lambda-list '(m))
(cl:defmethod pos_only_ik-val ((m <GoToGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:pos_only_ik-val is deprecated.  Use baxter_msgs_mine-srv:pos_only_ik instead.")
  (pos_only_ik m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToGoal-request>) ostream)
  "Serializes a message object of type '<GoToGoal-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'goal))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'goal))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'limb))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'limb))
  (cl:let* ((signed (cl:slot-value msg 'mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'bounding_region))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'bounding_region))
  (cl:let* ((signed (cl:slot-value msg 'bounding_region_size)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pos_constrained) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'orn_constrained) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'pos_only_ik) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToGoal-request>) istream)
  "Deserializes a message object of type '<GoToGoal-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'goal) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'goal)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Pose))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'limb) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'limb) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mode) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'bounding_region) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'bounding_region)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'shape_msgs-msg:SolidPrimitive))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'bounding_region_size) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'pos_constrained) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'orn_constrained) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:slot-value msg 'pos_only_ik) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToGoal-request>)))
  "Returns string type for a service object of type '<GoToGoal-request>"
  "baxter_msgs_mine/GoToGoalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToGoal-request)))
  "Returns string type for a service object of type 'GoToGoal-request"
  "baxter_msgs_mine/GoToGoalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToGoal-request>)))
  "Returns md5sum for a message object of type '<GoToGoal-request>"
  "04d72039529027fa74e24860cee85ab7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToGoal-request)))
  "Returns md5sum for a message object of type 'GoToGoal-request"
  "04d72039529027fa74e24860cee85ab7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToGoal-request>)))
  "Returns full string definition for message of type '<GoToGoal-request>"
  (cl:format cl:nil "geometry_msgs/Pose[] goal~%string limb~%int8 mode~%shape_msgs/SolidPrimitive[] bounding_region~%int8 bounding_region_size~%bool pos_constrained~%bool orn_constrained~%bool pos_only_ik~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: shape_msgs/SolidPrimitive~%# Define box, sphere, cylinder, cone ~%# All shapes are defined to have their bounding boxes centered around 0,0,0.~%~%uint8 BOX=1~%uint8 SPHERE=2~%uint8 CYLINDER=3~%uint8 CONE=4~%~%# The type of the shape~%uint8 type~%~%~%# The dimensions of the shape~%float64[] dimensions~%~%# The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array~%~%# For the BOX type, the X, Y, and Z dimensions are the length of the corresponding~%# sides of the box.~%uint8 BOX_X=0~%uint8 BOX_Y=1~%uint8 BOX_Z=2~%~%~%# For the SPHERE type, only one component is used, and it gives the radius of~%# the sphere.~%uint8 SPHERE_RADIUS=0~%~%~%# For the CYLINDER and CONE types, the center line is oriented along~%# the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component~%# of dimensions gives the height of the cylinder (cone).  The~%# CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the~%# radius of the base of the cylinder (cone).  Cone and cylinder~%# primitives are defined to be circular. The tip of the cone is~%# pointing up, along +Z axis.~%~%uint8 CYLINDER_HEIGHT=0~%uint8 CYLINDER_RADIUS=1~%~%uint8 CONE_HEIGHT=0~%uint8 CONE_RADIUS=1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToGoal-request)))
  "Returns full string definition for message of type 'GoToGoal-request"
  (cl:format cl:nil "geometry_msgs/Pose[] goal~%string limb~%int8 mode~%shape_msgs/SolidPrimitive[] bounding_region~%int8 bounding_region_size~%bool pos_constrained~%bool orn_constrained~%bool pos_only_ik~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: shape_msgs/SolidPrimitive~%# Define box, sphere, cylinder, cone ~%# All shapes are defined to have their bounding boxes centered around 0,0,0.~%~%uint8 BOX=1~%uint8 SPHERE=2~%uint8 CYLINDER=3~%uint8 CONE=4~%~%# The type of the shape~%uint8 type~%~%~%# The dimensions of the shape~%float64[] dimensions~%~%# The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array~%~%# For the BOX type, the X, Y, and Z dimensions are the length of the corresponding~%# sides of the box.~%uint8 BOX_X=0~%uint8 BOX_Y=1~%uint8 BOX_Z=2~%~%~%# For the SPHERE type, only one component is used, and it gives the radius of~%# the sphere.~%uint8 SPHERE_RADIUS=0~%~%~%# For the CYLINDER and CONE types, the center line is oriented along~%# the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component~%# of dimensions gives the height of the cylinder (cone).  The~%# CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the~%# radius of the base of the cylinder (cone).  Cone and cylinder~%# primitives are defined to be circular. The tip of the cone is~%# pointing up, along +Z axis.~%~%uint8 CYLINDER_HEIGHT=0~%uint8 CYLINDER_RADIUS=1~%~%uint8 CONE_HEIGHT=0~%uint8 CONE_RADIUS=1~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToGoal-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'goal) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:length (cl:slot-value msg 'limb))
     1
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'bounding_region) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     1
     1
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToGoal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToGoal-request
    (cl:cons ':goal (goal msg))
    (cl:cons ':limb (limb msg))
    (cl:cons ':mode (mode msg))
    (cl:cons ':bounding_region (bounding_region msg))
    (cl:cons ':bounding_region_size (bounding_region_size msg))
    (cl:cons ':pos_constrained (pos_constrained msg))
    (cl:cons ':orn_constrained (orn_constrained msg))
    (cl:cons ':pos_only_ik (pos_only_ik msg))
))
;//! \htmlinclude GoToGoal-response.msg.html

(cl:defclass <GoToGoal-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GoToGoal-response (<GoToGoal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoToGoal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoToGoal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name baxter_msgs_mine-srv:<GoToGoal-response> is deprecated: use baxter_msgs_mine-srv:GoToGoal-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GoToGoal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader baxter_msgs_mine-srv:success-val is deprecated.  Use baxter_msgs_mine-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoToGoal-response>) ostream)
  "Serializes a message object of type '<GoToGoal-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoToGoal-response>) istream)
  "Deserializes a message object of type '<GoToGoal-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoToGoal-response>)))
  "Returns string type for a service object of type '<GoToGoal-response>"
  "baxter_msgs_mine/GoToGoalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToGoal-response)))
  "Returns string type for a service object of type 'GoToGoal-response"
  "baxter_msgs_mine/GoToGoalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoToGoal-response>)))
  "Returns md5sum for a message object of type '<GoToGoal-response>"
  "04d72039529027fa74e24860cee85ab7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoToGoal-response)))
  "Returns md5sum for a message object of type 'GoToGoal-response"
  "04d72039529027fa74e24860cee85ab7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoToGoal-response>)))
  "Returns full string definition for message of type '<GoToGoal-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoToGoal-response)))
  "Returns full string definition for message of type 'GoToGoal-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoToGoal-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoToGoal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GoToGoal-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GoToGoal)))
  'GoToGoal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GoToGoal)))
  'GoToGoal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoToGoal)))
  "Returns string type for a service object of type '<GoToGoal>"
  "baxter_msgs_mine/GoToGoal")
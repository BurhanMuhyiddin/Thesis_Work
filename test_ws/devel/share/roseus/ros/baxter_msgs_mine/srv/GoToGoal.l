;; Auto-generated. Do not edit!


(when (boundp 'baxter_msgs_mine::GoToGoal)
  (if (not (find-package "BAXTER_MSGS_MINE"))
    (make-package "BAXTER_MSGS_MINE"))
  (shadow 'GoToGoal (find-package "BAXTER_MSGS_MINE")))
(unless (find-package "BAXTER_MSGS_MINE::GOTOGOAL")
  (make-package "BAXTER_MSGS_MINE::GOTOGOAL"))
(unless (find-package "BAXTER_MSGS_MINE::GOTOGOALREQUEST")
  (make-package "BAXTER_MSGS_MINE::GOTOGOALREQUEST"))
(unless (find-package "BAXTER_MSGS_MINE::GOTOGOALRESPONSE")
  (make-package "BAXTER_MSGS_MINE::GOTOGOALRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "SHAPE_MSGS"))
  (ros::roseus-add-msgs "shape_msgs"))




(defclass baxter_msgs_mine::GoToGoalRequest
  :super ros::object
  :slots (_goal _limb _mode _bounding_region _bounding_region_size _pos_constrained _orn_constrained _pos_only_ik ))

(defmethod baxter_msgs_mine::GoToGoalRequest
  (:init
   (&key
    ((:goal __goal) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Pose :init) r)) r))
    ((:limb __limb) "")
    ((:mode __mode) 0)
    ((:bounding_region __bounding_region) (let (r) (dotimes (i 0) (push (instance shape_msgs::SolidPrimitive :init) r)) r))
    ((:bounding_region_size __bounding_region_size) 0)
    ((:pos_constrained __pos_constrained) nil)
    ((:orn_constrained __orn_constrained) nil)
    ((:pos_only_ik __pos_only_ik) nil)
    )
   (send-super :init)
   (setq _goal __goal)
   (setq _limb (string __limb))
   (setq _mode (round __mode))
   (setq _bounding_region __bounding_region)
   (setq _bounding_region_size (round __bounding_region_size))
   (setq _pos_constrained __pos_constrained)
   (setq _orn_constrained __orn_constrained)
   (setq _pos_only_ik __pos_only_ik)
   self)
  (:goal
   (&rest __goal)
   (if (keywordp (car __goal))
       (send* _goal __goal)
     (progn
       (if __goal (setq _goal (car __goal)))
       _goal)))
  (:limb
   (&optional __limb)
   (if __limb (setq _limb __limb)) _limb)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:bounding_region
   (&rest __bounding_region)
   (if (keywordp (car __bounding_region))
       (send* _bounding_region __bounding_region)
     (progn
       (if __bounding_region (setq _bounding_region (car __bounding_region)))
       _bounding_region)))
  (:bounding_region_size
   (&optional __bounding_region_size)
   (if __bounding_region_size (setq _bounding_region_size __bounding_region_size)) _bounding_region_size)
  (:pos_constrained
   (&optional __pos_constrained)
   (if __pos_constrained (setq _pos_constrained __pos_constrained)) _pos_constrained)
  (:orn_constrained
   (&optional __orn_constrained)
   (if __orn_constrained (setq _orn_constrained __orn_constrained)) _orn_constrained)
  (:pos_only_ik
   (&optional __pos_only_ik)
   (if __pos_only_ik (setq _pos_only_ik __pos_only_ik)) _pos_only_ik)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose[] _goal
    (apply #'+ (send-all _goal :serialization-length)) 4
    ;; string _limb
    4 (length _limb)
    ;; int8 _mode
    1
    ;; shape_msgs/SolidPrimitive[] _bounding_region
    (apply #'+ (send-all _bounding_region :serialization-length)) 4
    ;; int8 _bounding_region_size
    1
    ;; bool _pos_constrained
    1
    ;; bool _orn_constrained
    1
    ;; bool _pos_only_ik
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose[] _goal
     (write-long (length _goal) s)
     (dolist (elem _goal)
       (send elem :serialize s)
       )
     ;; string _limb
       (write-long (length _limb) s) (princ _limb s)
     ;; int8 _mode
       (write-byte _mode s)
     ;; shape_msgs/SolidPrimitive[] _bounding_region
     (write-long (length _bounding_region) s)
     (dolist (elem _bounding_region)
       (send elem :serialize s)
       )
     ;; int8 _bounding_region_size
       (write-byte _bounding_region_size s)
     ;; bool _pos_constrained
       (if _pos_constrained (write-byte -1 s) (write-byte 0 s))
     ;; bool _orn_constrained
       (if _orn_constrained (write-byte -1 s) (write-byte 0 s))
     ;; bool _pos_only_ik
       (if _pos_only_ik (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose[] _goal
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _goal (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _goal)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; string _limb
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _limb (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _mode 127) (setq _mode (- _mode 256)))
   ;; shape_msgs/SolidPrimitive[] _bounding_region
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _bounding_region (let (r) (dotimes (i n) (push (instance shape_msgs::SolidPrimitive :init) r)) r))
     (dolist (elem- _bounding_region)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; int8 _bounding_region_size
     (setq _bounding_region_size (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _bounding_region_size 127) (setq _bounding_region_size (- _bounding_region_size 256)))
   ;; bool _pos_constrained
     (setq _pos_constrained (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _orn_constrained
     (setq _orn_constrained (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _pos_only_ik
     (setq _pos_only_ik (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass baxter_msgs_mine::GoToGoalResponse
  :super ros::object
  :slots (_success ))

(defmethod baxter_msgs_mine::GoToGoalResponse
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

(defclass baxter_msgs_mine::GoToGoal
  :super ros::object
  :slots ())

(setf (get baxter_msgs_mine::GoToGoal :md5sum-) "04d72039529027fa74e24860cee85ab7")
(setf (get baxter_msgs_mine::GoToGoal :datatype-) "baxter_msgs_mine/GoToGoal")
(setf (get baxter_msgs_mine::GoToGoal :request) baxter_msgs_mine::GoToGoalRequest)
(setf (get baxter_msgs_mine::GoToGoal :response) baxter_msgs_mine::GoToGoalResponse)

(defmethod baxter_msgs_mine::GoToGoalRequest
  (:response () (instance baxter_msgs_mine::GoToGoalResponse :init)))

(setf (get baxter_msgs_mine::GoToGoalRequest :md5sum-) "04d72039529027fa74e24860cee85ab7")
(setf (get baxter_msgs_mine::GoToGoalRequest :datatype-) "baxter_msgs_mine/GoToGoalRequest")
(setf (get baxter_msgs_mine::GoToGoalRequest :definition-)
      "geometry_msgs/Pose[] goal
string limb
int8 mode
shape_msgs/SolidPrimitive[] bounding_region
int8 bounding_region_size
bool pos_constrained
bool orn_constrained
bool pos_only_ik


================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: shape_msgs/SolidPrimitive
# Define box, sphere, cylinder, cone 
# All shapes are defined to have their bounding boxes centered around 0,0,0.

uint8 BOX=1
uint8 SPHERE=2
uint8 CYLINDER=3
uint8 CONE=4

# The type of the shape
uint8 type


# The dimensions of the shape
float64[] dimensions

# The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array

# For the BOX type, the X, Y, and Z dimensions are the length of the corresponding
# sides of the box.
uint8 BOX_X=0
uint8 BOX_Y=1
uint8 BOX_Z=2


# For the SPHERE type, only one component is used, and it gives the radius of
# the sphere.
uint8 SPHERE_RADIUS=0


# For the CYLINDER and CONE types, the center line is oriented along
# the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component
# of dimensions gives the height of the cylinder (cone).  The
# CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the
# radius of the base of the cylinder (cone).  Cone and cylinder
# primitives are defined to be circular. The tip of the cone is
# pointing up, along +Z axis.

uint8 CYLINDER_HEIGHT=0
uint8 CYLINDER_RADIUS=1

uint8 CONE_HEIGHT=0
uint8 CONE_RADIUS=1
---
bool success
")

(setf (get baxter_msgs_mine::GoToGoalResponse :md5sum-) "04d72039529027fa74e24860cee85ab7")
(setf (get baxter_msgs_mine::GoToGoalResponse :datatype-) "baxter_msgs_mine/GoToGoalResponse")
(setf (get baxter_msgs_mine::GoToGoalResponse :definition-)
      "geometry_msgs/Pose[] goal
string limb
int8 mode
shape_msgs/SolidPrimitive[] bounding_region
int8 bounding_region_size
bool pos_constrained
bool orn_constrained
bool pos_only_ik


================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: shape_msgs/SolidPrimitive
# Define box, sphere, cylinder, cone 
# All shapes are defined to have their bounding boxes centered around 0,0,0.

uint8 BOX=1
uint8 SPHERE=2
uint8 CYLINDER=3
uint8 CONE=4

# The type of the shape
uint8 type


# The dimensions of the shape
float64[] dimensions

# The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array

# For the BOX type, the X, Y, and Z dimensions are the length of the corresponding
# sides of the box.
uint8 BOX_X=0
uint8 BOX_Y=1
uint8 BOX_Z=2


# For the SPHERE type, only one component is used, and it gives the radius of
# the sphere.
uint8 SPHERE_RADIUS=0


# For the CYLINDER and CONE types, the center line is oriented along
# the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component
# of dimensions gives the height of the cylinder (cone).  The
# CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the
# radius of the base of the cylinder (cone).  Cone and cylinder
# primitives are defined to be circular. The tip of the cone is
# pointing up, along +Z axis.

uint8 CYLINDER_HEIGHT=0
uint8 CYLINDER_RADIUS=1

uint8 CONE_HEIGHT=0
uint8 CONE_RADIUS=1
---
bool success
")



(provide :baxter_msgs_mine/GoToGoal "04d72039529027fa74e24860cee85ab7")



# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;rospy;std_msgs;tf;tf2;tf2_bullet;tf2_ros;tf2_geometry_msgs;tf2_kdl;tf2_msgs;control_msgs;moveit_core;message_runtime;moveit_ros_planning_interface".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lmove_rt".split(';') if "-lmove_rt" != "" else []
PROJECT_NAME = "move_rt"
PROJECT_SPACE_DIR = "/home/lar/ros/baxter_ws/install"
PROJECT_VERSION = "0.0.0"

# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "actionlib;cmake_modules;control_msgs;controller_interface;hardware_interface;realtime_tools".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lgripper_action_controller".split(';') if "-lgripper_action_controller" != "" else []
PROJECT_NAME = "gripper_action_controller"
PROJECT_SPACE_DIR = "/home/lar/ros/baxter_ws/install"
PROJECT_VERSION = "0.8.1"

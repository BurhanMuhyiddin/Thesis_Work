# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "controller_interface;control_msgs;control_toolbox;realtime_tools;urdf;forward_command_controller".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-leffort_controllers".split(';') if "-leffort_controllers" != "" else []
PROJECT_NAME = "effort_controllers"
PROJECT_SPACE_DIR = "/home/lar/ros/baxter_ws/install"
PROJECT_VERSION = "0.8.1"

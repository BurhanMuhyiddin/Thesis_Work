# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/usr/include;/usr/include/eigen3".split(';') if "${prefix}/include;/usr/include;/usr/include/eigen3" != "" else []
PROJECT_CATKIN_DEPENDS = "descartes_core;moveit_core;roscpp".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-ldescartes_trajectory".split(';') if "-ldescartes_trajectory" != "" else []
PROJECT_NAME = "descartes_trajectory"
PROJECT_SPACE_DIR = "/home/lar/ros/baxter_ws/install"
PROJECT_VERSION = "0.0.1"

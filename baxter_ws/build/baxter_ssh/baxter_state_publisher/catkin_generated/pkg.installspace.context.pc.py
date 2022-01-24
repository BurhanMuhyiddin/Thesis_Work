# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include;/opt/ros/kinetic/share/orocos_kdl/../../include;/usr/include/eigen3".split(';') if "${prefix}/include;/opt/ros/kinetic/share/orocos_kdl/../../include;/usr/include/eigen3" != "" else []
PROJECT_CATKIN_DEPENDS = "roscpp;rosconsole;rostime;tf;tf_conversions;kdl_parser".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-lbaxter_state_publisher_solver;/opt/ros/kinetic/lib/liborocos-kdl.so.1.3.2".split(';') if "-lbaxter_state_publisher_solver;/opt/ros/kinetic/lib/liborocos-kdl.so.1.3.2" != "" else []
PROJECT_NAME = "baxter_state_publisher"
PROJECT_SPACE_DIR = "/home/lar/ros/baxter_ws/install"
PROJECT_VERSION = "1.10.2"

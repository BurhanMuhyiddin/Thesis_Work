cmake_minimum_required(VERSION 3.0.2)
project(ros_test)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS rospy roscpp std_msgs baxter_core_msgs sensor_msgs)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES ros_test
#  CATKIN_DEPENDS other_catkin_pkg
#  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
 include
 ${catkin_INCLUDE_DIRS}
)
add_executable(move_rt_connector src/move_rt_connector.cpp)
 target_link_libraries(move_rt_connector
   ${catkin_LIBRARIES}
 )
 add_dependencies(move_rt_connector ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

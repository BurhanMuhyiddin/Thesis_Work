cmake_minimum_required(VERSION 3.0.2)
project(baxter_control_mine)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  sensor_msgs
  moveit_ros_planning_interface 
  moveit_ros_move_group
  moveit_visual_tools
  rviz_visual_tools
  baxter_core_msgs
  cv_bridge
  image_transport
)

find_package(Eigen3 REQUIRED)
find_package(OpenCV REQUIRED)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES baxter_control_mine
  CATKIN_DEPENDS roscpp rospy std_msgs cv_bridge image_transport sensor_msgs
#  DEPENDS system_lib
)

include_directories(
# include
  ${catkin_INCLUDE_DIRS}
  ${Boost_INCLUDE_DIR}
  ${EIGEN3_INCLUDE_DIRS}
)

add_executable(baxter_control_node src/baxter_movegroup.cpp)
target_link_libraries(baxter_control_node ${catkin_LIBRARIES})

add_executable(rviz_converter_node src/rviz_to_rrobot.cpp)
target_link_libraries(rviz_converter_node ${catkin_LIBRARIES})

add_executable(test_node src/test_service.cpp)
target_link_libraries(test_node ${catkin_LIBRARIES})

add_executable(go_to_goal_server src/go_to_goal_server.cpp)
target_link_libraries(go_to_goal_server ${catkin_LIBRARIES})

# add_executable(go_to_joint_pos_server src/go_to_joint_pos_server.cpp)
# target_link_libraries(go_to_joint_pos_server ${catkin_LIBRARIES})

add_executable(get_current_joint_states_server src/get_current_joint_states_server.cpp)
target_link_libraries(get_current_joint_states_server ${catkin_LIBRARIES})

add_executable(calculate_ik_server src/calculate_ik_server.cpp)
target_link_libraries(calculate_ik_server ${catkin_LIBRARIES})

add_executable(image_processing_server src/image_processing_server.cpp)
target_link_libraries(image_processing_server ${catkin_LIBRARIES})

# add_executable(stream_from_camera src/stream_from_camera.cpp)
# target_link_libraries(stream_from_camera ${OpenCV_LIBS} ${catkin_LIBRARIES})
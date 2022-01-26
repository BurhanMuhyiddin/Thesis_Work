cmake_minimum_required(VERSION 3.0.2)
project(baxter_control_mine)

add_compile_options(-std=c++11)

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
  message_generation
)


add_service_files(FILES
  PositionCommandMine.srv
  CalculateIK.srv
)

find_package(Eigen3 REQUIRED)

generate_messages(DEPENDENCIES
  std_msgs
  sensor_msgs
  geometry_msgs
)

catkin_package(
  CATKIN_DEPENDS
  message_runtime)

include_directories(
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

add_executable(calculate_ik_server src/calculate_ik_server.cpp)
target_link_libraries(calculate_ik_server ${catkin_LIBRARIES})
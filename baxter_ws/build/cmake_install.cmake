# Install script for directory: /home/lar/ros/baxter_ws/src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/lar/ros/baxter_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
        file(MAKE_DIRECTORY "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}")
      endif()
      if (NOT EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin")
        file(WRITE "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/.catkin" "")
      endif()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/lar/ros/baxter_ws/install/_setup_util.py")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/lar/ros/baxter_ws/install" TYPE PROGRAM FILES "/home/lar/ros/baxter_ws/build/catkin_generated/installspace/_setup_util.py")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/lar/ros/baxter_ws/install/env.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/lar/ros/baxter_ws/install" TYPE PROGRAM FILES "/home/lar/ros/baxter_ws/build/catkin_generated/installspace/env.sh")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/lar/ros/baxter_ws/install/setup.bash;/home/lar/ros/baxter_ws/install/local_setup.bash")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/lar/ros/baxter_ws/install" TYPE FILE FILES
    "/home/lar/ros/baxter_ws/build/catkin_generated/installspace/setup.bash"
    "/home/lar/ros/baxter_ws/build/catkin_generated/installspace/local_setup.bash"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/lar/ros/baxter_ws/install/setup.sh;/home/lar/ros/baxter_ws/install/local_setup.sh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/lar/ros/baxter_ws/install" TYPE FILE FILES
    "/home/lar/ros/baxter_ws/build/catkin_generated/installspace/setup.sh"
    "/home/lar/ros/baxter_ws/build/catkin_generated/installspace/local_setup.sh"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/lar/ros/baxter_ws/install/setup.zsh;/home/lar/ros/baxter_ws/install/local_setup.zsh")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/lar/ros/baxter_ws/install" TYPE FILE FILES
    "/home/lar/ros/baxter_ws/build/catkin_generated/installspace/setup.zsh"
    "/home/lar/ros/baxter_ws/build/catkin_generated/installspace/local_setup.zsh"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/lar/ros/baxter_ws/install/.rosinstall")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/home/lar/ros/baxter_ws/install" TYPE FILE FILES "/home/lar/ros/baxter_ws/build/catkin_generated/installspace/.rosinstall")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/lar/ros/baxter_ws/build/gtest/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_common/baxter_common/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_common/baxter_description/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_common/baxter_description_old/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter/baxter_sdk/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_simulator/baxter_simulator/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_ssh/baxter_ssh/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_common/rethink_ee_description/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_moveit_config/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_control/ros_control/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_controllers/ros_controllers/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_controllers/rqt_joint_trajectory_controller/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_common/baxter_maintenance_msgs/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_control/controller_manager_msgs/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_nodes/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_control/hardware_interface/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_control/controller_interface/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_controllers/forward_command_controller/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_controllers/joint_mode_controller/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_controllers/position_controllers/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_control/controller_manager/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_controllers/force_torque_sensor_controller/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_control/joint_limits_interface/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_control/rqt_controller_manager/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_control/controller_manager_tests/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_common/baxter_core_msgs/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_ssh/baxter_gripper_server/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_interface/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_simulator/baxter_sim_io/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_ssh/baxter_scripts/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_tools/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_controllers/imu_sensor_controller/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_controllers/joint_state_controller/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_test/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_control/transmission_interface/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_ssh/baxter_control/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_controllers/effort_controllers/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_simulator/baxter_sim_controllers/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_simulator/baxter_gazebo/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_simulator/baxter_sim_kinematics/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_simulator/baxter_sim_hardware/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_simulator/baxter_sim_examples/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_ssh/baxter_state_publisher/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_ikfast/baxter_ikfast_left_arm_plugin/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_ikfast/baxter_ikfast_right_arm_plugin/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_controllers/velocity_controllers/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/move_rt/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/baxter_examples/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_controllers/diff_drive_controller/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_controllers/gripper_action_controller/cmake_install.cmake")
  include("/home/lar/ros/baxter_ws/build/ros_controllers/joint_trajectory_controller/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/lar/ros/baxter_ws/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")

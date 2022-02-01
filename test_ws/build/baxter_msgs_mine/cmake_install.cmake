# Install script for directory: /home/lar/ros/test_ws/src/baxter_msgs_mine

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/lar/ros/test_ws/install")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/baxter_msgs_mine/srv" TYPE FILE FILES
    "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/PositionCommandMine.srv"
    "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/CalculateIK.srv"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/baxter_msgs_mine/action" TYPE FILE FILES "/home/lar/ros/test_ws/src/baxter_msgs_mine/action/GoToPoint.action")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/baxter_msgs_mine/msg" TYPE FILE FILES
    "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointAction.msg"
    "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg"
    "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg"
    "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg"
    "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg"
    "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg"
    "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/baxter_msgs_mine/cmake" TYPE FILE FILES "/home/lar/ros/test_ws/build/baxter_msgs_mine/catkin_generated/installspace/baxter_msgs_mine-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/lar/ros/test_ws/devel/include/baxter_msgs_mine")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/lar/ros/test_ws/devel/share/roseus/ros/baxter_msgs_mine")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/lar/ros/test_ws/devel/share/common-lisp/ros/baxter_msgs_mine")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/lar/ros/test_ws/devel/share/gennodejs/ros/baxter_msgs_mine")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/lar/ros/test_ws/devel/lib/python2.7/dist-packages/baxter_msgs_mine")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/lar/ros/test_ws/devel/lib/python2.7/dist-packages/baxter_msgs_mine")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/lar/ros/test_ws/build/baxter_msgs_mine/catkin_generated/installspace/baxter_msgs_mine.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/baxter_msgs_mine/cmake" TYPE FILE FILES "/home/lar/ros/test_ws/build/baxter_msgs_mine/catkin_generated/installspace/baxter_msgs_mine-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/baxter_msgs_mine/cmake" TYPE FILE FILES
    "/home/lar/ros/test_ws/build/baxter_msgs_mine/catkin_generated/installspace/baxter_msgs_mineConfig.cmake"
    "/home/lar/ros/test_ws/build/baxter_msgs_mine/catkin_generated/installspace/baxter_msgs_mineConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/baxter_msgs_mine" TYPE FILE FILES "/home/lar/ros/test_ws/src/baxter_msgs_mine/package.xml")
endif()


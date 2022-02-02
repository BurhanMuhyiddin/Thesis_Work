# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "baxter_msgs_mine: 7 messages, 3 services")

set(MSG_I_FLAGS "-Ibaxter_msgs_mine:/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg;-Iactionlib_msgs:/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(baxter_msgs_mine_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/CalculateIK.srv" NAME_WE)
add_custom_target(_baxter_msgs_mine_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baxter_msgs_mine" "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/CalculateIK.srv" "std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point:sensor_msgs/JointState"
)

get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointAction.msg" NAME_WE)
add_custom_target(_baxter_msgs_mine_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baxter_msgs_mine" "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointAction.msg" "baxter_msgs_mine/GoToPointFeedback:geometry_msgs/Pose:std_msgs/Header:baxter_msgs_mine/GoToPointGoal:geometry_msgs/Point:baxter_msgs_mine/GoToPointActionFeedback:baxter_msgs_mine/GoToPointActionResult:baxter_msgs_mine/GoToPointActionGoal:geometry_msgs/Quaternion:baxter_msgs_mine/GoToPointResult:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg" NAME_WE)
add_custom_target(_baxter_msgs_mine_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baxter_msgs_mine" "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg" "geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point:baxter_msgs_mine/GoToPointFeedback:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus"
)

get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/PositionCommandMine.srv" NAME_WE)
add_custom_target(_baxter_msgs_mine_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baxter_msgs_mine" "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/PositionCommandMine.srv" ""
)

get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg" NAME_WE)
add_custom_target(_baxter_msgs_mine_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baxter_msgs_mine" "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg" "geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point"
)

get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg" NAME_WE)
add_custom_target(_baxter_msgs_mine_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baxter_msgs_mine" "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg" "geometry_msgs/Pose:std_msgs/Header:baxter_msgs_mine/GoToPointGoal:geometry_msgs/Point:geometry_msgs/Quaternion:actionlib_msgs/GoalID"
)

get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg" NAME_WE)
add_custom_target(_baxter_msgs_mine_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baxter_msgs_mine" "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg" "geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point"
)

get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/ProcessImage.srv" NAME_WE)
add_custom_target(_baxter_msgs_mine_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baxter_msgs_mine" "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/ProcessImage.srv" "sensor_msgs/Image:std_msgs/Header"
)

get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg" NAME_WE)
add_custom_target(_baxter_msgs_mine_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baxter_msgs_mine" "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg" "geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/Point"
)

get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg" NAME_WE)
add_custom_target(_baxter_msgs_mine_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "baxter_msgs_mine" "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg" "geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/Point:baxter_msgs_mine/GoToPointResult:actionlib_msgs/GoalID:actionlib_msgs/GoalStatus"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointAction.msg"
  "${MSG_I_FLAGS}"
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_cpp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_cpp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_cpp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_cpp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_cpp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_cpp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_msgs_mine
)

### Generating Services
_generate_srv_cpp(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/PositionCommandMine.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_srv_cpp(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/CalculateIK.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/JointState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_srv_cpp(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/ProcessImage.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_msgs_mine
)

### Generating Module File
_generate_module_cpp(baxter_msgs_mine
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_msgs_mine
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(baxter_msgs_mine_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(baxter_msgs_mine_generate_messages baxter_msgs_mine_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/CalculateIK.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_cpp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointAction.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_cpp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_cpp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/PositionCommandMine.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_cpp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_cpp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_cpp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_cpp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/ProcessImage.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_cpp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_cpp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_cpp _baxter_msgs_mine_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(baxter_msgs_mine_gencpp)
add_dependencies(baxter_msgs_mine_gencpp baxter_msgs_mine_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_msgs_mine_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointAction.msg"
  "${MSG_I_FLAGS}"
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_eus(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_eus(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_eus(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_eus(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_eus(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_eus(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baxter_msgs_mine
)

### Generating Services
_generate_srv_eus(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/PositionCommandMine.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baxter_msgs_mine
)
_generate_srv_eus(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/CalculateIK.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/JointState.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baxter_msgs_mine
)
_generate_srv_eus(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/ProcessImage.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baxter_msgs_mine
)

### Generating Module File
_generate_module_eus(baxter_msgs_mine
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baxter_msgs_mine
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(baxter_msgs_mine_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(baxter_msgs_mine_generate_messages baxter_msgs_mine_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/CalculateIK.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_eus _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointAction.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_eus _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_eus _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/PositionCommandMine.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_eus _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_eus _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_eus _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_eus _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/ProcessImage.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_eus _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_eus _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_eus _baxter_msgs_mine_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(baxter_msgs_mine_geneus)
add_dependencies(baxter_msgs_mine_geneus baxter_msgs_mine_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_msgs_mine_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointAction.msg"
  "${MSG_I_FLAGS}"
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_lisp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_lisp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_lisp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_lisp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_lisp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_lisp(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_msgs_mine
)

### Generating Services
_generate_srv_lisp(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/PositionCommandMine.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_srv_lisp(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/CalculateIK.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/JointState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_msgs_mine
)
_generate_srv_lisp(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/ProcessImage.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_msgs_mine
)

### Generating Module File
_generate_module_lisp(baxter_msgs_mine
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_msgs_mine
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(baxter_msgs_mine_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(baxter_msgs_mine_generate_messages baxter_msgs_mine_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/CalculateIK.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_lisp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointAction.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_lisp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_lisp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/PositionCommandMine.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_lisp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_lisp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_lisp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_lisp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/ProcessImage.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_lisp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_lisp _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_lisp _baxter_msgs_mine_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(baxter_msgs_mine_genlisp)
add_dependencies(baxter_msgs_mine_genlisp baxter_msgs_mine_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_msgs_mine_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointAction.msg"
  "${MSG_I_FLAGS}"
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_nodejs(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_nodejs(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_nodejs(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_nodejs(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_nodejs(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_nodejs(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baxter_msgs_mine
)

### Generating Services
_generate_srv_nodejs(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/PositionCommandMine.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baxter_msgs_mine
)
_generate_srv_nodejs(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/CalculateIK.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/JointState.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baxter_msgs_mine
)
_generate_srv_nodejs(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/ProcessImage.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baxter_msgs_mine
)

### Generating Module File
_generate_module_nodejs(baxter_msgs_mine
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baxter_msgs_mine
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(baxter_msgs_mine_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(baxter_msgs_mine_generate_messages baxter_msgs_mine_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/CalculateIK.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_nodejs _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointAction.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_nodejs _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_nodejs _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/PositionCommandMine.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_nodejs _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_nodejs _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_nodejs _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_nodejs _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/ProcessImage.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_nodejs _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_nodejs _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_nodejs _baxter_msgs_mine_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(baxter_msgs_mine_gennodejs)
add_dependencies(baxter_msgs_mine_gennodejs baxter_msgs_mine_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_msgs_mine_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointAction.msg"
  "${MSG_I_FLAGS}"
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_py(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_py(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_py(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_py(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_py(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine
)
_generate_msg_py(baxter_msgs_mine
  "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalID.msg;/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg/GoalStatus.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine
)

### Generating Services
_generate_srv_py(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/PositionCommandMine.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine
)
_generate_srv_py(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/CalculateIK.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/kinetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/JointState.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine
)
_generate_srv_py(baxter_msgs_mine
  "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/ProcessImage.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine
)

### Generating Module File
_generate_module_py(baxter_msgs_mine
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(baxter_msgs_mine_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(baxter_msgs_mine_generate_messages baxter_msgs_mine_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/CalculateIK.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_py _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointAction.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_py _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionFeedback.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_py _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/PositionCommandMine.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_py _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointFeedback.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_py _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionGoal.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_py _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointResult.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_py _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/src/baxter_msgs_mine/srv/ProcessImage.srv" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_py _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointGoal.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_py _baxter_msgs_mine_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/lar/ros/test_ws/devel/share/baxter_msgs_mine/msg/GoToPointActionResult.msg" NAME_WE)
add_dependencies(baxter_msgs_mine_generate_messages_py _baxter_msgs_mine_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(baxter_msgs_mine_genpy)
add_dependencies(baxter_msgs_mine_genpy baxter_msgs_mine_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS baxter_msgs_mine_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_msgs_mine)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/baxter_msgs_mine
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_cpp)
  add_dependencies(baxter_msgs_mine_generate_messages_cpp actionlib_msgs_generate_messages_cpp)
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(baxter_msgs_mine_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(baxter_msgs_mine_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(baxter_msgs_mine_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baxter_msgs_mine)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/baxter_msgs_mine
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_eus)
  add_dependencies(baxter_msgs_mine_generate_messages_eus actionlib_msgs_generate_messages_eus)
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(baxter_msgs_mine_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(baxter_msgs_mine_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(baxter_msgs_mine_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_msgs_mine)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/baxter_msgs_mine
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_lisp)
  add_dependencies(baxter_msgs_mine_generate_messages_lisp actionlib_msgs_generate_messages_lisp)
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(baxter_msgs_mine_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(baxter_msgs_mine_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(baxter_msgs_mine_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baxter_msgs_mine)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/baxter_msgs_mine
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_nodejs)
  add_dependencies(baxter_msgs_mine_generate_messages_nodejs actionlib_msgs_generate_messages_nodejs)
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(baxter_msgs_mine_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(baxter_msgs_mine_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(baxter_msgs_mine_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/baxter_msgs_mine
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET actionlib_msgs_generate_messages_py)
  add_dependencies(baxter_msgs_mine_generate_messages_py actionlib_msgs_generate_messages_py)
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(baxter_msgs_mine_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(baxter_msgs_mine_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(baxter_msgs_mine_generate_messages_py sensor_msgs_generate_messages_py)
endif()

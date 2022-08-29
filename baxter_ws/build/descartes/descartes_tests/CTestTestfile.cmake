# CMake generated Testfile for 
# Source directory: /home/lar/ros/baxter_ws/src/descartes/descartes_tests
# Build directory: /home/lar/ros/baxter_ws/build/descartes/descartes_tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(_ctest_descartes_tests_gtest_descartes_tests_trajectory_utest "/home/lar/ros/baxter_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/lar/ros/baxter_ws/build/test_results/descartes_tests/gtest-descartes_tests_trajectory_utest.xml" "--return-code" "/home/lar/ros/baxter_ws/devel/lib/descartes_tests/descartes_tests_trajectory_utest --gtest_output=xml:/home/lar/ros/baxter_ws/build/test_results/descartes_tests/gtest-descartes_tests_trajectory_utest.xml")
add_test(_ctest_descartes_tests_gtest_descartes_tests_planner_utest "/home/lar/ros/baxter_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/lar/ros/baxter_ws/build/test_results/descartes_tests/gtest-descartes_tests_planner_utest.xml" "--return-code" "/home/lar/ros/baxter_ws/devel/lib/descartes_tests/descartes_tests_planner_utest --gtest_output=xml:/home/lar/ros/baxter_ws/build/test_results/descartes_tests/gtest-descartes_tests_planner_utest.xml")
add_test(_ctest_descartes_tests_rostest_test_moveit_launch_utest.launch "/home/lar/ros/baxter_ws/build/catkin_generated/env_cached.sh" "/usr/bin/python2" "/opt/ros/kinetic/share/catkin/cmake/test/run_tests.py" "/home/lar/ros/baxter_ws/build/test_results/descartes_tests/rostest-test_moveit_launch_utest.xml" "--return-code" "/opt/ros/kinetic/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/lar/ros/baxter_ws/src/descartes/descartes_tests --package=descartes_tests --results-filename test_moveit_launch_utest.xml --results-base-dir \"/home/lar/ros/baxter_ws/build/test_results\" /home/lar/ros/baxter_ws/src/descartes/descartes_tests/test/moveit/launch/utest.launch ")

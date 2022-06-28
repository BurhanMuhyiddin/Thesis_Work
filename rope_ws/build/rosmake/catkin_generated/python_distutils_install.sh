#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/lar/ros/rope_ws/src/ros/rosmake"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/lar/ros/rope_ws/install/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/lar/ros/rope_ws/install/lib/python3/dist-packages:/home/lar/ros/rope_ws/build/rosmake/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/lar/ros/rope_ws/build/rosmake" \
    "/home/lar/miniconda3/envs/rope_processing/bin/python3.9" \
    "/home/lar/ros/rope_ws/src/ros/rosmake/setup.py" \
     \
    build --build-base "/home/lar/ros/rope_ws/build/rosmake" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/lar/ros/rope_ws/install" --install-scripts="/home/lar/ros/rope_ws/install/bin"

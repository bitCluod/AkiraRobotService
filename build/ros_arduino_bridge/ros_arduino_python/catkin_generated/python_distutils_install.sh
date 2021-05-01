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

echo_and_run cd "/home/salvathor/Documentos/Akira_1.2.2/src/ros_arduino_bridge/ros_arduino_python"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/salvathor/Documentos/Akira_1.2.2/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/salvathor/Documentos/Akira_1.2.2/install/lib/python2.7/dist-packages:/home/salvathor/Documentos/Akira_1.2.2/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/salvathor/Documentos/Akira_1.2.2/build" \
    "/usr/bin/python2" \
    "/home/salvathor/Documentos/Akira_1.2.2/src/ros_arduino_bridge/ros_arduino_python/setup.py" \
     \
    build --build-base "/home/salvathor/Documentos/Akira_1.2.2/build/ros_arduino_bridge/ros_arduino_python" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/salvathor/Documentos/Akira_1.2.2/install" --install-scripts="/home/salvathor/Documentos/Akira_1.2.2/install/bin"

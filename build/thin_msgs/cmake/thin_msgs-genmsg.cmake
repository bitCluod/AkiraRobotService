# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "thin_msgs: 3 messages, 0 services")

set(MSG_I_FLAGS "-Ithin_msgs:/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/kinetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/kinetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(thin_msgs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthImage.msg" NAME_WE)
add_custom_target(_thin_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "thin_msgs" "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthImage.msg" "sensor_msgs/Image:std_msgs/Header"
)

get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/Ticks.msg" NAME_WE)
add_custom_target(_thin_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "thin_msgs" "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/Ticks.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthCameraInfo.msg" NAME_WE)
add_custom_target(_thin_msgs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "thin_msgs" "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthCameraInfo.msg" "std_msgs/Header"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thin_msgs
)
_generate_msg_cpp(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/Ticks.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thin_msgs
)
_generate_msg_cpp(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthCameraInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thin_msgs
)

### Generating Services

### Generating Module File
_generate_module_cpp(thin_msgs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thin_msgs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(thin_msgs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(thin_msgs_generate_messages thin_msgs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthImage.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_cpp _thin_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/Ticks.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_cpp _thin_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthCameraInfo.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_cpp _thin_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thin_msgs_gencpp)
add_dependencies(thin_msgs_gencpp thin_msgs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thin_msgs_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thin_msgs
)
_generate_msg_eus(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/Ticks.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thin_msgs
)
_generate_msg_eus(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthCameraInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thin_msgs
)

### Generating Services

### Generating Module File
_generate_module_eus(thin_msgs
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thin_msgs
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(thin_msgs_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(thin_msgs_generate_messages thin_msgs_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthImage.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_eus _thin_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/Ticks.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_eus _thin_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthCameraInfo.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_eus _thin_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thin_msgs_geneus)
add_dependencies(thin_msgs_geneus thin_msgs_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thin_msgs_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thin_msgs
)
_generate_msg_lisp(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/Ticks.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thin_msgs
)
_generate_msg_lisp(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthCameraInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thin_msgs
)

### Generating Services

### Generating Module File
_generate_module_lisp(thin_msgs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thin_msgs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(thin_msgs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(thin_msgs_generate_messages thin_msgs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthImage.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_lisp _thin_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/Ticks.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_lisp _thin_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthCameraInfo.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_lisp _thin_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thin_msgs_genlisp)
add_dependencies(thin_msgs_genlisp thin_msgs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thin_msgs_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thin_msgs
)
_generate_msg_nodejs(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/Ticks.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thin_msgs
)
_generate_msg_nodejs(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthCameraInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thin_msgs
)

### Generating Services

### Generating Module File
_generate_module_nodejs(thin_msgs
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thin_msgs
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(thin_msgs_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(thin_msgs_generate_messages thin_msgs_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthImage.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_nodejs _thin_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/Ticks.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_nodejs _thin_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthCameraInfo.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_nodejs _thin_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thin_msgs_gennodejs)
add_dependencies(thin_msgs_gennodejs thin_msgs_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thin_msgs_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthImage.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thin_msgs
)
_generate_msg_py(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/Ticks.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thin_msgs
)
_generate_msg_py(thin_msgs
  "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthCameraInfo.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/kinetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thin_msgs
)

### Generating Services

### Generating Module File
_generate_module_py(thin_msgs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thin_msgs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(thin_msgs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(thin_msgs_generate_messages thin_msgs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthImage.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_py _thin_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/Ticks.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_py _thin_msgs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg/SphericalDepthCameraInfo.msg" NAME_WE)
add_dependencies(thin_msgs_generate_messages_py _thin_msgs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thin_msgs_genpy)
add_dependencies(thin_msgs_genpy thin_msgs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thin_msgs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thin_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thin_msgs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(thin_msgs_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(thin_msgs_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thin_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thin_msgs
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(thin_msgs_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(thin_msgs_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thin_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thin_msgs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(thin_msgs_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(thin_msgs_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thin_msgs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thin_msgs
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(thin_msgs_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(thin_msgs_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thin_msgs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thin_msgs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thin_msgs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(thin_msgs_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(thin_msgs_generate_messages_py sensor_msgs_generate_messages_py)
endif()

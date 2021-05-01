# Install script for directory: /home/salvathor/Documentos/Akira_1.2.2/src/rococo_navigation

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/salvathor/Documentos/Akira_1.2.2/install")
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
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/action" TYPE FILE FILES
    "/home/salvathor/Documentos/Akira_1.2.2/src/rococo_navigation/action/Turn.action"
    "/home/salvathor/Documentos/Akira_1.2.2/src/rococo_navigation/action/FollowCorridor.action"
    "/home/salvathor/Documentos/Akira_1.2.2/src/rococo_navigation/action/FollowPerson.action"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/msg" TYPE FILE FILES
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/TurnAction.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/TurnActionGoal.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/TurnActionResult.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/TurnActionFeedback.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/TurnGoal.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/TurnResult.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/TurnFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/msg" TYPE FILE FILES
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowCorridorAction.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowCorridorActionGoal.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowCorridorActionResult.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowCorridorActionFeedback.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowCorridorGoal.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowCorridorResult.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowCorridorFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/msg" TYPE FILE FILES
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowPersonAction.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowPersonActionGoal.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowPersonActionResult.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowPersonActionFeedback.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowPersonGoal.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowPersonResult.msg"
    "/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg/FollowPersonFeedback.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/cmake" TYPE FILE FILES "/home/salvathor/Documentos/Akira_1.2.2/build/rococo_navigation/catkin_generated/installspace/rococo_navigation-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/salvathor/Documentos/Akira_1.2.2/devel/include/rococo_navigation")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/salvathor/Documentos/Akira_1.2.2/devel/share/roseus/ros/rococo_navigation")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/salvathor/Documentos/Akira_1.2.2/devel/share/common-lisp/ros/rococo_navigation")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/salvathor/Documentos/Akira_1.2.2/devel/share/gennodejs/ros/rococo_navigation")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/salvathor/Documentos/Akira_1.2.2/devel/lib/python2.7/dist-packages/rococo_navigation")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/salvathor/Documentos/Akira_1.2.2/devel/lib/python2.7/dist-packages/rococo_navigation")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/salvathor/Documentos/Akira_1.2.2/build/rococo_navigation/catkin_generated/installspace/rococo_navigation.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/cmake" TYPE FILE FILES "/home/salvathor/Documentos/Akira_1.2.2/build/rococo_navigation/catkin_generated/installspace/rococo_navigation-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation/cmake" TYPE FILE FILES
    "/home/salvathor/Documentos/Akira_1.2.2/build/rococo_navigation/catkin_generated/installspace/rococo_navigationConfig.cmake"
    "/home/salvathor/Documentos/Akira_1.2.2/build/rococo_navigation/catkin_generated/installspace/rococo_navigationConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/rococo_navigation" TYPE FILE FILES "/home/salvathor/Documentos/Akira_1.2.2/src/rococo_navigation/package.xml")
endif()


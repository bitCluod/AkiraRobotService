add_library(thin_ros_wrappers_library 
  spherical_image_message_listener.cpp
  image_message_listener.cpp 
  laser_message_listener.cpp 
  multiecholaser_message_listener.cpp
  imu_interpolator.cpp
  imu_message_listener.cpp
  joint_state_message_listener.cpp
  odom_tf_publisher.cpp
  ros_utils.cpp
)

TARGET_LINK_LIBRARIES(thin_ros_wrappers_library
  thin_txt_io_library
  ${OpenCV_LIBS}
  ${ZLIB_LIBRARIES}   
  ${FLANN_LIBRARIES}   
  ${catkin_LIBRARIES}
  )




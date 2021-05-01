SET(TXT_IO_LIBRARY_SRCS 
  property.h property.cpp
  base_message.h base_message.cpp
  static_transform_message.cpp 
  base_sensor_message.h base_sensor_message.cpp
  base_image_message.h base_image_message.cpp
  joint_state_message.cpp joint_state_message.h
  pinhole_image_message.h pinhole_image_message.cpp
  spherical_image_message.h spherical_image_message.cpp
  imu_message.h imu_message.cpp
  pose_message.h pose_message.cpp
  laser_message.cpp laser_message.h
  message_factory.cpp message_factory.h
  message_reader.cpp message_reader.h
  message_writer.cpp message_writer.h
  sensor_message_sorter.h sensor_message_sorter.cpp
  static_transform_tree.h static_transform_tree.cpp
  tf_overrider_trigger.h tf_overrider_trigger.cpp;
  message_dumper_trigger.h message_dumper_trigger.cpp
  message_enlister_trigger.h message_enlister_trigger.cpp
  message_seq_synchronizer.h message_seq_synchronizer.cpp
  message_timestamp_synchronizer.h message_timestamp_synchronizer.cpp
  #laser_viewer.h laser_viewer.cpp
)

ADD_LIBRARY(thin_txt_io_library SHARED
  ${TXT_IO_LIBRARY_SRCS}
)

#add_definitions(-DEIGEN_DONT_PARALLELIZE)	     
#add_definitions(-D_GO_PARALLEL_)	     

TARGET_LINK_LIBRARIES(thin_txt_io_library
  thin_globals_library
  # ${QGLVIEWER_LIBRARY} 
  # ${QT_QTXML_LIBRARY} 
  # ${QT_QTOPENGL_LIBRARY} 
  # ${QT_QTGUI_LIBRARY} 
  # ${QT_QTCORE_LIBRARY} 
  ${OpenCV_LIBS} 
  ${OPENGL_glu_LIBRARY}
  ${OPENGL_gl_LIBRARY} 
  ${Boost_FILESYSTEM_LIBRARY} 
  ${Boost_SYSTEM_LIBRARY}
)

ADD_EXECUTABLE(txt_io_generate_associations txt_io_generate_associations.cpp)

TARGET_LINK_LIBRARIES(txt_io_generate_associations
   thin_globals_library
   thin_txt_io_library
   ${OpenCV_LIBS} 
   ${OPENGL_glu_LIBRARY}
   ${OPENGL_gl_LIBRARY} 
   ${Boost_FILESYSTEM_LIBRARY} 
   ${Boost_SYSTEM_LIBRARY}
)

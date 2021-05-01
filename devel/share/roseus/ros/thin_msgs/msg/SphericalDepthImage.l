;; Auto-generated. Do not edit!


(when (boundp 'thin_msgs::SphericalDepthImage)
  (if (not (find-package "THIN_MSGS"))
    (make-package "THIN_MSGS"))
  (shadow 'SphericalDepthImage (find-package "THIN_MSGS")))
(unless (find-package "THIN_MSGS::SPHERICALDEPTHIMAGE")
  (make-package "THIN_MSGS::SPHERICALDEPTHIMAGE"))

(in-package "ROS")
;;//! \htmlinclude SphericalDepthImage.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass thin_msgs::SphericalDepthImage
  :super ros::object
  :slots (_header _horizontal_fov _vertical_fov _image ))

(defmethod thin_msgs::SphericalDepthImage
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:horizontal_fov __horizontal_fov) 0.0)
    ((:vertical_fov __vertical_fov) 0.0)
    ((:image __image) (instance sensor_msgs::Image :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _horizontal_fov (float __horizontal_fov))
   (setq _vertical_fov (float __vertical_fov))
   (setq _image __image)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:horizontal_fov
   (&optional __horizontal_fov)
   (if __horizontal_fov (setq _horizontal_fov __horizontal_fov)) _horizontal_fov)
  (:vertical_fov
   (&optional __vertical_fov)
   (if __vertical_fov (setq _vertical_fov __vertical_fov)) _vertical_fov)
  (:image
   (&rest __image)
   (if (keywordp (car __image))
       (send* _image __image)
     (progn
       (if __image (setq _image (car __image)))
       _image)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float32 _horizontal_fov
    4
    ;; float32 _vertical_fov
    4
    ;; sensor_msgs/Image _image
    (send _image :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float32 _horizontal_fov
       (sys::poke _horizontal_fov (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vertical_fov
       (sys::poke _vertical_fov (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; sensor_msgs/Image _image
       (send _image :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float32 _horizontal_fov
     (setq _horizontal_fov (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vertical_fov
     (setq _vertical_fov (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; sensor_msgs/Image _image
     (send _image :deserialize buf ptr-) (incf ptr- (send _image :serialization-length))
   ;;
   self)
  )

(setf (get thin_msgs::SphericalDepthImage :md5sum-) "28b67eb85702f0ff03ff03fbb39b252f")
(setf (get thin_msgs::SphericalDepthImage :datatype-) "thin_msgs/SphericalDepthImage")
(setf (get thin_msgs::SphericalDepthImage :definition-)
      "# Single spherical depth image from a 3D laser range-finder
#
# If you have another ranging device with different behavior (e.g. a sonar
# array), please find or create a different message, since applications
# will make fairly laser-specific assumptions about this data

Header header            # timestamp in the header is the acquisition time of 
                         # the first ray in the scan.
                         #
                         # in frame frame_id, angles are measured around 
                         # the positive Z axis (clockwise, if Z is down) and
                         # around the positive Y axis (counterclockwise, if Y is on the left)
                         # with zero angle being forward along the x axis
             
float32 horizontal_fov   # horizontal field of view [deg]            
float32 vertical_fov     # vertical field of view [deg]   

sensor_msgs/Image image  # spherical depth image [uint16]

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of camera
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

")



(provide :thin_msgs/SphericalDepthImage "28b67eb85702f0ff03ff03fbb39b252f")



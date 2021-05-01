;; Auto-generated. Do not edit!


(when (boundp 'thin_msgs::SphericalDepthCameraInfo)
  (if (not (find-package "THIN_MSGS"))
    (make-package "THIN_MSGS"))
  (shadow 'SphericalDepthCameraInfo (find-package "THIN_MSGS")))
(unless (find-package "THIN_MSGS::SPHERICALDEPTHCAMERAINFO")
  (make-package "THIN_MSGS::SPHERICALDEPTHCAMERAINFO"))

(in-package "ROS")
;;//! \htmlinclude SphericalDepthCameraInfo.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass thin_msgs::SphericalDepthCameraInfo
  :super ros::object
  :slots (_header _horizontal_fov _vertical_fov _horizontal_resolution _vertical_resolution _max_range _min_range _depth_quantization ))

(defmethod thin_msgs::SphericalDepthCameraInfo
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:horizontal_fov __horizontal_fov) 0.0)
    ((:vertical_fov __vertical_fov) 0.0)
    ((:horizontal_resolution __horizontal_resolution) 0.0)
    ((:vertical_resolution __vertical_resolution) 0.0)
    ((:max_range __max_range) 0.0)
    ((:min_range __min_range) 0.0)
    ((:depth_quantization __depth_quantization) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _horizontal_fov (float __horizontal_fov))
   (setq _vertical_fov (float __vertical_fov))
   (setq _horizontal_resolution (float __horizontal_resolution))
   (setq _vertical_resolution (float __vertical_resolution))
   (setq _max_range (float __max_range))
   (setq _min_range (float __min_range))
   (setq _depth_quantization (float __depth_quantization))
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
  (:horizontal_resolution
   (&optional __horizontal_resolution)
   (if __horizontal_resolution (setq _horizontal_resolution __horizontal_resolution)) _horizontal_resolution)
  (:vertical_resolution
   (&optional __vertical_resolution)
   (if __vertical_resolution (setq _vertical_resolution __vertical_resolution)) _vertical_resolution)
  (:max_range
   (&optional __max_range)
   (if __max_range (setq _max_range __max_range)) _max_range)
  (:min_range
   (&optional __min_range)
   (if __min_range (setq _min_range __min_range)) _min_range)
  (:depth_quantization
   (&optional __depth_quantization)
   (if __depth_quantization (setq _depth_quantization __depth_quantization)) _depth_quantization)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _horizontal_fov
    8
    ;; float64 _vertical_fov
    8
    ;; float64 _horizontal_resolution
    8
    ;; float64 _vertical_resolution
    8
    ;; float64 _max_range
    8
    ;; float64 _min_range
    8
    ;; float64 _depth_quantization
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _horizontal_fov
       (sys::poke _horizontal_fov (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vertical_fov
       (sys::poke _vertical_fov (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _horizontal_resolution
       (sys::poke _horizontal_resolution (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _vertical_resolution
       (sys::poke _vertical_resolution (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _max_range
       (sys::poke _max_range (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _min_range
       (sys::poke _min_range (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _depth_quantization
       (sys::poke _depth_quantization (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _horizontal_fov
     (setq _horizontal_fov (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vertical_fov
     (setq _vertical_fov (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _horizontal_resolution
     (setq _horizontal_resolution (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _vertical_resolution
     (setq _vertical_resolution (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _max_range
     (setq _max_range (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _min_range
     (setq _min_range (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _depth_quantization
     (setq _depth_quantization (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get thin_msgs::SphericalDepthCameraInfo :md5sum-) "c75aa0007bfd3792f8186edb932d7d9a")
(setf (get thin_msgs::SphericalDepthCameraInfo :datatype-) "thin_msgs/SphericalDepthCameraInfo")
(setf (get thin_msgs::SphericalDepthCameraInfo :definition-)
      "Header header
float64 horizontal_fov
float64 vertical_fov
float64 horizontal_resolution
float64 vertical_resolution
float64 max_range
float64 min_range
float64 depth_quantization 
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

")



(provide :thin_msgs/SphericalDepthCameraInfo "c75aa0007bfd3792f8186edb932d7d9a")



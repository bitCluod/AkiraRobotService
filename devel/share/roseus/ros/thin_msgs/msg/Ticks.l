;; Auto-generated. Do not edit!


(when (boundp 'thin_msgs::Ticks)
  (if (not (find-package "THIN_MSGS"))
    (make-package "THIN_MSGS"))
  (shadow 'Ticks (find-package "THIN_MSGS")))
(unless (find-package "THIN_MSGS::TICKS")
  (make-package "THIN_MSGS::TICKS"))

(in-package "ROS")
;;//! \htmlinclude Ticks.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass thin_msgs::Ticks
  :super ros::object
  :slots (_header _leftEncoder _rightEncoder ))

(defmethod thin_msgs::Ticks
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:leftEncoder __leftEncoder) 0)
    ((:rightEncoder __rightEncoder) 0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _leftEncoder (round __leftEncoder))
   (setq _rightEncoder (round __rightEncoder))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:leftEncoder
   (&optional __leftEncoder)
   (if __leftEncoder (setq _leftEncoder __leftEncoder)) _leftEncoder)
  (:rightEncoder
   (&optional __rightEncoder)
   (if __rightEncoder (setq _rightEncoder __rightEncoder)) _rightEncoder)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; uint16 _leftEncoder
    2
    ;; uint16 _rightEncoder
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; uint16 _leftEncoder
       (write-word _leftEncoder s)
     ;; uint16 _rightEncoder
       (write-word _rightEncoder s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; uint16 _leftEncoder
     (setq _leftEncoder (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; uint16 _rightEncoder
     (setq _rightEncoder (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get thin_msgs::Ticks :md5sum-) "1154acdbb0e0a739326e90742bcd794e")
(setf (get thin_msgs::Ticks :datatype-) "thin_msgs/Ticks")
(setf (get thin_msgs::Ticks :definition-)
      "Header header
uint16 leftEncoder
uint16 rightEncoder

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



(provide :thin_msgs/Ticks "1154acdbb0e0a739326e90742bcd794e")



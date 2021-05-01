; Auto-generated. Do not edit!


(cl:in-package thin_msgs-msg)


;//! \htmlinclude SphericalDepthImage.msg.html

(cl:defclass <SphericalDepthImage> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (horizontal_fov
    :reader horizontal_fov
    :initarg :horizontal_fov
    :type cl:float
    :initform 0.0)
   (vertical_fov
    :reader vertical_fov
    :initarg :vertical_fov
    :type cl:float
    :initform 0.0)
   (image
    :reader image
    :initarg :image
    :type sensor_msgs-msg:Image
    :initform (cl:make-instance 'sensor_msgs-msg:Image)))
)

(cl:defclass SphericalDepthImage (<SphericalDepthImage>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SphericalDepthImage>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SphericalDepthImage)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name thin_msgs-msg:<SphericalDepthImage> is deprecated: use thin_msgs-msg:SphericalDepthImage instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SphericalDepthImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:header-val is deprecated.  Use thin_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'horizontal_fov-val :lambda-list '(m))
(cl:defmethod horizontal_fov-val ((m <SphericalDepthImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:horizontal_fov-val is deprecated.  Use thin_msgs-msg:horizontal_fov instead.")
  (horizontal_fov m))

(cl:ensure-generic-function 'vertical_fov-val :lambda-list '(m))
(cl:defmethod vertical_fov-val ((m <SphericalDepthImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:vertical_fov-val is deprecated.  Use thin_msgs-msg:vertical_fov instead.")
  (vertical_fov m))

(cl:ensure-generic-function 'image-val :lambda-list '(m))
(cl:defmethod image-val ((m <SphericalDepthImage>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:image-val is deprecated.  Use thin_msgs-msg:image instead.")
  (image m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SphericalDepthImage>) ostream)
  "Serializes a message object of type '<SphericalDepthImage>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'horizontal_fov))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'vertical_fov))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'image) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SphericalDepthImage>) istream)
  "Deserializes a message object of type '<SphericalDepthImage>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'horizontal_fov) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vertical_fov) (roslisp-utils:decode-single-float-bits bits)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'image) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SphericalDepthImage>)))
  "Returns string type for a message object of type '<SphericalDepthImage>"
  "thin_msgs/SphericalDepthImage")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SphericalDepthImage)))
  "Returns string type for a message object of type 'SphericalDepthImage"
  "thin_msgs/SphericalDepthImage")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SphericalDepthImage>)))
  "Returns md5sum for a message object of type '<SphericalDepthImage>"
  "28b67eb85702f0ff03ff03fbb39b252f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SphericalDepthImage)))
  "Returns md5sum for a message object of type 'SphericalDepthImage"
  "28b67eb85702f0ff03ff03fbb39b252f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SphericalDepthImage>)))
  "Returns full string definition for message of type '<SphericalDepthImage>"
  (cl:format cl:nil "# Single spherical depth image from a 3D laser range-finder~%#~%# If you have another ranging device with different behavior (e.g. a sonar~%# array), please find or create a different message, since applications~%# will make fairly laser-specific assumptions about this data~%~%Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (clockwise, if Z is down) and~%                         # around the positive Y axis (counterclockwise, if Y is on the left)~%                         # with zero angle being forward along the x axis~%             ~%float32 horizontal_fov   # horizontal field of view [deg]            ~%float32 vertical_fov     # vertical field of view [deg]   ~%~%sensor_msgs/Image image  # spherical depth image [uint16]~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SphericalDepthImage)))
  "Returns full string definition for message of type 'SphericalDepthImage"
  (cl:format cl:nil "# Single spherical depth image from a 3D laser range-finder~%#~%# If you have another ranging device with different behavior (e.g. a sonar~%# array), please find or create a different message, since applications~%# will make fairly laser-specific assumptions about this data~%~%Header header            # timestamp in the header is the acquisition time of ~%                         # the first ray in the scan.~%                         #~%                         # in frame frame_id, angles are measured around ~%                         # the positive Z axis (clockwise, if Z is down) and~%                         # around the positive Y axis (counterclockwise, if Y is on the left)~%                         # with zero angle being forward along the x axis~%             ~%float32 horizontal_fov   # horizontal field of view [deg]            ~%float32 vertical_fov     # vertical field of view [deg]   ~%~%sensor_msgs/Image image  # spherical depth image [uint16]~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of camera~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SphericalDepthImage>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'image))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SphericalDepthImage>))
  "Converts a ROS message object to a list"
  (cl:list 'SphericalDepthImage
    (cl:cons ':header (header msg))
    (cl:cons ':horizontal_fov (horizontal_fov msg))
    (cl:cons ':vertical_fov (vertical_fov msg))
    (cl:cons ':image (image msg))
))

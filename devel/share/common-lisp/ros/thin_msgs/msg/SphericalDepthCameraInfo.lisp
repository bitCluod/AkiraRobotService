; Auto-generated. Do not edit!


(cl:in-package thin_msgs-msg)


;//! \htmlinclude SphericalDepthCameraInfo.msg.html

(cl:defclass <SphericalDepthCameraInfo> (roslisp-msg-protocol:ros-message)
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
   (horizontal_resolution
    :reader horizontal_resolution
    :initarg :horizontal_resolution
    :type cl:float
    :initform 0.0)
   (vertical_resolution
    :reader vertical_resolution
    :initarg :vertical_resolution
    :type cl:float
    :initform 0.0)
   (max_range
    :reader max_range
    :initarg :max_range
    :type cl:float
    :initform 0.0)
   (min_range
    :reader min_range
    :initarg :min_range
    :type cl:float
    :initform 0.0)
   (depth_quantization
    :reader depth_quantization
    :initarg :depth_quantization
    :type cl:float
    :initform 0.0))
)

(cl:defclass SphericalDepthCameraInfo (<SphericalDepthCameraInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SphericalDepthCameraInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SphericalDepthCameraInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name thin_msgs-msg:<SphericalDepthCameraInfo> is deprecated: use thin_msgs-msg:SphericalDepthCameraInfo instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SphericalDepthCameraInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:header-val is deprecated.  Use thin_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'horizontal_fov-val :lambda-list '(m))
(cl:defmethod horizontal_fov-val ((m <SphericalDepthCameraInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:horizontal_fov-val is deprecated.  Use thin_msgs-msg:horizontal_fov instead.")
  (horizontal_fov m))

(cl:ensure-generic-function 'vertical_fov-val :lambda-list '(m))
(cl:defmethod vertical_fov-val ((m <SphericalDepthCameraInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:vertical_fov-val is deprecated.  Use thin_msgs-msg:vertical_fov instead.")
  (vertical_fov m))

(cl:ensure-generic-function 'horizontal_resolution-val :lambda-list '(m))
(cl:defmethod horizontal_resolution-val ((m <SphericalDepthCameraInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:horizontal_resolution-val is deprecated.  Use thin_msgs-msg:horizontal_resolution instead.")
  (horizontal_resolution m))

(cl:ensure-generic-function 'vertical_resolution-val :lambda-list '(m))
(cl:defmethod vertical_resolution-val ((m <SphericalDepthCameraInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:vertical_resolution-val is deprecated.  Use thin_msgs-msg:vertical_resolution instead.")
  (vertical_resolution m))

(cl:ensure-generic-function 'max_range-val :lambda-list '(m))
(cl:defmethod max_range-val ((m <SphericalDepthCameraInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:max_range-val is deprecated.  Use thin_msgs-msg:max_range instead.")
  (max_range m))

(cl:ensure-generic-function 'min_range-val :lambda-list '(m))
(cl:defmethod min_range-val ((m <SphericalDepthCameraInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:min_range-val is deprecated.  Use thin_msgs-msg:min_range instead.")
  (min_range m))

(cl:ensure-generic-function 'depth_quantization-val :lambda-list '(m))
(cl:defmethod depth_quantization-val ((m <SphericalDepthCameraInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:depth_quantization-val is deprecated.  Use thin_msgs-msg:depth_quantization instead.")
  (depth_quantization m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SphericalDepthCameraInfo>) ostream)
  "Serializes a message object of type '<SphericalDepthCameraInfo>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'horizontal_fov))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vertical_fov))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'horizontal_resolution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'vertical_resolution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'max_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'min_range))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'depth_quantization))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SphericalDepthCameraInfo>) istream)
  "Deserializes a message object of type '<SphericalDepthCameraInfo>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'horizontal_fov) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vertical_fov) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'horizontal_resolution) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'vertical_resolution) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_range) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'min_range) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'depth_quantization) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SphericalDepthCameraInfo>)))
  "Returns string type for a message object of type '<SphericalDepthCameraInfo>"
  "thin_msgs/SphericalDepthCameraInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SphericalDepthCameraInfo)))
  "Returns string type for a message object of type 'SphericalDepthCameraInfo"
  "thin_msgs/SphericalDepthCameraInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SphericalDepthCameraInfo>)))
  "Returns md5sum for a message object of type '<SphericalDepthCameraInfo>"
  "c75aa0007bfd3792f8186edb932d7d9a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SphericalDepthCameraInfo)))
  "Returns md5sum for a message object of type 'SphericalDepthCameraInfo"
  "c75aa0007bfd3792f8186edb932d7d9a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SphericalDepthCameraInfo>)))
  "Returns full string definition for message of type '<SphericalDepthCameraInfo>"
  (cl:format cl:nil "Header header~%float64 horizontal_fov~%float64 vertical_fov~%float64 horizontal_resolution~%float64 vertical_resolution~%float64 max_range~%float64 min_range~%float64 depth_quantization ~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SphericalDepthCameraInfo)))
  "Returns full string definition for message of type 'SphericalDepthCameraInfo"
  (cl:format cl:nil "Header header~%float64 horizontal_fov~%float64 vertical_fov~%float64 horizontal_resolution~%float64 vertical_resolution~%float64 max_range~%float64 min_range~%float64 depth_quantization ~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SphericalDepthCameraInfo>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     8
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SphericalDepthCameraInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'SphericalDepthCameraInfo
    (cl:cons ':header (header msg))
    (cl:cons ':horizontal_fov (horizontal_fov msg))
    (cl:cons ':vertical_fov (vertical_fov msg))
    (cl:cons ':horizontal_resolution (horizontal_resolution msg))
    (cl:cons ':vertical_resolution (vertical_resolution msg))
    (cl:cons ':max_range (max_range msg))
    (cl:cons ':min_range (min_range msg))
    (cl:cons ':depth_quantization (depth_quantization msg))
))

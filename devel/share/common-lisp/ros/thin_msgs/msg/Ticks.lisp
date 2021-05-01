; Auto-generated. Do not edit!


(cl:in-package thin_msgs-msg)


;//! \htmlinclude Ticks.msg.html

(cl:defclass <Ticks> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (leftEncoder
    :reader leftEncoder
    :initarg :leftEncoder
    :type cl:fixnum
    :initform 0)
   (rightEncoder
    :reader rightEncoder
    :initarg :rightEncoder
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Ticks (<Ticks>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Ticks>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Ticks)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name thin_msgs-msg:<Ticks> is deprecated: use thin_msgs-msg:Ticks instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <Ticks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:header-val is deprecated.  Use thin_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'leftEncoder-val :lambda-list '(m))
(cl:defmethod leftEncoder-val ((m <Ticks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:leftEncoder-val is deprecated.  Use thin_msgs-msg:leftEncoder instead.")
  (leftEncoder m))

(cl:ensure-generic-function 'rightEncoder-val :lambda-list '(m))
(cl:defmethod rightEncoder-val ((m <Ticks>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thin_msgs-msg:rightEncoder-val is deprecated.  Use thin_msgs-msg:rightEncoder instead.")
  (rightEncoder m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Ticks>) ostream)
  "Serializes a message object of type '<Ticks>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'leftEncoder)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'leftEncoder)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rightEncoder)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rightEncoder)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Ticks>) istream)
  "Deserializes a message object of type '<Ticks>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'leftEncoder)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'leftEncoder)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'rightEncoder)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'rightEncoder)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Ticks>)))
  "Returns string type for a message object of type '<Ticks>"
  "thin_msgs/Ticks")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Ticks)))
  "Returns string type for a message object of type 'Ticks"
  "thin_msgs/Ticks")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Ticks>)))
  "Returns md5sum for a message object of type '<Ticks>"
  "1154acdbb0e0a739326e90742bcd794e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Ticks)))
  "Returns md5sum for a message object of type 'Ticks"
  "1154acdbb0e0a739326e90742bcd794e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Ticks>)))
  "Returns full string definition for message of type '<Ticks>"
  (cl:format cl:nil "Header header~%uint16 leftEncoder~%uint16 rightEncoder~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Ticks)))
  "Returns full string definition for message of type 'Ticks"
  (cl:format cl:nil "Header header~%uint16 leftEncoder~%uint16 rightEncoder~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Ticks>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     2
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Ticks>))
  "Converts a ROS message object to a list"
  (cl:list 'Ticks
    (cl:cons ':header (header msg))
    (cl:cons ':leftEncoder (leftEncoder msg))
    (cl:cons ':rightEncoder (rightEncoder msg))
))

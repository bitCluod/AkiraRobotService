; Auto-generated. Do not edit!


(cl:in-package laser_analysis-msg)


;//! \htmlinclude LaserObstacleMap.msg.html

(cl:defclass <LaserObstacleMap> (roslisp-msg-protocol:ros-message)
  ((stamp
    :reader stamp
    :initarg :stamp
    :type cl:real
    :initform 0)
   (npoints
    :reader npoints
    :initarg :npoints
    :type cl:integer
    :initform 0)
   (mx
    :reader mx
    :initarg :mx
    :type cl:float
    :initform 0.0)
   (my
    :reader my
    :initarg :my
    :type cl:float
    :initform 0.0)
   (var
    :reader var
    :initarg :var
    :type cl:float
    :initform 0.0))
)

(cl:defclass LaserObstacleMap (<LaserObstacleMap>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LaserObstacleMap>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LaserObstacleMap)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_analysis-msg:<LaserObstacleMap> is deprecated: use laser_analysis-msg:LaserObstacleMap instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <LaserObstacleMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_analysis-msg:stamp-val is deprecated.  Use laser_analysis-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'npoints-val :lambda-list '(m))
(cl:defmethod npoints-val ((m <LaserObstacleMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_analysis-msg:npoints-val is deprecated.  Use laser_analysis-msg:npoints instead.")
  (npoints m))

(cl:ensure-generic-function 'mx-val :lambda-list '(m))
(cl:defmethod mx-val ((m <LaserObstacleMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_analysis-msg:mx-val is deprecated.  Use laser_analysis-msg:mx instead.")
  (mx m))

(cl:ensure-generic-function 'my-val :lambda-list '(m))
(cl:defmethod my-val ((m <LaserObstacleMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_analysis-msg:my-val is deprecated.  Use laser_analysis-msg:my instead.")
  (my m))

(cl:ensure-generic-function 'var-val :lambda-list '(m))
(cl:defmethod var-val ((m <LaserObstacleMap>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_analysis-msg:var-val is deprecated.  Use laser_analysis-msg:var instead.")
  (var m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LaserObstacleMap>) ostream)
  "Serializes a message object of type '<LaserObstacleMap>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'stamp)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'stamp) (cl:floor (cl:slot-value msg 'stamp)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (cl:let* ((signed (cl:slot-value msg 'npoints)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'mx))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'my))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'var))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LaserObstacleMap>) istream)
  "Deserializes a message object of type '<LaserObstacleMap>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'stamp) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'npoints) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'mx) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'my) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'var) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LaserObstacleMap>)))
  "Returns string type for a message object of type '<LaserObstacleMap>"
  "laser_analysis/LaserObstacleMap")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LaserObstacleMap)))
  "Returns string type for a message object of type 'LaserObstacleMap"
  "laser_analysis/LaserObstacleMap")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LaserObstacleMap>)))
  "Returns md5sum for a message object of type '<LaserObstacleMap>"
  "005f105a79e5ce59454afd0525f43586")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LaserObstacleMap)))
  "Returns md5sum for a message object of type 'LaserObstacleMap"
  "005f105a79e5ce59454afd0525f43586")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LaserObstacleMap>)))
  "Returns full string definition for message of type '<LaserObstacleMap>"
  (cl:format cl:nil "time stamp~%int32 npoints~%float64 mx~%float64 my~%float64 var~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LaserObstacleMap)))
  "Returns full string definition for message of type 'LaserObstacleMap"
  (cl:format cl:nil "time stamp~%int32 npoints~%float64 mx~%float64 my~%float64 var~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LaserObstacleMap>))
  (cl:+ 0
     8
     4
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LaserObstacleMap>))
  "Converts a ROS message object to a list"
  (cl:list 'LaserObstacleMap
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':npoints (npoints msg))
    (cl:cons ':mx (mx msg))
    (cl:cons ':my (my msg))
    (cl:cons ':var (var msg))
))

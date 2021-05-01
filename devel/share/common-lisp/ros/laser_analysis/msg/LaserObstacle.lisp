; Auto-generated. Do not edit!


(cl:in-package laser_analysis-msg)


;//! \htmlinclude LaserObstacle.msg.html

(cl:defclass <LaserObstacle> (roslisp-msg-protocol:ros-message)
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
   (mindist
    :reader mindist
    :initarg :mindist
    :type cl:float
    :initform 0.0)
   (y1
    :reader y1
    :initarg :y1
    :type cl:float
    :initform 0.0)
   (y2
    :reader y2
    :initarg :y2
    :type cl:float
    :initform 0.0))
)

(cl:defclass LaserObstacle (<LaserObstacle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LaserObstacle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LaserObstacle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name laser_analysis-msg:<LaserObstacle> is deprecated: use laser_analysis-msg:LaserObstacle instead.")))

(cl:ensure-generic-function 'stamp-val :lambda-list '(m))
(cl:defmethod stamp-val ((m <LaserObstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_analysis-msg:stamp-val is deprecated.  Use laser_analysis-msg:stamp instead.")
  (stamp m))

(cl:ensure-generic-function 'npoints-val :lambda-list '(m))
(cl:defmethod npoints-val ((m <LaserObstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_analysis-msg:npoints-val is deprecated.  Use laser_analysis-msg:npoints instead.")
  (npoints m))

(cl:ensure-generic-function 'mindist-val :lambda-list '(m))
(cl:defmethod mindist-val ((m <LaserObstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_analysis-msg:mindist-val is deprecated.  Use laser_analysis-msg:mindist instead.")
  (mindist m))

(cl:ensure-generic-function 'y1-val :lambda-list '(m))
(cl:defmethod y1-val ((m <LaserObstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_analysis-msg:y1-val is deprecated.  Use laser_analysis-msg:y1 instead.")
  (y1 m))

(cl:ensure-generic-function 'y2-val :lambda-list '(m))
(cl:defmethod y2-val ((m <LaserObstacle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader laser_analysis-msg:y2-val is deprecated.  Use laser_analysis-msg:y2 instead.")
  (y2 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LaserObstacle>) ostream)
  "Serializes a message object of type '<LaserObstacle>"
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
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'mindist))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LaserObstacle>) istream)
  "Deserializes a message object of type '<LaserObstacle>"
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
    (cl:setf (cl:slot-value msg 'mindist) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y1) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y2) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LaserObstacle>)))
  "Returns string type for a message object of type '<LaserObstacle>"
  "laser_analysis/LaserObstacle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LaserObstacle)))
  "Returns string type for a message object of type 'LaserObstacle"
  "laser_analysis/LaserObstacle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LaserObstacle>)))
  "Returns md5sum for a message object of type '<LaserObstacle>"
  "ee9cd1755859dc1d90f8adb4433b5b03")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LaserObstacle)))
  "Returns md5sum for a message object of type 'LaserObstacle"
  "ee9cd1755859dc1d90f8adb4433b5b03")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LaserObstacle>)))
  "Returns full string definition for message of type '<LaserObstacle>"
  (cl:format cl:nil "time stamp~%int32 npoints~%float64 mindist~%float64 y1~%float64 y2~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LaserObstacle)))
  "Returns full string definition for message of type 'LaserObstacle"
  (cl:format cl:nil "time stamp~%int32 npoints~%float64 mindist~%float64 y1~%float64 y2~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LaserObstacle>))
  (cl:+ 0
     8
     4
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LaserObstacle>))
  "Converts a ROS message object to a list"
  (cl:list 'LaserObstacle
    (cl:cons ':stamp (stamp msg))
    (cl:cons ':npoints (npoints msg))
    (cl:cons ':mindist (mindist msg))
    (cl:cons ':y1 (y1 msg))
    (cl:cons ':y2 (y2 msg))
))

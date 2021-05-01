; Auto-generated. Do not edit!


(cl:in-package rococo_navigation-msg)


;//! \htmlinclude FollowCorridorGoal.msg.html

(cl:defclass <FollowCorridorGoal> (roslisp-msg-protocol:ros-message)
  ((target_X
    :reader target_X
    :initarg :target_X
    :type cl:float
    :initform 0.0)
   (target_Y
    :reader target_Y
    :initarg :target_Y
    :type cl:float
    :initform 0.0)
   (max_vel
    :reader max_vel
    :initarg :max_vel
    :type cl:float
    :initform 0.0))
)

(cl:defclass FollowCorridorGoal (<FollowCorridorGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FollowCorridorGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FollowCorridorGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rococo_navigation-msg:<FollowCorridorGoal> is deprecated: use rococo_navigation-msg:FollowCorridorGoal instead.")))

(cl:ensure-generic-function 'target_X-val :lambda-list '(m))
(cl:defmethod target_X-val ((m <FollowCorridorGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rococo_navigation-msg:target_X-val is deprecated.  Use rococo_navigation-msg:target_X instead.")
  (target_X m))

(cl:ensure-generic-function 'target_Y-val :lambda-list '(m))
(cl:defmethod target_Y-val ((m <FollowCorridorGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rococo_navigation-msg:target_Y-val is deprecated.  Use rococo_navigation-msg:target_Y instead.")
  (target_Y m))

(cl:ensure-generic-function 'max_vel-val :lambda-list '(m))
(cl:defmethod max_vel-val ((m <FollowCorridorGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rococo_navigation-msg:max_vel-val is deprecated.  Use rococo_navigation-msg:max_vel instead.")
  (max_vel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FollowCorridorGoal>) ostream)
  "Serializes a message object of type '<FollowCorridorGoal>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target_X))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target_Y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FollowCorridorGoal>) istream)
  "Deserializes a message object of type '<FollowCorridorGoal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_X) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_Y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_vel) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FollowCorridorGoal>)))
  "Returns string type for a message object of type '<FollowCorridorGoal>"
  "rococo_navigation/FollowCorridorGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FollowCorridorGoal)))
  "Returns string type for a message object of type 'FollowCorridorGoal"
  "rococo_navigation/FollowCorridorGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FollowCorridorGoal>)))
  "Returns md5sum for a message object of type '<FollowCorridorGoal>"
  "6213a78c6faf5ade64348156f926f0c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FollowCorridorGoal)))
  "Returns md5sum for a message object of type 'FollowCorridorGoal"
  "6213a78c6faf5ade64348156f926f0c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FollowCorridorGoal>)))
  "Returns full string definition for message of type '<FollowCorridorGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%# target position ~%float32 target_X~%float32 target_Y~%# max velocity [m/s]~%float32 max_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FollowCorridorGoal)))
  "Returns full string definition for message of type 'FollowCorridorGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%# target position ~%float32 target_X~%float32 target_Y~%# max velocity [m/s]~%float32 max_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FollowCorridorGoal>))
  (cl:+ 0
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FollowCorridorGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'FollowCorridorGoal
    (cl:cons ':target_X (target_X msg))
    (cl:cons ':target_Y (target_Y msg))
    (cl:cons ':max_vel (max_vel msg))
))

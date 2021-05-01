; Auto-generated. Do not edit!


(cl:in-package rococo_navigation-msg)


;//! \htmlinclude TurnGoal.msg.html

(cl:defclass <TurnGoal> (roslisp-msg-protocol:ros-message)
  ((target_angle
    :reader target_angle
    :initarg :target_angle
    :type cl:float
    :initform 0.0)
   (absolute_relative_flag
    :reader absolute_relative_flag
    :initarg :absolute_relative_flag
    :type cl:string
    :initform "")
   (max_ang_vel
    :reader max_ang_vel
    :initarg :max_ang_vel
    :type cl:float
    :initform 0.0))
)

(cl:defclass TurnGoal (<TurnGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TurnGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TurnGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rococo_navigation-msg:<TurnGoal> is deprecated: use rococo_navigation-msg:TurnGoal instead.")))

(cl:ensure-generic-function 'target_angle-val :lambda-list '(m))
(cl:defmethod target_angle-val ((m <TurnGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rococo_navigation-msg:target_angle-val is deprecated.  Use rococo_navigation-msg:target_angle instead.")
  (target_angle m))

(cl:ensure-generic-function 'absolute_relative_flag-val :lambda-list '(m))
(cl:defmethod absolute_relative_flag-val ((m <TurnGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rococo_navigation-msg:absolute_relative_flag-val is deprecated.  Use rococo_navigation-msg:absolute_relative_flag instead.")
  (absolute_relative_flag m))

(cl:ensure-generic-function 'max_ang_vel-val :lambda-list '(m))
(cl:defmethod max_ang_vel-val ((m <TurnGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rococo_navigation-msg:max_ang_vel-val is deprecated.  Use rococo_navigation-msg:max_ang_vel instead.")
  (max_ang_vel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TurnGoal>) ostream)
  "Serializes a message object of type '<TurnGoal>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'target_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'absolute_relative_flag))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'absolute_relative_flag))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'max_ang_vel))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TurnGoal>) istream)
  "Deserializes a message object of type '<TurnGoal>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'target_angle) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'absolute_relative_flag) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'absolute_relative_flag) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'max_ang_vel) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TurnGoal>)))
  "Returns string type for a message object of type '<TurnGoal>"
  "rococo_navigation/TurnGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TurnGoal)))
  "Returns string type for a message object of type 'TurnGoal"
  "rococo_navigation/TurnGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TurnGoal>)))
  "Returns md5sum for a message object of type '<TurnGoal>"
  "6590b572f5a90e57b737335d6531bce7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TurnGoal)))
  "Returns md5sum for a message object of type 'TurnGoal"
  "6590b572f5a90e57b737335d6531bce7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TurnGoal>)))
  "Returns full string definition for message of type '<TurnGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%# target_angle [DEG] ~%float32 target_angle~%# flag ABS/REL~%string absolute_relative_flag~%# max angular velocity [DEG/s]~%float32 max_ang_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TurnGoal)))
  "Returns full string definition for message of type 'TurnGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Goal~%# target_angle [DEG] ~%float32 target_angle~%# flag ABS/REL~%string absolute_relative_flag~%# max angular velocity [DEG/s]~%float32 max_ang_vel~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TurnGoal>))
  (cl:+ 0
     4
     4 (cl:length (cl:slot-value msg 'absolute_relative_flag))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TurnGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'TurnGoal
    (cl:cons ':target_angle (target_angle msg))
    (cl:cons ':absolute_relative_flag (absolute_relative_flag msg))
    (cl:cons ':max_ang_vel (max_ang_vel msg))
))

; Auto-generated. Do not edit!


(cl:in-package rococo_navigation-msg)


;//! \htmlinclude FollowCorridorFeedback.msg.html

(cl:defclass <FollowCorridorFeedback> (roslisp-msg-protocol:ros-message)
  ((feedback
    :reader feedback
    :initarg :feedback
    :type cl:string
    :initform ""))
)

(cl:defclass FollowCorridorFeedback (<FollowCorridorFeedback>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FollowCorridorFeedback>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FollowCorridorFeedback)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rococo_navigation-msg:<FollowCorridorFeedback> is deprecated: use rococo_navigation-msg:FollowCorridorFeedback instead.")))

(cl:ensure-generic-function 'feedback-val :lambda-list '(m))
(cl:defmethod feedback-val ((m <FollowCorridorFeedback>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rococo_navigation-msg:feedback-val is deprecated.  Use rococo_navigation-msg:feedback instead.")
  (feedback m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FollowCorridorFeedback>) ostream)
  "Serializes a message object of type '<FollowCorridorFeedback>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'feedback))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'feedback))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FollowCorridorFeedback>) istream)
  "Deserializes a message object of type '<FollowCorridorFeedback>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'feedback) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'feedback) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FollowCorridorFeedback>)))
  "Returns string type for a message object of type '<FollowCorridorFeedback>"
  "rococo_navigation/FollowCorridorFeedback")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FollowCorridorFeedback)))
  "Returns string type for a message object of type 'FollowCorridorFeedback"
  "rococo_navigation/FollowCorridorFeedback")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FollowCorridorFeedback>)))
  "Returns md5sum for a message object of type '<FollowCorridorFeedback>"
  "c14cdf907e5c7c7fd47292add15660f0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FollowCorridorFeedback)))
  "Returns md5sum for a message object of type 'FollowCorridorFeedback"
  "c14cdf907e5c7c7fd47292add15660f0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FollowCorridorFeedback>)))
  "Returns full string definition for message of type '<FollowCorridorFeedback>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Feedback~%string feedback~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FollowCorridorFeedback)))
  "Returns full string definition for message of type 'FollowCorridorFeedback"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%# Feedback~%string feedback~%~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FollowCorridorFeedback>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'feedback))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FollowCorridorFeedback>))
  "Converts a ROS message object to a list"
  (cl:list 'FollowCorridorFeedback
    (cl:cons ':feedback (feedback msg))
))

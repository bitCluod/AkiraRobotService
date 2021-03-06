;; Auto-generated. Do not edit!


(when (boundp 'rococo_navigation::FollowCorridorGoal)
  (if (not (find-package "ROCOCO_NAVIGATION"))
    (make-package "ROCOCO_NAVIGATION"))
  (shadow 'FollowCorridorGoal (find-package "ROCOCO_NAVIGATION")))
(unless (find-package "ROCOCO_NAVIGATION::FOLLOWCORRIDORGOAL")
  (make-package "ROCOCO_NAVIGATION::FOLLOWCORRIDORGOAL"))

(in-package "ROS")
;;//! \htmlinclude FollowCorridorGoal.msg.html


(defclass rococo_navigation::FollowCorridorGoal
  :super ros::object
  :slots (_target_X _target_Y _max_vel ))

(defmethod rococo_navigation::FollowCorridorGoal
  (:init
   (&key
    ((:target_X __target_X) 0.0)
    ((:target_Y __target_Y) 0.0)
    ((:max_vel __max_vel) 0.0)
    )
   (send-super :init)
   (setq _target_X (float __target_X))
   (setq _target_Y (float __target_Y))
   (setq _max_vel (float __max_vel))
   self)
  (:target_X
   (&optional __target_X)
   (if __target_X (setq _target_X __target_X)) _target_X)
  (:target_Y
   (&optional __target_Y)
   (if __target_Y (setq _target_Y __target_Y)) _target_Y)
  (:max_vel
   (&optional __max_vel)
   (if __max_vel (setq _max_vel __max_vel)) _max_vel)
  (:serialization-length
   ()
   (+
    ;; float32 _target_X
    4
    ;; float32 _target_Y
    4
    ;; float32 _max_vel
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _target_X
       (sys::poke _target_X (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _target_Y
       (sys::poke _target_Y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _max_vel
       (sys::poke _max_vel (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _target_X
     (setq _target_X (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _target_Y
     (setq _target_Y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _max_vel
     (setq _max_vel (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get rococo_navigation::FollowCorridorGoal :md5sum-) "6213a78c6faf5ade64348156f926f0c1")
(setf (get rococo_navigation::FollowCorridorGoal :datatype-) "rococo_navigation/FollowCorridorGoal")
(setf (get rococo_navigation::FollowCorridorGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Goal
# target position 
float32 target_X
float32 target_Y
# max velocity [m/s]
float32 max_vel

")



(provide :rococo_navigation/FollowCorridorGoal "6213a78c6faf5ade64348156f926f0c1")



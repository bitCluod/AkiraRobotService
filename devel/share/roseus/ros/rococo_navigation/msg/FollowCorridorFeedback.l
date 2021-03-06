;; Auto-generated. Do not edit!


(when (boundp 'rococo_navigation::FollowCorridorFeedback)
  (if (not (find-package "ROCOCO_NAVIGATION"))
    (make-package "ROCOCO_NAVIGATION"))
  (shadow 'FollowCorridorFeedback (find-package "ROCOCO_NAVIGATION")))
(unless (find-package "ROCOCO_NAVIGATION::FOLLOWCORRIDORFEEDBACK")
  (make-package "ROCOCO_NAVIGATION::FOLLOWCORRIDORFEEDBACK"))

(in-package "ROS")
;;//! \htmlinclude FollowCorridorFeedback.msg.html


(defclass rococo_navigation::FollowCorridorFeedback
  :super ros::object
  :slots (_feedback ))

(defmethod rococo_navigation::FollowCorridorFeedback
  (:init
   (&key
    ((:feedback __feedback) "")
    )
   (send-super :init)
   (setq _feedback (string __feedback))
   self)
  (:feedback
   (&optional __feedback)
   (if __feedback (setq _feedback __feedback)) _feedback)
  (:serialization-length
   ()
   (+
    ;; string _feedback
    4 (length _feedback)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _feedback
       (write-long (length _feedback) s) (princ _feedback s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _feedback
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _feedback (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get rococo_navigation::FollowCorridorFeedback :md5sum-) "c14cdf907e5c7c7fd47292add15660f0")
(setf (get rococo_navigation::FollowCorridorFeedback :datatype-) "rococo_navigation/FollowCorridorFeedback")
(setf (get rococo_navigation::FollowCorridorFeedback :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
# Feedback
string feedback



")



(provide :rococo_navigation/FollowCorridorFeedback "c14cdf907e5c7c7fd47292add15660f0")



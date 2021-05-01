;; Auto-generated. Do not edit!


(when (boundp 'laser_analysis::LaserObstacle)
  (if (not (find-package "LASER_ANALYSIS"))
    (make-package "LASER_ANALYSIS"))
  (shadow 'LaserObstacle (find-package "LASER_ANALYSIS")))
(unless (find-package "LASER_ANALYSIS::LASEROBSTACLE")
  (make-package "LASER_ANALYSIS::LASEROBSTACLE"))

(in-package "ROS")
;;//! \htmlinclude LaserObstacle.msg.html


(defclass laser_analysis::LaserObstacle
  :super ros::object
  :slots (_stamp _npoints _mindist _y1 _y2 ))

(defmethod laser_analysis::LaserObstacle
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:npoints __npoints) 0)
    ((:mindist __mindist) 0.0)
    ((:y1 __y1) 0.0)
    ((:y2 __y2) 0.0)
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _npoints (round __npoints))
   (setq _mindist (float __mindist))
   (setq _y1 (float __y1))
   (setq _y2 (float __y2))
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:npoints
   (&optional __npoints)
   (if __npoints (setq _npoints __npoints)) _npoints)
  (:mindist
   (&optional __mindist)
   (if __mindist (setq _mindist __mindist)) _mindist)
  (:y1
   (&optional __y1)
   (if __y1 (setq _y1 __y1)) _y1)
  (:y2
   (&optional __y2)
   (if __y2 (setq _y2 __y2)) _y2)
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; int32 _npoints
    4
    ;; float64 _mindist
    8
    ;; float64 _y1
    8
    ;; float64 _y2
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; time _stamp
       (write-long (send _stamp :sec) s) (write-long (send _stamp :nsec) s)
     ;; int32 _npoints
       (write-long _npoints s)
     ;; float64 _mindist
       (sys::poke _mindist (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y1
       (sys::poke _y1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y2
       (sys::poke _y2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _npoints
     (setq _npoints (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _mindist
     (setq _mindist (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y1
     (setq _y1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y2
     (setq _y2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get laser_analysis::LaserObstacle :md5sum-) "ee9cd1755859dc1d90f8adb4433b5b03")
(setf (get laser_analysis::LaserObstacle :datatype-) "laser_analysis/LaserObstacle")
(setf (get laser_analysis::LaserObstacle :definition-)
      "time stamp
int32 npoints
float64 mindist
float64 y1
float64 y2



")



(provide :laser_analysis/LaserObstacle "ee9cd1755859dc1d90f8adb4433b5b03")



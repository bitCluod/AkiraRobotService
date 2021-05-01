;; Auto-generated. Do not edit!


(when (boundp 'laser_analysis::LaserObstacleMap)
  (if (not (find-package "LASER_ANALYSIS"))
    (make-package "LASER_ANALYSIS"))
  (shadow 'LaserObstacleMap (find-package "LASER_ANALYSIS")))
(unless (find-package "LASER_ANALYSIS::LASEROBSTACLEMAP")
  (make-package "LASER_ANALYSIS::LASEROBSTACLEMAP"))

(in-package "ROS")
;;//! \htmlinclude LaserObstacleMap.msg.html


(defclass laser_analysis::LaserObstacleMap
  :super ros::object
  :slots (_stamp _npoints _mx _my _var ))

(defmethod laser_analysis::LaserObstacleMap
  (:init
   (&key
    ((:stamp __stamp) (instance ros::time :init))
    ((:npoints __npoints) 0)
    ((:mx __mx) 0.0)
    ((:my __my) 0.0)
    ((:var __var) 0.0)
    )
   (send-super :init)
   (setq _stamp __stamp)
   (setq _npoints (round __npoints))
   (setq _mx (float __mx))
   (setq _my (float __my))
   (setq _var (float __var))
   self)
  (:stamp
   (&optional __stamp)
   (if __stamp (setq _stamp __stamp)) _stamp)
  (:npoints
   (&optional __npoints)
   (if __npoints (setq _npoints __npoints)) _npoints)
  (:mx
   (&optional __mx)
   (if __mx (setq _mx __mx)) _mx)
  (:my
   (&optional __my)
   (if __my (setq _my __my)) _my)
  (:var
   (&optional __var)
   (if __var (setq _var __var)) _var)
  (:serialization-length
   ()
   (+
    ;; time _stamp
    8
    ;; int32 _npoints
    4
    ;; float64 _mx
    8
    ;; float64 _my
    8
    ;; float64 _var
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
     ;; float64 _mx
       (sys::poke _mx (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _my
       (sys::poke _my (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _var
       (sys::poke _var (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; time _stamp
     (send _stamp :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _stamp :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _npoints
     (setq _npoints (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float64 _mx
     (setq _mx (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _my
     (setq _my (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _var
     (setq _var (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get laser_analysis::LaserObstacleMap :md5sum-) "005f105a79e5ce59454afd0525f43586")
(setf (get laser_analysis::LaserObstacleMap :datatype-) "laser_analysis/LaserObstacleMap")
(setf (get laser_analysis::LaserObstacleMap :definition-)
      "time stamp
int32 npoints
float64 mx
float64 my
float64 var

")



(provide :laser_analysis/LaserObstacleMap "005f105a79e5ce59454afd0525f43586")



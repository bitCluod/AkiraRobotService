
(cl:in-package :asdf)

(defsystem "laser_analysis-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "LaserObstacle" :depends-on ("_package_LaserObstacle"))
    (:file "_package_LaserObstacle" :depends-on ("_package"))
    (:file "LaserObstacleMap" :depends-on ("_package_LaserObstacleMap"))
    (:file "_package_LaserObstacleMap" :depends-on ("_package"))
  ))
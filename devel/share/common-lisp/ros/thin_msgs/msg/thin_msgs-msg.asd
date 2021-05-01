
(cl:in-package :asdf)

(defsystem "thin_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "SphericalDepthCameraInfo" :depends-on ("_package_SphericalDepthCameraInfo"))
    (:file "_package_SphericalDepthCameraInfo" :depends-on ("_package"))
    (:file "SphericalDepthImage" :depends-on ("_package_SphericalDepthImage"))
    (:file "_package_SphericalDepthImage" :depends-on ("_package"))
    (:file "Ticks" :depends-on ("_package_Ticks"))
    (:file "_package_Ticks" :depends-on ("_package"))
  ))
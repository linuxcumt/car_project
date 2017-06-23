
(cl:in-package :asdf)

(defsystem "car-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :nav_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Grid" :depends-on ("_package_Grid"))
    (:file "_package_Grid" :depends-on ("_package"))
    (:file "Landmark" :depends-on ("_package_Landmark"))
    (:file "_package_Landmark" :depends-on ("_package"))
    (:file "Landmarks" :depends-on ("_package_Landmarks"))
    (:file "_package_Landmarks" :depends-on ("_package"))
    (:file "MapDense" :depends-on ("_package_MapDense"))
    (:file "_package_MapDense" :depends-on ("_package"))
    (:file "MapDenseNEW" :depends-on ("_package_MapDenseNEW"))
    (:file "_package_MapDenseNEW" :depends-on ("_package"))
    (:file "OdomVelocities" :depends-on ("_package_OdomVelocities"))
    (:file "_package_OdomVelocities" :depends-on ("_package"))
    (:file "Pose2DWithCovarianceStamped" :depends-on ("_package_Pose2DWithCovarianceStamped"))
    (:file "_package_Pose2DWithCovarianceStamped" :depends-on ("_package"))
  ))
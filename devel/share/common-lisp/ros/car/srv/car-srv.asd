
(cl:in-package :asdf)

(defsystem "car-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :car-msg
               :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "GetLandmarks" :depends-on ("_package_GetLandmarks"))
    (:file "_package_GetLandmarks" :depends-on ("_package"))
  ))
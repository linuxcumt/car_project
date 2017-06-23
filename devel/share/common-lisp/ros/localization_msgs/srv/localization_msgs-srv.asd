
(cl:in-package :asdf)

(defsystem "localization_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :localization_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "GetLandmarks" :depends-on ("_package_GetLandmarks"))
    (:file "_package_GetLandmarks" :depends-on ("_package"))
    (:file "GetSubmap" :depends-on ("_package_GetSubmap"))
    (:file "_package_GetSubmap" :depends-on ("_package"))
  ))
;; Auto-generated. Do not edit!


(when (boundp 'localization_msgs::OdomVelocities)
  (if (not (find-package "LOCALIZATION_MSGS"))
    (make-package "LOCALIZATION_MSGS"))
  (shadow 'OdomVelocities (find-package "LOCALIZATION_MSGS")))
(unless (find-package "LOCALIZATION_MSGS::ODOMVELOCITIES")
  (make-package "LOCALIZATION_MSGS::ODOMVELOCITIES"))

(in-package "ROS")
;;//! \htmlinclude OdomVelocities.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass localization_msgs::OdomVelocities
  :super ros::object
  :slots (_header _v_x _v_y _v_z _v_psi ))

(defmethod localization_msgs::OdomVelocities
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:v_x __v_x) 0.0)
    ((:v_y __v_y) 0.0)
    ((:v_z __v_z) 0.0)
    ((:v_psi __v_psi) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _v_x (float __v_x))
   (setq _v_y (float __v_y))
   (setq _v_z (float __v_z))
   (setq _v_psi (float __v_psi))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:v_x
   (&optional __v_x)
   (if __v_x (setq _v_x __v_x)) _v_x)
  (:v_y
   (&optional __v_y)
   (if __v_y (setq _v_y __v_y)) _v_y)
  (:v_z
   (&optional __v_z)
   (if __v_z (setq _v_z __v_z)) _v_z)
  (:v_psi
   (&optional __v_psi)
   (if __v_psi (setq _v_psi __v_psi)) _v_psi)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _v_x
    8
    ;; float64 _v_y
    8
    ;; float64 _v_z
    8
    ;; float64 _v_psi
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64 _v_x
       (sys::poke _v_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v_y
       (sys::poke _v_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v_z
       (sys::poke _v_z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _v_psi
       (sys::poke _v_psi (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64 _v_x
     (setq _v_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v_y
     (setq _v_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v_z
     (setq _v_z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _v_psi
     (setq _v_psi (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get localization_msgs::OdomVelocities :md5sum-) "8bc67ad8dec1074b5f1e277d263b7937")
(setf (get localization_msgs::OdomVelocities :datatype-) "localization_msgs/OdomVelocities")
(setf (get localization_msgs::OdomVelocities :definition-)
      "std_msgs/Header header
float64 v_x
float64 v_y
float64 v_z
float64 v_psi

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

")



(provide :localization_msgs/OdomVelocities "8bc67ad8dec1074b5f1e277d263b7937")



;; Auto-generated. Do not edit!


(when (boundp 'car::OdomVelocities)
  (if (not (find-package "CAR"))
    (make-package "CAR"))
  (shadow 'OdomVelocities (find-package "CAR")))
(unless (find-package "CAR::ODOMVELOCITIES")
  (make-package "CAR::ODOMVELOCITIES"))

(in-package "ROS")
;;//! \htmlinclude OdomVelocities.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass car::OdomVelocities
  :super ros::object
  :slots (_header _v_x _v_y _v_psi _noise_x _noise_y _noise_psi ))

(defmethod car::OdomVelocities
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:v_x __v_x) 0.0)
    ((:v_y __v_y) 0.0)
    ((:v_psi __v_psi) 0.0)
    ((:noise_x __noise_x) 0.0)
    ((:noise_y __noise_y) 0.0)
    ((:noise_psi __noise_psi) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _v_x (float __v_x))
   (setq _v_y (float __v_y))
   (setq _v_psi (float __v_psi))
   (setq _noise_x (float __noise_x))
   (setq _noise_y (float __noise_y))
   (setq _noise_psi (float __noise_psi))
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
  (:v_psi
   (&optional __v_psi)
   (if __v_psi (setq _v_psi __v_psi)) _v_psi)
  (:noise_x
   (&optional __noise_x)
   (if __noise_x (setq _noise_x __noise_x)) _noise_x)
  (:noise_y
   (&optional __noise_y)
   (if __noise_y (setq _noise_y __noise_y)) _noise_y)
  (:noise_psi
   (&optional __noise_psi)
   (if __noise_psi (setq _noise_psi __noise_psi)) _noise_psi)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64 _v_x
    8
    ;; float64 _v_y
    8
    ;; float64 _v_psi
    8
    ;; float64 _noise_x
    8
    ;; float64 _noise_y
    8
    ;; float64 _noise_psi
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
     ;; float64 _v_psi
       (sys::poke _v_psi (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _noise_x
       (sys::poke _noise_x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _noise_y
       (sys::poke _noise_y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _noise_psi
       (sys::poke _noise_psi (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
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
   ;; float64 _v_psi
     (setq _v_psi (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _noise_x
     (setq _noise_x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _noise_y
     (setq _noise_y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _noise_psi
     (setq _noise_psi (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get car::OdomVelocities :md5sum-) "7af9e375008818dc1ff8fe56d859f851")
(setf (get car::OdomVelocities :datatype-) "car/OdomVelocities")
(setf (get car::OdomVelocities :definition-)
      "std_msgs/Header header
float64 v_x
float64 v_y
float64 v_psi
float64 noise_x
float64 noise_y
float64 noise_psi


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



(provide :car/OdomVelocities "7af9e375008818dc1ff8fe56d859f851")



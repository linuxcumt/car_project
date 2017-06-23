;; Auto-generated. Do not edit!


(when (boundp 'localization_msgs::Landmarks)
  (if (not (find-package "LOCALIZATION_MSGS"))
    (make-package "LOCALIZATION_MSGS"))
  (shadow 'Landmarks (find-package "LOCALIZATION_MSGS")))
(unless (find-package "LOCALIZATION_MSGS::LANDMARKS")
  (make-package "LOCALIZATION_MSGS::LANDMARKS"))

(in-package "ROS")
;;//! \htmlinclude Landmarks.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass localization_msgs::Landmarks
  :super ros::object
  :slots (_header _landmarks ))

(defmethod localization_msgs::Landmarks
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:landmarks __landmarks) (let (r) (dotimes (i 0) (push (instance localization_msgs::Landmark :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _landmarks __landmarks)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:landmarks
   (&rest __landmarks)
   (if (keywordp (car __landmarks))
       (send* _landmarks __landmarks)
     (progn
       (if __landmarks (setq _landmarks (car __landmarks)))
       _landmarks)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; localization_msgs/Landmark[] _landmarks
    (apply #'+ (send-all _landmarks :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; localization_msgs/Landmark[] _landmarks
     (write-long (length _landmarks) s)
     (dolist (elem _landmarks)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; localization_msgs/Landmark[] _landmarks
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _landmarks (let (r) (dotimes (i n) (push (instance localization_msgs::Landmark :init) r)) r))
     (dolist (elem- _landmarks)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get localization_msgs::Landmarks :md5sum-) "b70aab092c9289bedf7e05ab06bfe7b1")
(setf (get localization_msgs::Landmarks :datatype-) "localization_msgs/Landmarks")
(setf (get localization_msgs::Landmarks :definition-)
      "std_msgs/Header header
Landmark[] landmarks

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

================================================================================
MSG: localization_msgs/Landmark
uint8 id
float64 pos_x
float64 pos_y
float64 pos_z

")



(provide :localization_msgs/Landmarks "b70aab092c9289bedf7e05ab06bfe7b1")



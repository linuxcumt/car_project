;; Auto-generated. Do not edit!


(when (boundp 'car::Grid)
  (if (not (find-package "CAR"))
    (make-package "CAR"))
  (shadow 'Grid (find-package "CAR")))
(unless (find-package "CAR::GRID")
  (make-package "CAR::GRID"))

(in-package "ROS")
;;//! \htmlinclude Grid.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass car::Grid
  :super ros::object
  :slots (_header _ptn_mat _width _height _resolution _outdated _origin ))

(defmethod car::Grid
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:ptn_mat __ptn_mat) (make-array 0 :initial-element 0.0 :element-type :float))
    ((:width __width) 0.0)
    ((:height __height) 0.0)
    ((:resolution __resolution) 0.0)
    ((:outdated __outdated) nil)
    ((:origin __origin) (instance geometry_msgs::Pose2D :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _ptn_mat __ptn_mat)
   (setq _width (float __width))
   (setq _height (float __height))
   (setq _resolution (float __resolution))
   (setq _outdated __outdated)
   (setq _origin __origin)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:ptn_mat
   (&optional __ptn_mat)
   (if __ptn_mat (setq _ptn_mat __ptn_mat)) _ptn_mat)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:resolution
   (&optional __resolution)
   (if __resolution (setq _resolution __resolution)) _resolution)
  (:outdated
   (&optional __outdated)
   (if __outdated (setq _outdated __outdated)) _outdated)
  (:origin
   (&rest __origin)
   (if (keywordp (car __origin))
       (send* _origin __origin)
     (progn
       (if __origin (setq _origin (car __origin)))
       _origin)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; float64[] _ptn_mat
    (* 8    (length _ptn_mat)) 4
    ;; float64 _width
    8
    ;; float64 _height
    8
    ;; float64 _resolution
    8
    ;; bool _outdated
    1
    ;; geometry_msgs/Pose2D _origin
    (send _origin :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; float64[] _ptn_mat
     (write-long (length _ptn_mat) s)
     (dotimes (i (length _ptn_mat))
       (sys::poke (elt _ptn_mat i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _width
       (sys::poke _width (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _height
       (sys::poke _height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _resolution
       (sys::poke _resolution (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _outdated
       (if _outdated (write-byte -1 s) (write-byte 0 s))
     ;; geometry_msgs/Pose2D _origin
       (send _origin :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; float64[] _ptn_mat
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ptn_mat (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _ptn_mat i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;; float64 _width
     (setq _width (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _height
     (setq _height (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _resolution
     (setq _resolution (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _outdated
     (setq _outdated (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; geometry_msgs/Pose2D _origin
     (send _origin :deserialize buf ptr-) (incf ptr- (send _origin :serialization-length))
   ;;
   self)
  )

(setf (get car::Grid :md5sum-) "d1e2733602f879b37697d7b1d81ef8ce")
(setf (get car::Grid :datatype-) "car/Grid")
(setf (get car::Grid :definition-)
      "std_msgs/Header header
float64[] ptn_mat
float64 width
float64 height
float64 resolution
bool outdated
geometry_msgs/Pose2D origin

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
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta
")



(provide :car/Grid "d1e2733602f879b37697d7b1d81ef8ce")



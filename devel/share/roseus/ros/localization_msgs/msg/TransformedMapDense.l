;; Auto-generated. Do not edit!


(when (boundp 'localization_msgs::TransformedMapDense)
  (if (not (find-package "LOCALIZATION_MSGS"))
    (make-package "LOCALIZATION_MSGS"))
  (shadow 'TransformedMapDense (find-package "LOCALIZATION_MSGS")))
(unless (find-package "LOCALIZATION_MSGS::TRANSFORMEDMAPDENSE")
  (make-package "LOCALIZATION_MSGS::TRANSFORMEDMAPDENSE"))

(in-package "ROS")
;;//! \htmlinclude TransformedMapDense.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass localization_msgs::TransformedMapDense
  :super ros::object
  :slots (_header _map _transform _valid _corr_rotation _corr_translation ))

(defmethod localization_msgs::TransformedMapDense
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:map __map) (instance localization_msgs::MapDense :init))
    ((:transform __transform) (instance localization_msgs::Pose2DWithCovarianceStamped :init))
    ((:valid __valid) nil)
    ((:corr_rotation __corr_rotation) 0.0)
    ((:corr_translation __corr_translation) 0.0)
    )
   (send-super :init)
   (setq _header __header)
   (setq _map __map)
   (setq _transform __transform)
   (setq _valid __valid)
   (setq _corr_rotation (float __corr_rotation))
   (setq _corr_translation (float __corr_translation))
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:map
   (&rest __map)
   (if (keywordp (car __map))
       (send* _map __map)
     (progn
       (if __map (setq _map (car __map)))
       _map)))
  (:transform
   (&rest __transform)
   (if (keywordp (car __transform))
       (send* _transform __transform)
     (progn
       (if __transform (setq _transform (car __transform)))
       _transform)))
  (:valid
   (&optional __valid)
   (if __valid (setq _valid __valid)) _valid)
  (:corr_rotation
   (&optional __corr_rotation)
   (if __corr_rotation (setq _corr_rotation __corr_rotation)) _corr_rotation)
  (:corr_translation
   (&optional __corr_translation)
   (if __corr_translation (setq _corr_translation __corr_translation)) _corr_translation)
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; localization_msgs/MapDense _map
    (send _map :serialization-length)
    ;; localization_msgs/Pose2DWithCovarianceStamped _transform
    (send _transform :serialization-length)
    ;; bool _valid
    1
    ;; float64 _corr_rotation
    8
    ;; float64 _corr_translation
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; localization_msgs/MapDense _map
       (send _map :serialize s)
     ;; localization_msgs/Pose2DWithCovarianceStamped _transform
       (send _transform :serialize s)
     ;; bool _valid
       (if _valid (write-byte -1 s) (write-byte 0 s))
     ;; float64 _corr_rotation
       (sys::poke _corr_rotation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _corr_translation
       (sys::poke _corr_translation (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; localization_msgs/MapDense _map
     (send _map :deserialize buf ptr-) (incf ptr- (send _map :serialization-length))
   ;; localization_msgs/Pose2DWithCovarianceStamped _transform
     (send _transform :deserialize buf ptr-) (incf ptr- (send _transform :serialization-length))
   ;; bool _valid
     (setq _valid (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float64 _corr_rotation
     (setq _corr_rotation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _corr_translation
     (setq _corr_translation (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get localization_msgs::TransformedMapDense :md5sum-) "378309153e98d7add0d6a551d203ad70")
(setf (get localization_msgs::TransformedMapDense :datatype-) "localization_msgs/TransformedMapDense")
(setf (get localization_msgs::TransformedMapDense :definition-)
      "std_msgs/Header header
localization_msgs/MapDense map
localization_msgs/Pose2DWithCovarianceStamped transform
bool valid
float64 corr_rotation
float64 corr_translation

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
MSG: localization_msgs/MapDense
nav_msgs/MapMetaData metadata
sensor_msgs/Image image
std_msgs/Bool valid

================================================================================
MSG: nav_msgs/MapMetaData
# This hold basic information about the characterists of the OccupancyGrid

# The time at which the map was loaded
time map_load_time
# The map resolution [m/cell]
float32 resolution
# Map width [cells]
uint32 width
# Map height [cells]
uint32 height
# The origin of the map [m, m, rad].  This is the real-world pose of the
# cell (0,0) in the map.
geometry_msgs/Pose origin
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: sensor_msgs/Image
# This message contains an uncompressed image
# (0, 0) is at top-left corner of image
#

Header header        # Header timestamp should be acquisition time of image
                     # Header frame_id should be optical frame of camera
                     # origin of frame should be optical center of cameara
                     # +x should point to the right in the image
                     # +y should point down in the image
                     # +z should point into to plane of the image
                     # If the frame_id here and the frame_id of the CameraInfo
                     # message associated with the image conflict
                     # the behavior is undefined

uint32 height         # image height, that is, number of rows
uint32 width          # image width, that is, number of columns

# The legal values for encoding are in file src/image_encodings.cpp
# If you want to standardize a new string format, join
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.

string encoding       # Encoding of pixels -- channel meaning, ordering, size
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h

uint8 is_bigendian    # is this data bigendian?
uint32 step           # Full row length in bytes
uint8[] data          # actual matrix data, size is (step * rows)

================================================================================
MSG: std_msgs/Bool
bool data
================================================================================
MSG: localization_msgs/Pose2DWithCovarianceStamped
std_msgs/Header header
geometry_msgs/Pose2D pose
float64[9] covariance

================================================================================
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta
")



(provide :localization_msgs/TransformedMapDense "378309153e98d7add0d6a551d203ad70")



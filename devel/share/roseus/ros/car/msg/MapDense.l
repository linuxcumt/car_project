;; Auto-generated. Do not edit!


(when (boundp 'car::MapDense)
  (if (not (find-package "CAR"))
    (make-package "CAR"))
  (shadow 'MapDense (find-package "CAR")))
(unless (find-package "CAR::MAPDENSE")
  (make-package "CAR::MAPDENSE"))

(in-package "ROS")
;;//! \htmlinclude MapDense.msg.html
(if (not (find-package "NAV_MSGS"))
  (ros::roseus-add-msgs "nav_msgs"))
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass car::MapDense
  :super ros::object
  :slots (_metadata _image _valid ))

(defmethod car::MapDense
  (:init
   (&key
    ((:metadata __metadata) (instance nav_msgs::MapMetaData :init))
    ((:image __image) (instance sensor_msgs::Image :init))
    ((:valid __valid) (instance std_msgs::Bool :init))
    )
   (send-super :init)
   (setq _metadata __metadata)
   (setq _image __image)
   (setq _valid __valid)
   self)
  (:metadata
   (&rest __metadata)
   (if (keywordp (car __metadata))
       (send* _metadata __metadata)
     (progn
       (if __metadata (setq _metadata (car __metadata)))
       _metadata)))
  (:image
   (&rest __image)
   (if (keywordp (car __image))
       (send* _image __image)
     (progn
       (if __image (setq _image (car __image)))
       _image)))
  (:valid
   (&rest __valid)
   (if (keywordp (car __valid))
       (send* _valid __valid)
     (progn
       (if __valid (setq _valid (car __valid)))
       _valid)))
  (:serialization-length
   ()
   (+
    ;; nav_msgs/MapMetaData _metadata
    (send _metadata :serialization-length)
    ;; sensor_msgs/Image _image
    (send _image :serialization-length)
    ;; std_msgs/Bool _valid
    (send _valid :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; nav_msgs/MapMetaData _metadata
       (send _metadata :serialize s)
     ;; sensor_msgs/Image _image
       (send _image :serialize s)
     ;; std_msgs/Bool _valid
       (send _valid :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; nav_msgs/MapMetaData _metadata
     (send _metadata :deserialize buf ptr-) (incf ptr- (send _metadata :serialization-length))
   ;; sensor_msgs/Image _image
     (send _image :deserialize buf ptr-) (incf ptr- (send _image :serialization-length))
   ;; std_msgs/Bool _valid
     (send _valid :deserialize buf ptr-) (incf ptr- (send _valid :serialization-length))
   ;;
   self)
  )

(setf (get car::MapDense :md5sum-) "93768b7beba1929321d13c1287623a44")
(setf (get car::MapDense :datatype-) "car/MapDense")
(setf (get car::MapDense :definition-)
      "nav_msgs/MapMetaData metadata
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
MSG: std_msgs/Bool
bool data
")



(provide :car/MapDense "93768b7beba1929321d13c1287623a44")



;; Auto-generated. Do not edit!


(when (boundp 'localization_msgs::GetSubmap)
  (if (not (find-package "LOCALIZATION_MSGS"))
    (make-package "LOCALIZATION_MSGS"))
  (shadow 'GetSubmap (find-package "LOCALIZATION_MSGS")))
(unless (find-package "LOCALIZATION_MSGS::GETSUBMAP")
  (make-package "LOCALIZATION_MSGS::GETSUBMAP"))
(unless (find-package "LOCALIZATION_MSGS::GETSUBMAPREQUEST")
  (make-package "LOCALIZATION_MSGS::GETSUBMAPREQUEST"))
(unless (find-package "LOCALIZATION_MSGS::GETSUBMAPRESPONSE")
  (make-package "LOCALIZATION_MSGS::GETSUBMAPRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))




(defclass localization_msgs::GetSubmapRequest
  :super ros::object
  :slots (_point _width _heigth ))

(defmethod localization_msgs::GetSubmapRequest
  (:init
   (&key
    ((:point __point) (instance geometry_msgs::Point :init))
    ((:width __width) (instance std_msgs::Int16 :init))
    ((:heigth __heigth) (instance std_msgs::Int16 :init))
    )
   (send-super :init)
   (setq _point __point)
   (setq _width __width)
   (setq _heigth __heigth)
   self)
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:width
   (&rest __width)
   (if (keywordp (car __width))
       (send* _width __width)
     (progn
       (if __width (setq _width (car __width)))
       _width)))
  (:heigth
   (&rest __heigth)
   (if (keywordp (car __heigth))
       (send* _heigth __heigth)
     (progn
       (if __heigth (setq _heigth (car __heigth)))
       _heigth)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _point
    (send _point :serialization-length)
    ;; std_msgs/Int16 _width
    (send _width :serialization-length)
    ;; std_msgs/Int16 _heigth
    (send _heigth :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _point
       (send _point :serialize s)
     ;; std_msgs/Int16 _width
       (send _width :serialize s)
     ;; std_msgs/Int16 _heigth
       (send _heigth :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;; std_msgs/Int16 _width
     (send _width :deserialize buf ptr-) (incf ptr- (send _width :serialization-length))
   ;; std_msgs/Int16 _heigth
     (send _heigth :deserialize buf ptr-) (incf ptr- (send _heigth :serialization-length))
   ;;
   self)
  )

(defclass localization_msgs::GetSubmapResponse
  :super ros::object
  :slots (_map ))

(defmethod localization_msgs::GetSubmapResponse
  (:init
   (&key
    ((:map __map) (instance localization_msgs::MapDense :init))
    )
   (send-super :init)
   (setq _map __map)
   self)
  (:map
   (&rest __map)
   (if (keywordp (car __map))
       (send* _map __map)
     (progn
       (if __map (setq _map (car __map)))
       _map)))
  (:serialization-length
   ()
   (+
    ;; localization_msgs/MapDense _map
    (send _map :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; localization_msgs/MapDense _map
       (send _map :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; localization_msgs/MapDense _map
     (send _map :deserialize buf ptr-) (incf ptr- (send _map :serialization-length))
   ;;
   self)
  )

(defclass localization_msgs::GetSubmap
  :super ros::object
  :slots ())

(setf (get localization_msgs::GetSubmap :md5sum-) "b8ce830ca82ddecffafefce693d0137e")
(setf (get localization_msgs::GetSubmap :datatype-) "localization_msgs/GetSubmap")
(setf (get localization_msgs::GetSubmap :request) localization_msgs::GetSubmapRequest)
(setf (get localization_msgs::GetSubmap :response) localization_msgs::GetSubmapResponse)

(defmethod localization_msgs::GetSubmapRequest
  (:response () (instance localization_msgs::GetSubmapResponse :init)))

(setf (get localization_msgs::GetSubmapRequest :md5sum-) "b8ce830ca82ddecffafefce693d0137e")
(setf (get localization_msgs::GetSubmapRequest :datatype-) "localization_msgs/GetSubmapRequest")
(setf (get localization_msgs::GetSubmapRequest :definition-)
      "geometry_msgs/Point point
std_msgs/Int16 width
std_msgs/Int16 heigth

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: std_msgs/Int16
int16 data
---
localization_msgs/MapDense map




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
")

(setf (get localization_msgs::GetSubmapResponse :md5sum-) "b8ce830ca82ddecffafefce693d0137e")
(setf (get localization_msgs::GetSubmapResponse :datatype-) "localization_msgs/GetSubmapResponse")
(setf (get localization_msgs::GetSubmapResponse :definition-)
      "geometry_msgs/Point point
std_msgs/Int16 width
std_msgs/Int16 heigth

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: std_msgs/Int16
int16 data
---
localization_msgs/MapDense map




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
")



(provide :localization_msgs/GetSubmap "b8ce830ca82ddecffafefce693d0137e")



; Auto-generated. Do not edit!


(cl:in-package localization_msgs-srv)


;//! \htmlinclude GetSubmap-request.msg.html

(cl:defclass <GetSubmap-request> (roslisp-msg-protocol:ros-message)
  ((point
    :reader point
    :initarg :point
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (width
    :reader width
    :initarg :width
    :type std_msgs-msg:Int16
    :initform (cl:make-instance 'std_msgs-msg:Int16))
   (heigth
    :reader heigth
    :initarg :heigth
    :type std_msgs-msg:Int16
    :initform (cl:make-instance 'std_msgs-msg:Int16)))
)

(cl:defclass GetSubmap-request (<GetSubmap-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetSubmap-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetSubmap-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name localization_msgs-srv:<GetSubmap-request> is deprecated: use localization_msgs-srv:GetSubmap-request instead.")))

(cl:ensure-generic-function 'point-val :lambda-list '(m))
(cl:defmethod point-val ((m <GetSubmap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-srv:point-val is deprecated.  Use localization_msgs-srv:point instead.")
  (point m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <GetSubmap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-srv:width-val is deprecated.  Use localization_msgs-srv:width instead.")
  (width m))

(cl:ensure-generic-function 'heigth-val :lambda-list '(m))
(cl:defmethod heigth-val ((m <GetSubmap-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-srv:heigth-val is deprecated.  Use localization_msgs-srv:heigth instead.")
  (heigth m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetSubmap-request>) ostream)
  "Serializes a message object of type '<GetSubmap-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'point) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'width) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'heigth) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetSubmap-request>) istream)
  "Deserializes a message object of type '<GetSubmap-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'point) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'width) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'heigth) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetSubmap-request>)))
  "Returns string type for a service object of type '<GetSubmap-request>"
  "localization_msgs/GetSubmapRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSubmap-request)))
  "Returns string type for a service object of type 'GetSubmap-request"
  "localization_msgs/GetSubmapRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetSubmap-request>)))
  "Returns md5sum for a message object of type '<GetSubmap-request>"
  "b8ce830ca82ddecffafefce693d0137e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSubmap-request)))
  "Returns md5sum for a message object of type 'GetSubmap-request"
  "b8ce830ca82ddecffafefce693d0137e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetSubmap-request>)))
  "Returns full string definition for message of type '<GetSubmap-request>"
  (cl:format cl:nil "geometry_msgs/Point point~%std_msgs/Int16 width~%std_msgs/Int16 heigth~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: std_msgs/Int16~%int16 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetSubmap-request)))
  "Returns full string definition for message of type 'GetSubmap-request"
  (cl:format cl:nil "geometry_msgs/Point point~%std_msgs/Int16 width~%std_msgs/Int16 heigth~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: std_msgs/Int16~%int16 data~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetSubmap-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'point))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'width))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'heigth))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetSubmap-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetSubmap-request
    (cl:cons ':point (point msg))
    (cl:cons ':width (width msg))
    (cl:cons ':heigth (heigth msg))
))
;//! \htmlinclude GetSubmap-response.msg.html

(cl:defclass <GetSubmap-response> (roslisp-msg-protocol:ros-message)
  ((map
    :reader map
    :initarg :map
    :type localization_msgs-msg:MapDense
    :initform (cl:make-instance 'localization_msgs-msg:MapDense)))
)

(cl:defclass GetSubmap-response (<GetSubmap-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetSubmap-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetSubmap-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name localization_msgs-srv:<GetSubmap-response> is deprecated: use localization_msgs-srv:GetSubmap-response instead.")))

(cl:ensure-generic-function 'map-val :lambda-list '(m))
(cl:defmethod map-val ((m <GetSubmap-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-srv:map-val is deprecated.  Use localization_msgs-srv:map instead.")
  (map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetSubmap-response>) ostream)
  "Serializes a message object of type '<GetSubmap-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'map) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetSubmap-response>) istream)
  "Deserializes a message object of type '<GetSubmap-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'map) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetSubmap-response>)))
  "Returns string type for a service object of type '<GetSubmap-response>"
  "localization_msgs/GetSubmapResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSubmap-response)))
  "Returns string type for a service object of type 'GetSubmap-response"
  "localization_msgs/GetSubmapResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetSubmap-response>)))
  "Returns md5sum for a message object of type '<GetSubmap-response>"
  "b8ce830ca82ddecffafefce693d0137e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetSubmap-response)))
  "Returns md5sum for a message object of type 'GetSubmap-response"
  "b8ce830ca82ddecffafefce693d0137e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetSubmap-response>)))
  "Returns full string definition for message of type '<GetSubmap-response>"
  (cl:format cl:nil "localization_msgs/MapDense map~%~%~%~%~%================================================================================~%MSG: localization_msgs/MapDense~%nav_msgs/MapMetaData metadata~%sensor_msgs/Image image~%std_msgs/Bool valid~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetSubmap-response)))
  "Returns full string definition for message of type 'GetSubmap-response"
  (cl:format cl:nil "localization_msgs/MapDense map~%~%~%~%~%================================================================================~%MSG: localization_msgs/MapDense~%nav_msgs/MapMetaData metadata~%sensor_msgs/Image image~%std_msgs/Bool valid~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetSubmap-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'map))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetSubmap-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetSubmap-response
    (cl:cons ':map (map msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetSubmap)))
  'GetSubmap-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetSubmap)))
  'GetSubmap-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetSubmap)))
  "Returns string type for a service object of type '<GetSubmap>"
  "localization_msgs/GetSubmap")
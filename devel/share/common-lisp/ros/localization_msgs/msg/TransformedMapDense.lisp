; Auto-generated. Do not edit!


(cl:in-package localization_msgs-msg)


;//! \htmlinclude TransformedMapDense.msg.html

(cl:defclass <TransformedMapDense> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (map
    :reader map
    :initarg :map
    :type localization_msgs-msg:MapDense
    :initform (cl:make-instance 'localization_msgs-msg:MapDense))
   (transform
    :reader transform
    :initarg :transform
    :type localization_msgs-msg:Pose2DWithCovarianceStamped
    :initform (cl:make-instance 'localization_msgs-msg:Pose2DWithCovarianceStamped))
   (valid
    :reader valid
    :initarg :valid
    :type cl:boolean
    :initform cl:nil)
   (corr_rotation
    :reader corr_rotation
    :initarg :corr_rotation
    :type cl:float
    :initform 0.0)
   (corr_translation
    :reader corr_translation
    :initarg :corr_translation
    :type cl:float
    :initform 0.0))
)

(cl:defclass TransformedMapDense (<TransformedMapDense>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TransformedMapDense>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TransformedMapDense)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name localization_msgs-msg:<TransformedMapDense> is deprecated: use localization_msgs-msg:TransformedMapDense instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <TransformedMapDense>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-msg:header-val is deprecated.  Use localization_msgs-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'map-val :lambda-list '(m))
(cl:defmethod map-val ((m <TransformedMapDense>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-msg:map-val is deprecated.  Use localization_msgs-msg:map instead.")
  (map m))

(cl:ensure-generic-function 'transform-val :lambda-list '(m))
(cl:defmethod transform-val ((m <TransformedMapDense>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-msg:transform-val is deprecated.  Use localization_msgs-msg:transform instead.")
  (transform m))

(cl:ensure-generic-function 'valid-val :lambda-list '(m))
(cl:defmethod valid-val ((m <TransformedMapDense>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-msg:valid-val is deprecated.  Use localization_msgs-msg:valid instead.")
  (valid m))

(cl:ensure-generic-function 'corr_rotation-val :lambda-list '(m))
(cl:defmethod corr_rotation-val ((m <TransformedMapDense>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-msg:corr_rotation-val is deprecated.  Use localization_msgs-msg:corr_rotation instead.")
  (corr_rotation m))

(cl:ensure-generic-function 'corr_translation-val :lambda-list '(m))
(cl:defmethod corr_translation-val ((m <TransformedMapDense>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader localization_msgs-msg:corr_translation-val is deprecated.  Use localization_msgs-msg:corr_translation instead.")
  (corr_translation m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TransformedMapDense>) ostream)
  "Serializes a message object of type '<TransformedMapDense>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'map) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'transform) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'valid) 1 0)) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'corr_rotation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'corr_translation))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TransformedMapDense>) istream)
  "Deserializes a message object of type '<TransformedMapDense>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'map) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'transform) istream)
    (cl:setf (cl:slot-value msg 'valid) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'corr_rotation) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'corr_translation) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TransformedMapDense>)))
  "Returns string type for a message object of type '<TransformedMapDense>"
  "localization_msgs/TransformedMapDense")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TransformedMapDense)))
  "Returns string type for a message object of type 'TransformedMapDense"
  "localization_msgs/TransformedMapDense")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TransformedMapDense>)))
  "Returns md5sum for a message object of type '<TransformedMapDense>"
  "378309153e98d7add0d6a551d203ad70")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TransformedMapDense)))
  "Returns md5sum for a message object of type 'TransformedMapDense"
  "378309153e98d7add0d6a551d203ad70")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TransformedMapDense>)))
  "Returns full string definition for message of type '<TransformedMapDense>"
  (cl:format cl:nil "std_msgs/Header header~%localization_msgs/MapDense map~%localization_msgs/Pose2DWithCovarianceStamped transform~%bool valid~%float64 corr_rotation~%float64 corr_translation~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: localization_msgs/MapDense~%nav_msgs/MapMetaData metadata~%sensor_msgs/Image image~%std_msgs/Bool valid~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%================================================================================~%MSG: localization_msgs/Pose2DWithCovarianceStamped~%std_msgs/Header header~%geometry_msgs/Pose2D pose~%float64[9] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TransformedMapDense)))
  "Returns full string definition for message of type 'TransformedMapDense"
  (cl:format cl:nil "std_msgs/Header header~%localization_msgs/MapDense map~%localization_msgs/Pose2DWithCovarianceStamped transform~%bool valid~%float64 corr_rotation~%float64 corr_translation~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: localization_msgs/MapDense~%nav_msgs/MapMetaData metadata~%sensor_msgs/Image image~%std_msgs/Bool valid~%~%================================================================================~%MSG: nav_msgs/MapMetaData~%# This hold basic information about the characterists of the OccupancyGrid~%~%# The time at which the map was loaded~%time map_load_time~%# The map resolution [m/cell]~%float32 resolution~%# Map width [cells]~%uint32 width~%# Map height [cells]~%uint32 height~%# The origin of the map [m, m, rad].  This is the real-world pose of the~%# cell (0,0) in the map.~%geometry_msgs/Pose origin~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: sensor_msgs/Image~%# This message contains an uncompressed image~%# (0, 0) is at top-left corner of image~%#~%~%Header header        # Header timestamp should be acquisition time of image~%                     # Header frame_id should be optical frame of camera~%                     # origin of frame should be optical center of cameara~%                     # +x should point to the right in the image~%                     # +y should point down in the image~%                     # +z should point into to plane of the image~%                     # If the frame_id here and the frame_id of the CameraInfo~%                     # message associated with the image conflict~%                     # the behavior is undefined~%~%uint32 height         # image height, that is, number of rows~%uint32 width          # image width, that is, number of columns~%~%# The legal values for encoding are in file src/image_encodings.cpp~%# If you want to standardize a new string format, join~%# ros-users@lists.sourceforge.net and send an email proposing a new encoding.~%~%string encoding       # Encoding of pixels -- channel meaning, ordering, size~%                      # taken from the list of strings in include/sensor_msgs/image_encodings.h~%~%uint8 is_bigendian    # is this data bigendian?~%uint32 step           # Full row length in bytes~%uint8[] data          # actual matrix data, size is (step * rows)~%~%================================================================================~%MSG: std_msgs/Bool~%bool data~%================================================================================~%MSG: localization_msgs/Pose2DWithCovarianceStamped~%std_msgs/Header header~%geometry_msgs/Pose2D pose~%float64[9] covariance~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TransformedMapDense>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'map))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'transform))
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TransformedMapDense>))
  "Converts a ROS message object to a list"
  (cl:list 'TransformedMapDense
    (cl:cons ':header (header msg))
    (cl:cons ':map (map msg))
    (cl:cons ':transform (transform msg))
    (cl:cons ':valid (valid msg))
    (cl:cons ':corr_rotation (corr_rotation msg))
    (cl:cons ':corr_translation (corr_translation msg))
))

// Auto-generated. Do not edit!

// (in-package localization_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let MapDense = require('./MapDense.js');
let Pose2DWithCovarianceStamped = require('./Pose2DWithCovarianceStamped.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class TransformedMapDense {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.map = null;
      this.transform = null;
      this.valid = null;
      this.corr_rotation = null;
      this.corr_translation = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('map')) {
        this.map = initObj.map
      }
      else {
        this.map = new MapDense();
      }
      if (initObj.hasOwnProperty('transform')) {
        this.transform = initObj.transform
      }
      else {
        this.transform = new Pose2DWithCovarianceStamped();
      }
      if (initObj.hasOwnProperty('valid')) {
        this.valid = initObj.valid
      }
      else {
        this.valid = false;
      }
      if (initObj.hasOwnProperty('corr_rotation')) {
        this.corr_rotation = initObj.corr_rotation
      }
      else {
        this.corr_rotation = 0.0;
      }
      if (initObj.hasOwnProperty('corr_translation')) {
        this.corr_translation = initObj.corr_translation
      }
      else {
        this.corr_translation = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TransformedMapDense
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [map]
    bufferOffset = MapDense.serialize(obj.map, buffer, bufferOffset);
    // Serialize message field [transform]
    bufferOffset = Pose2DWithCovarianceStamped.serialize(obj.transform, buffer, bufferOffset);
    // Serialize message field [valid]
    bufferOffset = _serializer.bool(obj.valid, buffer, bufferOffset);
    // Serialize message field [corr_rotation]
    bufferOffset = _serializer.float64(obj.corr_rotation, buffer, bufferOffset);
    // Serialize message field [corr_translation]
    bufferOffset = _serializer.float64(obj.corr_translation, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TransformedMapDense
    let len;
    let data = new TransformedMapDense(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [map]
    data.map = MapDense.deserialize(buffer, bufferOffset);
    // Deserialize message field [transform]
    data.transform = Pose2DWithCovarianceStamped.deserialize(buffer, bufferOffset);
    // Deserialize message field [valid]
    data.valid = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [corr_rotation]
    data.corr_rotation = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [corr_translation]
    data.corr_translation = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += MapDense.getMessageSize(object.map);
    length += Pose2DWithCovarianceStamped.getMessageSize(object.transform);
    return length + 17;
  }

  static datatype() {
    // Returns string type for a message object
    return 'localization_msgs/TransformedMapDense';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '378309153e98d7add0d6a551d203ad70';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
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
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TransformedMapDense(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.map !== undefined) {
      resolved.map = MapDense.Resolve(msg.map)
    }
    else {
      resolved.map = new MapDense()
    }

    if (msg.transform !== undefined) {
      resolved.transform = Pose2DWithCovarianceStamped.Resolve(msg.transform)
    }
    else {
      resolved.transform = new Pose2DWithCovarianceStamped()
    }

    if (msg.valid !== undefined) {
      resolved.valid = msg.valid;
    }
    else {
      resolved.valid = false
    }

    if (msg.corr_rotation !== undefined) {
      resolved.corr_rotation = msg.corr_rotation;
    }
    else {
      resolved.corr_rotation = 0.0
    }

    if (msg.corr_translation !== undefined) {
      resolved.corr_translation = msg.corr_translation;
    }
    else {
      resolved.corr_translation = 0.0
    }

    return resolved;
    }
};

module.exports = TransformedMapDense;

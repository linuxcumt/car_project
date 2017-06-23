// Auto-generated. Do not edit!

// (in-package car.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class OdomVelocities {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.v_x = null;
      this.v_y = null;
      this.v_psi = null;
      this.noise_x = null;
      this.noise_y = null;
      this.noise_psi = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('v_x')) {
        this.v_x = initObj.v_x
      }
      else {
        this.v_x = 0.0;
      }
      if (initObj.hasOwnProperty('v_y')) {
        this.v_y = initObj.v_y
      }
      else {
        this.v_y = 0.0;
      }
      if (initObj.hasOwnProperty('v_psi')) {
        this.v_psi = initObj.v_psi
      }
      else {
        this.v_psi = 0.0;
      }
      if (initObj.hasOwnProperty('noise_x')) {
        this.noise_x = initObj.noise_x
      }
      else {
        this.noise_x = 0.0;
      }
      if (initObj.hasOwnProperty('noise_y')) {
        this.noise_y = initObj.noise_y
      }
      else {
        this.noise_y = 0.0;
      }
      if (initObj.hasOwnProperty('noise_psi')) {
        this.noise_psi = initObj.noise_psi
      }
      else {
        this.noise_psi = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OdomVelocities
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [v_x]
    bufferOffset = _serializer.float64(obj.v_x, buffer, bufferOffset);
    // Serialize message field [v_y]
    bufferOffset = _serializer.float64(obj.v_y, buffer, bufferOffset);
    // Serialize message field [v_psi]
    bufferOffset = _serializer.float64(obj.v_psi, buffer, bufferOffset);
    // Serialize message field [noise_x]
    bufferOffset = _serializer.float64(obj.noise_x, buffer, bufferOffset);
    // Serialize message field [noise_y]
    bufferOffset = _serializer.float64(obj.noise_y, buffer, bufferOffset);
    // Serialize message field [noise_psi]
    bufferOffset = _serializer.float64(obj.noise_psi, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OdomVelocities
    let len;
    let data = new OdomVelocities(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [v_x]
    data.v_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [v_y]
    data.v_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [v_psi]
    data.v_psi = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [noise_x]
    data.noise_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [noise_y]
    data.noise_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [noise_psi]
    data.noise_psi = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'car/OdomVelocities';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7af9e375008818dc1ff8fe56d859f851';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OdomVelocities(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.v_x !== undefined) {
      resolved.v_x = msg.v_x;
    }
    else {
      resolved.v_x = 0.0
    }

    if (msg.v_y !== undefined) {
      resolved.v_y = msg.v_y;
    }
    else {
      resolved.v_y = 0.0
    }

    if (msg.v_psi !== undefined) {
      resolved.v_psi = msg.v_psi;
    }
    else {
      resolved.v_psi = 0.0
    }

    if (msg.noise_x !== undefined) {
      resolved.noise_x = msg.noise_x;
    }
    else {
      resolved.noise_x = 0.0
    }

    if (msg.noise_y !== undefined) {
      resolved.noise_y = msg.noise_y;
    }
    else {
      resolved.noise_y = 0.0
    }

    if (msg.noise_psi !== undefined) {
      resolved.noise_psi = msg.noise_psi;
    }
    else {
      resolved.noise_psi = 0.0
    }

    return resolved;
    }
};

module.exports = OdomVelocities;

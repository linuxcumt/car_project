// Auto-generated. Do not edit!

// (in-package car.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

let Landmark = require('../msg/Landmark.js');

//-----------------------------------------------------------

class GetLandmarksRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.point = null;
      this.width_meter = null;
      this.heigth_meter = null;
    }
    else {
      if (initObj.hasOwnProperty('point')) {
        this.point = initObj.point
      }
      else {
        this.point = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('width_meter')) {
        this.width_meter = initObj.width_meter
      }
      else {
        this.width_meter = new std_msgs.msg.Float64();
      }
      if (initObj.hasOwnProperty('heigth_meter')) {
        this.heigth_meter = initObj.heigth_meter
      }
      else {
        this.heigth_meter = new std_msgs.msg.Float64();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetLandmarksRequest
    // Serialize message field [point]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.point, buffer, bufferOffset);
    // Serialize message field [width_meter]
    bufferOffset = std_msgs.msg.Float64.serialize(obj.width_meter, buffer, bufferOffset);
    // Serialize message field [heigth_meter]
    bufferOffset = std_msgs.msg.Float64.serialize(obj.heigth_meter, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetLandmarksRequest
    let len;
    let data = new GetLandmarksRequest(null);
    // Deserialize message field [point]
    data.point = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [width_meter]
    data.width_meter = std_msgs.msg.Float64.deserialize(buffer, bufferOffset);
    // Deserialize message field [heigth_meter]
    data.heigth_meter = std_msgs.msg.Float64.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 40;
  }

  static datatype() {
    // Returns string type for a service object
    return 'car/GetLandmarksRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'df1dcb97700423fef9fc16d14781286a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point point
    std_msgs/Float64 width_meter
    std_msgs/Float64 heigth_meter
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: std_msgs/Float64
    float64 data
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetLandmarksRequest(null);
    if (msg.point !== undefined) {
      resolved.point = geometry_msgs.msg.Point.Resolve(msg.point)
    }
    else {
      resolved.point = new geometry_msgs.msg.Point()
    }

    if (msg.width_meter !== undefined) {
      resolved.width_meter = std_msgs.msg.Float64.Resolve(msg.width_meter)
    }
    else {
      resolved.width_meter = new std_msgs.msg.Float64()
    }

    if (msg.heigth_meter !== undefined) {
      resolved.heigth_meter = std_msgs.msg.Float64.Resolve(msg.heigth_meter)
    }
    else {
      resolved.heigth_meter = new std_msgs.msg.Float64()
    }

    return resolved;
    }
};

class GetLandmarksResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.landmarks = null;
    }
    else {
      if (initObj.hasOwnProperty('landmarks')) {
        this.landmarks = initObj.landmarks
      }
      else {
        this.landmarks = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetLandmarksResponse
    // Serialize message field [landmarks]
    // Serialize the length for message field [landmarks]
    bufferOffset = _serializer.uint32(obj.landmarks.length, buffer, bufferOffset);
    obj.landmarks.forEach((val) => {
      bufferOffset = Landmark.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetLandmarksResponse
    let len;
    let data = new GetLandmarksResponse(null);
    // Deserialize message field [landmarks]
    // Deserialize array length for message field [landmarks]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.landmarks = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.landmarks[i] = Landmark.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 25 * object.landmarks.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'car/GetLandmarksResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c78469eba290d53592188bb13a0b4de0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Landmark[] landmarks
    
    
    
    
    ================================================================================
    MSG: car/Landmark
    uint8 id
    float64 pos_x
    float64 pos_y
    float64 pos_z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetLandmarksResponse(null);
    if (msg.landmarks !== undefined) {
      resolved.landmarks = new Array(msg.landmarks.length);
      for (let i = 0; i < resolved.landmarks.length; ++i) {
        resolved.landmarks[i] = Landmark.Resolve(msg.landmarks[i]);
      }
    }
    else {
      resolved.landmarks = []
    }

    return resolved;
    }
};

module.exports = {
  Request: GetLandmarksRequest,
  Response: GetLandmarksResponse,
  md5sum() { return '06cc287e6db3b6bdd1132d19203493c2'; },
  datatype() { return 'car/GetLandmarks'; }
};

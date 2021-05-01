// Auto-generated. Do not edit!

// (in-package laser_analysis.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class LaserObstacle {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.stamp = null;
      this.npoints = null;
      this.mindist = null;
      this.y1 = null;
      this.y2 = null;
    }
    else {
      if (initObj.hasOwnProperty('stamp')) {
        this.stamp = initObj.stamp
      }
      else {
        this.stamp = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('npoints')) {
        this.npoints = initObj.npoints
      }
      else {
        this.npoints = 0;
      }
      if (initObj.hasOwnProperty('mindist')) {
        this.mindist = initObj.mindist
      }
      else {
        this.mindist = 0.0;
      }
      if (initObj.hasOwnProperty('y1')) {
        this.y1 = initObj.y1
      }
      else {
        this.y1 = 0.0;
      }
      if (initObj.hasOwnProperty('y2')) {
        this.y2 = initObj.y2
      }
      else {
        this.y2 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type LaserObstacle
    // Serialize message field [stamp]
    bufferOffset = _serializer.time(obj.stamp, buffer, bufferOffset);
    // Serialize message field [npoints]
    bufferOffset = _serializer.int32(obj.npoints, buffer, bufferOffset);
    // Serialize message field [mindist]
    bufferOffset = _serializer.float64(obj.mindist, buffer, bufferOffset);
    // Serialize message field [y1]
    bufferOffset = _serializer.float64(obj.y1, buffer, bufferOffset);
    // Serialize message field [y2]
    bufferOffset = _serializer.float64(obj.y2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type LaserObstacle
    let len;
    let data = new LaserObstacle(null);
    // Deserialize message field [stamp]
    data.stamp = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [npoints]
    data.npoints = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [mindist]
    data.mindist = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y1]
    data.y1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [y2]
    data.y2 = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 36;
  }

  static datatype() {
    // Returns string type for a message object
    return 'laser_analysis/LaserObstacle';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ee9cd1755859dc1d90f8adb4433b5b03';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time stamp
    int32 npoints
    float64 mindist
    float64 y1
    float64 y2
    
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new LaserObstacle(null);
    if (msg.stamp !== undefined) {
      resolved.stamp = msg.stamp;
    }
    else {
      resolved.stamp = {secs: 0, nsecs: 0}
    }

    if (msg.npoints !== undefined) {
      resolved.npoints = msg.npoints;
    }
    else {
      resolved.npoints = 0
    }

    if (msg.mindist !== undefined) {
      resolved.mindist = msg.mindist;
    }
    else {
      resolved.mindist = 0.0
    }

    if (msg.y1 !== undefined) {
      resolved.y1 = msg.y1;
    }
    else {
      resolved.y1 = 0.0
    }

    if (msg.y2 !== undefined) {
      resolved.y2 = msg.y2;
    }
    else {
      resolved.y2 = 0.0
    }

    return resolved;
    }
};

module.exports = LaserObstacle;

// Auto-generated. Do not edit!

// (in-package thin_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SphericalDepthCameraInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.horizontal_fov = null;
      this.vertical_fov = null;
      this.horizontal_resolution = null;
      this.vertical_resolution = null;
      this.max_range = null;
      this.min_range = null;
      this.depth_quantization = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('horizontal_fov')) {
        this.horizontal_fov = initObj.horizontal_fov
      }
      else {
        this.horizontal_fov = 0.0;
      }
      if (initObj.hasOwnProperty('vertical_fov')) {
        this.vertical_fov = initObj.vertical_fov
      }
      else {
        this.vertical_fov = 0.0;
      }
      if (initObj.hasOwnProperty('horizontal_resolution')) {
        this.horizontal_resolution = initObj.horizontal_resolution
      }
      else {
        this.horizontal_resolution = 0.0;
      }
      if (initObj.hasOwnProperty('vertical_resolution')) {
        this.vertical_resolution = initObj.vertical_resolution
      }
      else {
        this.vertical_resolution = 0.0;
      }
      if (initObj.hasOwnProperty('max_range')) {
        this.max_range = initObj.max_range
      }
      else {
        this.max_range = 0.0;
      }
      if (initObj.hasOwnProperty('min_range')) {
        this.min_range = initObj.min_range
      }
      else {
        this.min_range = 0.0;
      }
      if (initObj.hasOwnProperty('depth_quantization')) {
        this.depth_quantization = initObj.depth_quantization
      }
      else {
        this.depth_quantization = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SphericalDepthCameraInfo
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [horizontal_fov]
    bufferOffset = _serializer.float64(obj.horizontal_fov, buffer, bufferOffset);
    // Serialize message field [vertical_fov]
    bufferOffset = _serializer.float64(obj.vertical_fov, buffer, bufferOffset);
    // Serialize message field [horizontal_resolution]
    bufferOffset = _serializer.float64(obj.horizontal_resolution, buffer, bufferOffset);
    // Serialize message field [vertical_resolution]
    bufferOffset = _serializer.float64(obj.vertical_resolution, buffer, bufferOffset);
    // Serialize message field [max_range]
    bufferOffset = _serializer.float64(obj.max_range, buffer, bufferOffset);
    // Serialize message field [min_range]
    bufferOffset = _serializer.float64(obj.min_range, buffer, bufferOffset);
    // Serialize message field [depth_quantization]
    bufferOffset = _serializer.float64(obj.depth_quantization, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SphericalDepthCameraInfo
    let len;
    let data = new SphericalDepthCameraInfo(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [horizontal_fov]
    data.horizontal_fov = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vertical_fov]
    data.vertical_fov = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [horizontal_resolution]
    data.horizontal_resolution = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [vertical_resolution]
    data.vertical_resolution = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [max_range]
    data.max_range = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [min_range]
    data.min_range = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [depth_quantization]
    data.depth_quantization = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'thin_msgs/SphericalDepthCameraInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c75aa0007bfd3792f8186edb932d7d9a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    float64 horizontal_fov
    float64 vertical_fov
    float64 horizontal_resolution
    float64 vertical_resolution
    float64 max_range
    float64 min_range
    float64 depth_quantization 
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
    const resolved = new SphericalDepthCameraInfo(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.horizontal_fov !== undefined) {
      resolved.horizontal_fov = msg.horizontal_fov;
    }
    else {
      resolved.horizontal_fov = 0.0
    }

    if (msg.vertical_fov !== undefined) {
      resolved.vertical_fov = msg.vertical_fov;
    }
    else {
      resolved.vertical_fov = 0.0
    }

    if (msg.horizontal_resolution !== undefined) {
      resolved.horizontal_resolution = msg.horizontal_resolution;
    }
    else {
      resolved.horizontal_resolution = 0.0
    }

    if (msg.vertical_resolution !== undefined) {
      resolved.vertical_resolution = msg.vertical_resolution;
    }
    else {
      resolved.vertical_resolution = 0.0
    }

    if (msg.max_range !== undefined) {
      resolved.max_range = msg.max_range;
    }
    else {
      resolved.max_range = 0.0
    }

    if (msg.min_range !== undefined) {
      resolved.min_range = msg.min_range;
    }
    else {
      resolved.min_range = 0.0
    }

    if (msg.depth_quantization !== undefined) {
      resolved.depth_quantization = msg.depth_quantization;
    }
    else {
      resolved.depth_quantization = 0.0
    }

    return resolved;
    }
};

module.exports = SphericalDepthCameraInfo;

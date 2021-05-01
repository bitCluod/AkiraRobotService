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

class Ticks {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.leftEncoder = null;
      this.rightEncoder = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('leftEncoder')) {
        this.leftEncoder = initObj.leftEncoder
      }
      else {
        this.leftEncoder = 0;
      }
      if (initObj.hasOwnProperty('rightEncoder')) {
        this.rightEncoder = initObj.rightEncoder
      }
      else {
        this.rightEncoder = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Ticks
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [leftEncoder]
    bufferOffset = _serializer.uint16(obj.leftEncoder, buffer, bufferOffset);
    // Serialize message field [rightEncoder]
    bufferOffset = _serializer.uint16(obj.rightEncoder, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Ticks
    let len;
    let data = new Ticks(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [leftEncoder]
    data.leftEncoder = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [rightEncoder]
    data.rightEncoder = _deserializer.uint16(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'thin_msgs/Ticks';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1154acdbb0e0a739326e90742bcd794e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Header header
    uint16 leftEncoder
    uint16 rightEncoder
    
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
    const resolved = new Ticks(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.leftEncoder !== undefined) {
      resolved.leftEncoder = msg.leftEncoder;
    }
    else {
      resolved.leftEncoder = 0
    }

    if (msg.rightEncoder !== undefined) {
      resolved.rightEncoder = msg.rightEncoder;
    }
    else {
      resolved.rightEncoder = 0
    }

    return resolved;
    }
};

module.exports = Ticks;

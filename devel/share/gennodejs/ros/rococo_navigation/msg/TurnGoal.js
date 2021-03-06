// Auto-generated. Do not edit!

// (in-package rococo_navigation.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class TurnGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.target_angle = null;
      this.absolute_relative_flag = null;
      this.max_ang_vel = null;
    }
    else {
      if (initObj.hasOwnProperty('target_angle')) {
        this.target_angle = initObj.target_angle
      }
      else {
        this.target_angle = 0.0;
      }
      if (initObj.hasOwnProperty('absolute_relative_flag')) {
        this.absolute_relative_flag = initObj.absolute_relative_flag
      }
      else {
        this.absolute_relative_flag = '';
      }
      if (initObj.hasOwnProperty('max_ang_vel')) {
        this.max_ang_vel = initObj.max_ang_vel
      }
      else {
        this.max_ang_vel = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TurnGoal
    // Serialize message field [target_angle]
    bufferOffset = _serializer.float32(obj.target_angle, buffer, bufferOffset);
    // Serialize message field [absolute_relative_flag]
    bufferOffset = _serializer.string(obj.absolute_relative_flag, buffer, bufferOffset);
    // Serialize message field [max_ang_vel]
    bufferOffset = _serializer.float32(obj.max_ang_vel, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TurnGoal
    let len;
    let data = new TurnGoal(null);
    // Deserialize message field [target_angle]
    data.target_angle = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [absolute_relative_flag]
    data.absolute_relative_flag = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [max_ang_vel]
    data.max_ang_vel = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.absolute_relative_flag.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rococo_navigation/TurnGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6590b572f5a90e57b737335d6531bce7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    # Goal
    # target_angle [DEG] 
    float32 target_angle
    # flag ABS/REL
    string absolute_relative_flag
    # max angular velocity [DEG/s]
    float32 max_ang_vel
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TurnGoal(null);
    if (msg.target_angle !== undefined) {
      resolved.target_angle = msg.target_angle;
    }
    else {
      resolved.target_angle = 0.0
    }

    if (msg.absolute_relative_flag !== undefined) {
      resolved.absolute_relative_flag = msg.absolute_relative_flag;
    }
    else {
      resolved.absolute_relative_flag = ''
    }

    if (msg.max_ang_vel !== undefined) {
      resolved.max_ang_vel = msg.max_ang_vel;
    }
    else {
      resolved.max_ang_vel = 0.0
    }

    return resolved;
    }
};

module.exports = TurnGoal;

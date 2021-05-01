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

class FollowPersonGoal {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.person_id = null;
      this.max_vel = null;
    }
    else {
      if (initObj.hasOwnProperty('person_id')) {
        this.person_id = initObj.person_id
      }
      else {
        this.person_id = 0;
      }
      if (initObj.hasOwnProperty('max_vel')) {
        this.max_vel = initObj.max_vel
      }
      else {
        this.max_vel = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type FollowPersonGoal
    // Serialize message field [person_id]
    bufferOffset = _serializer.uint64(obj.person_id, buffer, bufferOffset);
    // Serialize message field [max_vel]
    bufferOffset = _serializer.float32(obj.max_vel, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type FollowPersonGoal
    let len;
    let data = new FollowPersonGoal(null);
    // Deserialize message field [person_id]
    data.person_id = _deserializer.uint64(buffer, bufferOffset);
    // Deserialize message field [max_vel]
    data.max_vel = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'rococo_navigation/FollowPersonGoal';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bc669fb86b77765b83a3fdd1f702ad5e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    # Goal
    # target person
    uint64  person_id
    # max velocity [m/s]
    float32 max_vel
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new FollowPersonGoal(null);
    if (msg.person_id !== undefined) {
      resolved.person_id = msg.person_id;
    }
    else {
      resolved.person_id = 0
    }

    if (msg.max_vel !== undefined) {
      resolved.max_vel = msg.max_vel;
    }
    else {
      resolved.max_vel = 0.0
    }

    return resolved;
    }
};

module.exports = FollowPersonGoal;

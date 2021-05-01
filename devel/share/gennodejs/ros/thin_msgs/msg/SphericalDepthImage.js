// Auto-generated. Do not edit!

// (in-package thin_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let sensor_msgs = _finder('sensor_msgs');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SphericalDepthImage {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.horizontal_fov = null;
      this.vertical_fov = null;
      this.image = null;
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
      if (initObj.hasOwnProperty('image')) {
        this.image = initObj.image
      }
      else {
        this.image = new sensor_msgs.msg.Image();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SphericalDepthImage
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [horizontal_fov]
    bufferOffset = _serializer.float32(obj.horizontal_fov, buffer, bufferOffset);
    // Serialize message field [vertical_fov]
    bufferOffset = _serializer.float32(obj.vertical_fov, buffer, bufferOffset);
    // Serialize message field [image]
    bufferOffset = sensor_msgs.msg.Image.serialize(obj.image, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SphericalDepthImage
    let len;
    let data = new SphericalDepthImage(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [horizontal_fov]
    data.horizontal_fov = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [vertical_fov]
    data.vertical_fov = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [image]
    data.image = sensor_msgs.msg.Image.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += sensor_msgs.msg.Image.getMessageSize(object.image);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'thin_msgs/SphericalDepthImage';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '28b67eb85702f0ff03ff03fbb39b252f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Single spherical depth image from a 3D laser range-finder
    #
    # If you have another ranging device with different behavior (e.g. a sonar
    # array), please find or create a different message, since applications
    # will make fairly laser-specific assumptions about this data
    
    Header header            # timestamp in the header is the acquisition time of 
                             # the first ray in the scan.
                             #
                             # in frame frame_id, angles are measured around 
                             # the positive Z axis (clockwise, if Z is down) and
                             # around the positive Y axis (counterclockwise, if Y is on the left)
                             # with zero angle being forward along the x axis
                 
    float32 horizontal_fov   # horizontal field of view [deg]            
    float32 vertical_fov     # vertical field of view [deg]   
    
    sensor_msgs/Image image  # spherical depth image [uint16]
    
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
    MSG: sensor_msgs/Image
    # This message contains an uncompressed image
    # (0, 0) is at top-left corner of image
    #
    
    Header header        # Header timestamp should be acquisition time of image
                         # Header frame_id should be optical frame of camera
                         # origin of frame should be optical center of camera
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
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SphericalDepthImage(null);
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

    if (msg.image !== undefined) {
      resolved.image = sensor_msgs.msg.Image.Resolve(msg.image)
    }
    else {
      resolved.image = new sensor_msgs.msg.Image()
    }

    return resolved;
    }
};

module.exports = SphericalDepthImage;

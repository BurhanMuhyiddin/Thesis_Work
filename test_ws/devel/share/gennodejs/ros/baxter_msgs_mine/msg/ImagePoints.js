// Auto-generated. Do not edit!

// (in-package baxter_msgs_mine.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class ImagePoints {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sampled_target_points = null;
      this.sampled_current_points = null;
      this.hold_point_coords = null;
      this.pick_point_coords = null;
      this.place_point_coords = null;
    }
    else {
      if (initObj.hasOwnProperty('sampled_target_points')) {
        this.sampled_target_points = initObj.sampled_target_points
      }
      else {
        this.sampled_target_points = [];
      }
      if (initObj.hasOwnProperty('sampled_current_points')) {
        this.sampled_current_points = initObj.sampled_current_points
      }
      else {
        this.sampled_current_points = [];
      }
      if (initObj.hasOwnProperty('hold_point_coords')) {
        this.hold_point_coords = initObj.hold_point_coords
      }
      else {
        this.hold_point_coords = [];
      }
      if (initObj.hasOwnProperty('pick_point_coords')) {
        this.pick_point_coords = initObj.pick_point_coords
      }
      else {
        this.pick_point_coords = [];
      }
      if (initObj.hasOwnProperty('place_point_coords')) {
        this.place_point_coords = initObj.place_point_coords
      }
      else {
        this.place_point_coords = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ImagePoints
    // Serialize message field [sampled_target_points]
    bufferOffset = _arraySerializer.float64(obj.sampled_target_points, buffer, bufferOffset, null);
    // Serialize message field [sampled_current_points]
    bufferOffset = _arraySerializer.float64(obj.sampled_current_points, buffer, bufferOffset, null);
    // Serialize message field [hold_point_coords]
    bufferOffset = _arraySerializer.float64(obj.hold_point_coords, buffer, bufferOffset, null);
    // Serialize message field [pick_point_coords]
    bufferOffset = _arraySerializer.float64(obj.pick_point_coords, buffer, bufferOffset, null);
    // Serialize message field [place_point_coords]
    bufferOffset = _arraySerializer.float64(obj.place_point_coords, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ImagePoints
    let len;
    let data = new ImagePoints(null);
    // Deserialize message field [sampled_target_points]
    data.sampled_target_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [sampled_current_points]
    data.sampled_current_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [hold_point_coords]
    data.hold_point_coords = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [pick_point_coords]
    data.pick_point_coords = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [place_point_coords]
    data.place_point_coords = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.sampled_target_points.length;
    length += 8 * object.sampled_current_points.length;
    length += 8 * object.hold_point_coords.length;
    length += 8 * object.pick_point_coords.length;
    length += 8 * object.place_point_coords.length;
    return length + 20;
  }

  static datatype() {
    // Returns string type for a message object
    return 'baxter_msgs_mine/ImagePoints';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd42c80547db6a939e881199410cfe736';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] sampled_target_points
    float64[] sampled_current_points
    float64[] hold_point_coords
    float64[] pick_point_coords
    float64[] place_point_coords
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ImagePoints(null);
    if (msg.sampled_target_points !== undefined) {
      resolved.sampled_target_points = msg.sampled_target_points;
    }
    else {
      resolved.sampled_target_points = []
    }

    if (msg.sampled_current_points !== undefined) {
      resolved.sampled_current_points = msg.sampled_current_points;
    }
    else {
      resolved.sampled_current_points = []
    }

    if (msg.hold_point_coords !== undefined) {
      resolved.hold_point_coords = msg.hold_point_coords;
    }
    else {
      resolved.hold_point_coords = []
    }

    if (msg.pick_point_coords !== undefined) {
      resolved.pick_point_coords = msg.pick_point_coords;
    }
    else {
      resolved.pick_point_coords = []
    }

    if (msg.place_point_coords !== undefined) {
      resolved.place_point_coords = msg.place_point_coords;
    }
    else {
      resolved.place_point_coords = []
    }

    return resolved;
    }
};

module.exports = ImagePoints;

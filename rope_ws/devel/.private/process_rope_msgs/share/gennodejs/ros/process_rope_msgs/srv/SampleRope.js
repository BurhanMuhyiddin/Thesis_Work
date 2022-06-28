// Auto-generated. Do not edit!

// (in-package process_rope_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class SampleRopeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.type = null;
      this.limb = null;
      this.sample_target = null;
    }
    else {
      if (initObj.hasOwnProperty('type')) {
        this.type = initObj.type
      }
      else {
        this.type = 0;
      }
      if (initObj.hasOwnProperty('limb')) {
        this.limb = initObj.limb
      }
      else {
        this.limb = '';
      }
      if (initObj.hasOwnProperty('sample_target')) {
        this.sample_target = initObj.sample_target
      }
      else {
        this.sample_target = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SampleRopeRequest
    // Serialize message field [type]
    bufferOffset = _serializer.char(obj.type, buffer, bufferOffset);
    // Serialize message field [limb]
    bufferOffset = _serializer.string(obj.limb, buffer, bufferOffset);
    // Serialize message field [sample_target]
    bufferOffset = _serializer.bool(obj.sample_target, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SampleRopeRequest
    let len;
    let data = new SampleRopeRequest(null);
    // Deserialize message field [type]
    data.type = _deserializer.char(buffer, bufferOffset);
    // Deserialize message field [limb]
    data.limb = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [sample_target]
    data.sample_target = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.limb.length;
    return length + 6;
  }

  static datatype() {
    // Returns string type for a service object
    return 'process_rope_msgs/SampleRopeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f6737aa1d947b6e368b9d7e4248b289d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    char type
    string limb
    bool sample_target
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SampleRopeRequest(null);
    if (msg.type !== undefined) {
      resolved.type = msg.type;
    }
    else {
      resolved.type = 0
    }

    if (msg.limb !== undefined) {
      resolved.limb = msg.limb;
    }
    else {
      resolved.limb = ''
    }

    if (msg.sample_target !== undefined) {
      resolved.sample_target = msg.sample_target;
    }
    else {
      resolved.sample_target = false
    }

    return resolved;
    }
};

class SampleRopeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sampled_target_points = null;
      this.sampled_current_points = null;
      this.pick_points = null;
      this.pick_img_points = null;
      this.place_points = null;
      this.place_img_points = null;
      this.h_limb = null;
      this.success = null;
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
      if (initObj.hasOwnProperty('pick_points')) {
        this.pick_points = initObj.pick_points
      }
      else {
        this.pick_points = [];
      }
      if (initObj.hasOwnProperty('pick_img_points')) {
        this.pick_img_points = initObj.pick_img_points
      }
      else {
        this.pick_img_points = [];
      }
      if (initObj.hasOwnProperty('place_points')) {
        this.place_points = initObj.place_points
      }
      else {
        this.place_points = [];
      }
      if (initObj.hasOwnProperty('place_img_points')) {
        this.place_img_points = initObj.place_img_points
      }
      else {
        this.place_img_points = [];
      }
      if (initObj.hasOwnProperty('h_limb')) {
        this.h_limb = initObj.h_limb
      }
      else {
        this.h_limb = '';
      }
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SampleRopeResponse
    // Serialize message field [sampled_target_points]
    bufferOffset = _arraySerializer.float64(obj.sampled_target_points, buffer, bufferOffset, null);
    // Serialize message field [sampled_current_points]
    bufferOffset = _arraySerializer.float64(obj.sampled_current_points, buffer, bufferOffset, null);
    // Serialize message field [pick_points]
    bufferOffset = _arraySerializer.float64(obj.pick_points, buffer, bufferOffset, null);
    // Serialize message field [pick_img_points]
    bufferOffset = _arraySerializer.float64(obj.pick_img_points, buffer, bufferOffset, null);
    // Serialize message field [place_points]
    bufferOffset = _arraySerializer.float64(obj.place_points, buffer, bufferOffset, null);
    // Serialize message field [place_img_points]
    bufferOffset = _arraySerializer.float64(obj.place_img_points, buffer, bufferOffset, null);
    // Serialize message field [h_limb]
    bufferOffset = _serializer.string(obj.h_limb, buffer, bufferOffset);
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SampleRopeResponse
    let len;
    let data = new SampleRopeResponse(null);
    // Deserialize message field [sampled_target_points]
    data.sampled_target_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [sampled_current_points]
    data.sampled_current_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [pick_points]
    data.pick_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [pick_img_points]
    data.pick_img_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [place_points]
    data.place_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [place_img_points]
    data.place_img_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [h_limb]
    data.h_limb = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.sampled_target_points.length;
    length += 8 * object.sampled_current_points.length;
    length += 8 * object.pick_points.length;
    length += 8 * object.pick_img_points.length;
    length += 8 * object.place_points.length;
    length += 8 * object.place_img_points.length;
    length += object.h_limb.length;
    return length + 29;
  }

  static datatype() {
    // Returns string type for a service object
    return 'process_rope_msgs/SampleRopeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6b8cb66134ce8dee054ccfb99a3a7f22';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] sampled_target_points
    float64[] sampled_current_points
    float64[] pick_points
    float64[] pick_img_points
    float64[] place_points
    float64[] place_img_points
    string h_limb
    bool success
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SampleRopeResponse(null);
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

    if (msg.pick_points !== undefined) {
      resolved.pick_points = msg.pick_points;
    }
    else {
      resolved.pick_points = []
    }

    if (msg.pick_img_points !== undefined) {
      resolved.pick_img_points = msg.pick_img_points;
    }
    else {
      resolved.pick_img_points = []
    }

    if (msg.place_points !== undefined) {
      resolved.place_points = msg.place_points;
    }
    else {
      resolved.place_points = []
    }

    if (msg.place_img_points !== undefined) {
      resolved.place_img_points = msg.place_img_points;
    }
    else {
      resolved.place_img_points = []
    }

    if (msg.h_limb !== undefined) {
      resolved.h_limb = msg.h_limb;
    }
    else {
      resolved.h_limb = ''
    }

    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: SampleRopeRequest,
  Response: SampleRopeResponse,
  md5sum() { return '51516dd966b40523ec3a38606b7163ae'; },
  datatype() { return 'process_rope_msgs/SampleRope'; }
};

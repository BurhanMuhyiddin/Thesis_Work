// Auto-generated. Do not edit!

// (in-package baxter_msgs_mine.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class Cvt2WrldRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.img_points = null;
      this.limb = null;
    }
    else {
      if (initObj.hasOwnProperty('img_points')) {
        this.img_points = initObj.img_points
      }
      else {
        this.img_points = [];
      }
      if (initObj.hasOwnProperty('limb')) {
        this.limb = initObj.limb
      }
      else {
        this.limb = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Cvt2WrldRequest
    // Serialize message field [img_points]
    bufferOffset = _arraySerializer.float64(obj.img_points, buffer, bufferOffset, null);
    // Serialize message field [limb]
    bufferOffset = _serializer.string(obj.limb, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Cvt2WrldRequest
    let len;
    let data = new Cvt2WrldRequest(null);
    // Deserialize message field [img_points]
    data.img_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [limb]
    data.limb = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.img_points.length;
    length += object.limb.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'baxter_msgs_mine/Cvt2WrldRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1a507a4e10034cb4292c21ac6c41ea05';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] img_points
    string limb
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Cvt2WrldRequest(null);
    if (msg.img_points !== undefined) {
      resolved.img_points = msg.img_points;
    }
    else {
      resolved.img_points = []
    }

    if (msg.limb !== undefined) {
      resolved.limb = msg.limb;
    }
    else {
      resolved.limb = ''
    }

    return resolved;
    }
};

class Cvt2WrldResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.wrld_points = null;
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('wrld_points')) {
        this.wrld_points = initObj.wrld_points
      }
      else {
        this.wrld_points = [];
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
    // Serializes a message object of type Cvt2WrldResponse
    // Serialize message field [wrld_points]
    bufferOffset = _arraySerializer.float64(obj.wrld_points, buffer, bufferOffset, null);
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Cvt2WrldResponse
    let len;
    let data = new Cvt2WrldResponse(null);
    // Deserialize message field [wrld_points]
    data.wrld_points = _arrayDeserializer.float64(buffer, bufferOffset, null)
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.wrld_points.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'baxter_msgs_mine/Cvt2WrldResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9dff662a22b591e99b2ddc14401c766b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] wrld_points
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Cvt2WrldResponse(null);
    if (msg.wrld_points !== undefined) {
      resolved.wrld_points = msg.wrld_points;
    }
    else {
      resolved.wrld_points = []
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
  Request: Cvt2WrldRequest,
  Response: Cvt2WrldResponse,
  md5sum() { return '2ce5c3384f15a765a1063a3a6f79f77c'; },
  datatype() { return 'baxter_msgs_mine/Cvt2Wrld'; }
};

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

class GoToJointGoalRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.goal = null;
      this.limb = null;
    }
    else {
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = [];
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
    // Serializes a message object of type GoToJointGoalRequest
    // Serialize message field [goal]
    bufferOffset = _arraySerializer.float32(obj.goal, buffer, bufferOffset, null);
    // Serialize message field [limb]
    bufferOffset = _serializer.string(obj.limb, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoToJointGoalRequest
    let len;
    let data = new GoToJointGoalRequest(null);
    // Deserialize message field [goal]
    data.goal = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [limb]
    data.limb = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.goal.length;
    length += object.limb.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'baxter_msgs_mine/GoToJointGoalRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'abf12c5072912dd978e681eff0ec8576';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32[] goal
    string limb
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GoToJointGoalRequest(null);
    if (msg.goal !== undefined) {
      resolved.goal = msg.goal;
    }
    else {
      resolved.goal = []
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

class GoToJointGoalResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GoToJointGoalResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoToJointGoalResponse
    let len;
    let data = new GoToJointGoalResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'baxter_msgs_mine/GoToJointGoalResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '358e233cde0c8a8bcfea4ce193f8fc15';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GoToJointGoalResponse(null);
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
  Request: GoToJointGoalRequest,
  Response: GoToJointGoalResponse,
  md5sum() { return '81a2c4bff10997d9f224ac63631e3d27'; },
  datatype() { return 'baxter_msgs_mine/GoToJointGoal'; }
};

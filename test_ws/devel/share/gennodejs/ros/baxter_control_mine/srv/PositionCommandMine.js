// Auto-generated. Do not edit!

// (in-package baxter_control_mine.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class PositionCommandMineRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.position_command = null;
    }
    else {
      if (initObj.hasOwnProperty('position_command')) {
        this.position_command = initObj.position_command
      }
      else {
        this.position_command = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PositionCommandMineRequest
    // Serialize message field [position_command]
    bufferOffset = _serializer.string(obj.position_command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PositionCommandMineRequest
    let len;
    let data = new PositionCommandMineRequest(null);
    // Deserialize message field [position_command]
    data.position_command = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.position_command.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'baxter_control_mine/PositionCommandMineRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '99ef6bf7557ac027cb4e26b562147d5e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string position_command
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PositionCommandMineRequest(null);
    if (msg.position_command !== undefined) {
      resolved.position_command = msg.position_command;
    }
    else {
      resolved.position_command = ''
    }

    return resolved;
    }
};

class PositionCommandMineResponse {
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
    // Serializes a message object of type PositionCommandMineResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PositionCommandMineResponse
    let len;
    let data = new PositionCommandMineResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'baxter_control_mine/PositionCommandMineResponse';
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
    const resolved = new PositionCommandMineResponse(null);
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
  Request: PositionCommandMineRequest,
  Response: PositionCommandMineResponse,
  md5sum() { return '90005b3bd3e0858473cd0f1bcad7b688'; },
  datatype() { return 'baxter_control_mine/PositionCommandMine'; }
};

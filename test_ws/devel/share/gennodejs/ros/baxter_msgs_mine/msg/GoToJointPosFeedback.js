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

class GoToJointPosFeedback {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.current_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('current_pose')) {
        this.current_pose = initObj.current_pose
      }
      else {
        this.current_pose = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GoToJointPosFeedback
    // Serialize message field [current_pose]
    bufferOffset = _arraySerializer.float32(obj.current_pose, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoToJointPosFeedback
    let len;
    let data = new GoToJointPosFeedback(null);
    // Deserialize message field [current_pose]
    data.current_pose = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.current_pose.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'baxter_msgs_mine/GoToJointPosFeedback';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '08f77cad95bf249f1c96e79e0b413d06';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
    #feedback
    float32[] current_pose
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GoToJointPosFeedback(null);
    if (msg.current_pose !== undefined) {
      resolved.current_pose = msg.current_pose;
    }
    else {
      resolved.current_pose = []
    }

    return resolved;
    }
};

module.exports = GoToJointPosFeedback;

// Auto-generated. Do not edit!

// (in-package baxter_control_mine.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

let sensor_msgs = _finder('sensor_msgs');

//-----------------------------------------------------------

class CalculateIKRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.desired_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('desired_pose')) {
        this.desired_pose = initObj.desired_pose
      }
      else {
        this.desired_pose = new geometry_msgs.msg.Pose();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CalculateIKRequest
    // Serialize message field [desired_pose]
    bufferOffset = geometry_msgs.msg.Pose.serialize(obj.desired_pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CalculateIKRequest
    let len;
    let data = new CalculateIKRequest(null);
    // Deserialize message field [desired_pose]
    data.desired_pose = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 56;
  }

  static datatype() {
    // Returns string type for a service object
    return 'baxter_control_mine/CalculateIKRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0538590fc0be5b737b11f5be6e5b1759';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Pose desired_pose
    
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CalculateIKRequest(null);
    if (msg.desired_pose !== undefined) {
      resolved.desired_pose = geometry_msgs.msg.Pose.Resolve(msg.desired_pose)
    }
    else {
      resolved.desired_pose = new geometry_msgs.msg.Pose()
    }

    return resolved;
    }
};

class CalculateIKResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.joints = null;
    }
    else {
      if (initObj.hasOwnProperty('joints')) {
        this.joints = initObj.joints
      }
      else {
        this.joints = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CalculateIKResponse
    // Serialize message field [joints]
    // Serialize the length for message field [joints]
    bufferOffset = _serializer.uint32(obj.joints.length, buffer, bufferOffset);
    obj.joints.forEach((val) => {
      bufferOffset = sensor_msgs.msg.JointState.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CalculateIKResponse
    let len;
    let data = new CalculateIKResponse(null);
    // Deserialize message field [joints]
    // Deserialize array length for message field [joints]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.joints = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.joints[i] = sensor_msgs.msg.JointState.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.joints.forEach((val) => {
      length += sensor_msgs.msg.JointState.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'baxter_control_mine/CalculateIKResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '13b568889983e6c4080c58d8e7c2c89c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    sensor_msgs/JointState[] joints
    
    ================================================================================
    MSG: sensor_msgs/JointState
    # This is a message that holds data to describe the state of a set of torque controlled joints. 
    #
    # The state of each joint (revolute or prismatic) is defined by:
    #  * the position of the joint (rad or m),
    #  * the velocity of the joint (rad/s or m/s) and 
    #  * the effort that is applied in the joint (Nm or N).
    #
    # Each joint is uniquely identified by its name
    # The header specifies the time at which the joint states were recorded. All the joint states
    # in one message have to be recorded at the same time.
    #
    # This message consists of a multiple arrays, one for each part of the joint state. 
    # The goal is to make each of the fields optional. When e.g. your joints have no
    # effort associated with them, you can leave the effort array empty. 
    #
    # All arrays in this message should have the same size, or be empty.
    # This is the only way to uniquely associate the joint name with the correct
    # states.
    
    
    Header header
    
    string[] name
    float64[] position
    float64[] velocity
    float64[] effort
    
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
    const resolved = new CalculateIKResponse(null);
    if (msg.joints !== undefined) {
      resolved.joints = new Array(msg.joints.length);
      for (let i = 0; i < resolved.joints.length; ++i) {
        resolved.joints[i] = sensor_msgs.msg.JointState.Resolve(msg.joints[i]);
      }
    }
    else {
      resolved.joints = []
    }

    return resolved;
    }
};

module.exports = {
  Request: CalculateIKRequest,
  Response: CalculateIKResponse,
  md5sum() { return 'bb5eb49bd79b58929d3000cf4f10e460'; },
  datatype() { return 'baxter_control_mine/CalculateIK'; }
};

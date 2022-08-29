// Auto-generated. Do not edit!

// (in-package baxter_msgs_mine.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let shape_msgs = _finder('shape_msgs');
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class GoToGoalRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.goal = null;
      this.limb = null;
      this.mode = null;
      this.bounding_region = null;
      this.bounding_region_size = null;
      this.pos_constrained = null;
      this.orn_constrained = null;
      this.pos_only_ik = null;
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
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
      if (initObj.hasOwnProperty('bounding_region')) {
        this.bounding_region = initObj.bounding_region
      }
      else {
        this.bounding_region = [];
      }
      if (initObj.hasOwnProperty('bounding_region_size')) {
        this.bounding_region_size = initObj.bounding_region_size
      }
      else {
        this.bounding_region_size = 0;
      }
      if (initObj.hasOwnProperty('pos_constrained')) {
        this.pos_constrained = initObj.pos_constrained
      }
      else {
        this.pos_constrained = false;
      }
      if (initObj.hasOwnProperty('orn_constrained')) {
        this.orn_constrained = initObj.orn_constrained
      }
      else {
        this.orn_constrained = false;
      }
      if (initObj.hasOwnProperty('pos_only_ik')) {
        this.pos_only_ik = initObj.pos_only_ik
      }
      else {
        this.pos_only_ik = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GoToGoalRequest
    // Serialize message field [goal]
    // Serialize the length for message field [goal]
    bufferOffset = _serializer.uint32(obj.goal.length, buffer, bufferOffset);
    obj.goal.forEach((val) => {
      bufferOffset = geometry_msgs.msg.Pose.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [limb]
    bufferOffset = _serializer.string(obj.limb, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.int8(obj.mode, buffer, bufferOffset);
    // Serialize message field [bounding_region]
    // Serialize the length for message field [bounding_region]
    bufferOffset = _serializer.uint32(obj.bounding_region.length, buffer, bufferOffset);
    obj.bounding_region.forEach((val) => {
      bufferOffset = shape_msgs.msg.SolidPrimitive.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [bounding_region_size]
    bufferOffset = _serializer.int8(obj.bounding_region_size, buffer, bufferOffset);
    // Serialize message field [pos_constrained]
    bufferOffset = _serializer.bool(obj.pos_constrained, buffer, bufferOffset);
    // Serialize message field [orn_constrained]
    bufferOffset = _serializer.bool(obj.orn_constrained, buffer, bufferOffset);
    // Serialize message field [pos_only_ik]
    bufferOffset = _serializer.bool(obj.pos_only_ik, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoToGoalRequest
    let len;
    let data = new GoToGoalRequest(null);
    // Deserialize message field [goal]
    // Deserialize array length for message field [goal]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.goal = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.goal[i] = geometry_msgs.msg.Pose.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [limb]
    data.limb = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [bounding_region]
    // Deserialize array length for message field [bounding_region]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.bounding_region = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.bounding_region[i] = shape_msgs.msg.SolidPrimitive.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [bounding_region_size]
    data.bounding_region_size = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [pos_constrained]
    data.pos_constrained = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [orn_constrained]
    data.orn_constrained = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [pos_only_ik]
    data.pos_only_ik = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 56 * object.goal.length;
    length += object.limb.length;
    object.bounding_region.forEach((val) => {
      length += shape_msgs.msg.SolidPrimitive.getMessageSize(val);
    });
    return length + 17;
  }

  static datatype() {
    // Returns string type for a service object
    return 'baxter_msgs_mine/GoToGoalRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0630cc50545ecc68c15285867769d02d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Pose[] goal
    string limb
    int8 mode
    shape_msgs/SolidPrimitive[] bounding_region
    int8 bounding_region_size
    bool pos_constrained
    bool orn_constrained
    bool pos_only_ik
    
    
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
    
    ================================================================================
    MSG: shape_msgs/SolidPrimitive
    # Define box, sphere, cylinder, cone 
    # All shapes are defined to have their bounding boxes centered around 0,0,0.
    
    uint8 BOX=1
    uint8 SPHERE=2
    uint8 CYLINDER=3
    uint8 CONE=4
    
    # The type of the shape
    uint8 type
    
    
    # The dimensions of the shape
    float64[] dimensions
    
    # The meaning of the shape dimensions: each constant defines the index in the 'dimensions' array
    
    # For the BOX type, the X, Y, and Z dimensions are the length of the corresponding
    # sides of the box.
    uint8 BOX_X=0
    uint8 BOX_Y=1
    uint8 BOX_Z=2
    
    
    # For the SPHERE type, only one component is used, and it gives the radius of
    # the sphere.
    uint8 SPHERE_RADIUS=0
    
    
    # For the CYLINDER and CONE types, the center line is oriented along
    # the Z axis.  Therefore the CYLINDER_HEIGHT (CONE_HEIGHT) component
    # of dimensions gives the height of the cylinder (cone).  The
    # CYLINDER_RADIUS (CONE_RADIUS) component of dimensions gives the
    # radius of the base of the cylinder (cone).  Cone and cylinder
    # primitives are defined to be circular. The tip of the cone is
    # pointing up, along +Z axis.
    
    uint8 CYLINDER_HEIGHT=0
    uint8 CYLINDER_RADIUS=1
    
    uint8 CONE_HEIGHT=0
    uint8 CONE_RADIUS=1
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GoToGoalRequest(null);
    if (msg.goal !== undefined) {
      resolved.goal = new Array(msg.goal.length);
      for (let i = 0; i < resolved.goal.length; ++i) {
        resolved.goal[i] = geometry_msgs.msg.Pose.Resolve(msg.goal[i]);
      }
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

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    if (msg.bounding_region !== undefined) {
      resolved.bounding_region = new Array(msg.bounding_region.length);
      for (let i = 0; i < resolved.bounding_region.length; ++i) {
        resolved.bounding_region[i] = shape_msgs.msg.SolidPrimitive.Resolve(msg.bounding_region[i]);
      }
    }
    else {
      resolved.bounding_region = []
    }

    if (msg.bounding_region_size !== undefined) {
      resolved.bounding_region_size = msg.bounding_region_size;
    }
    else {
      resolved.bounding_region_size = 0
    }

    if (msg.pos_constrained !== undefined) {
      resolved.pos_constrained = msg.pos_constrained;
    }
    else {
      resolved.pos_constrained = false
    }

    if (msg.orn_constrained !== undefined) {
      resolved.orn_constrained = msg.orn_constrained;
    }
    else {
      resolved.orn_constrained = false
    }

    if (msg.pos_only_ik !== undefined) {
      resolved.pos_only_ik = msg.pos_only_ik;
    }
    else {
      resolved.pos_only_ik = false
    }

    return resolved;
    }
};

class GoToGoalResponse {
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
    // Serializes a message object of type GoToGoalResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoToGoalResponse
    let len;
    let data = new GoToGoalResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'baxter_msgs_mine/GoToGoalResponse';
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
    const resolved = new GoToGoalResponse(null);
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
  Request: GoToGoalRequest,
  Response: GoToGoalResponse,
  md5sum() { return '04d72039529027fa74e24860cee85ab7'; },
  datatype() { return 'baxter_msgs_mine/GoToGoal'; }
};

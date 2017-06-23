# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from localization_msgs/Grid.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import geometry_msgs.msg
import std_msgs.msg

class Grid(genpy.Message):
  _md5sum = "d1e2733602f879b37697d7b1d81ef8ce"
  _type = "localization_msgs/Grid"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """std_msgs/Header header
float64[] ptn_mat
float64 width
float64 height
float64 resolution
bool outdated
geometry_msgs/Pose2D origin

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
MSG: geometry_msgs/Pose2D
# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta"""
  __slots__ = ['header','ptn_mat','width','height','resolution','outdated','origin']
  _slot_types = ['std_msgs/Header','float64[]','float64','float64','float64','bool','geometry_msgs/Pose2D']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,ptn_mat,width,height,resolution,outdated,origin

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(Grid, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.ptn_mat is None:
        self.ptn_mat = []
      if self.width is None:
        self.width = 0.
      if self.height is None:
        self.height = 0.
      if self.resolution is None:
        self.resolution = 0.
      if self.outdated is None:
        self.outdated = False
      if self.origin is None:
        self.origin = geometry_msgs.msg.Pose2D()
    else:
      self.header = std_msgs.msg.Header()
      self.ptn_mat = []
      self.width = 0.
      self.height = 0.
      self.resolution = 0.
      self.outdated = False
      self.origin = geometry_msgs.msg.Pose2D()

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.ptn_mat)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(struct.pack(pattern, *self.ptn_mat))
      _x = self
      buff.write(_get_struct_3dB3d().pack(_x.width, _x.height, _x.resolution, _x.outdated, _x.origin.x, _x.origin.y, _x.origin.theta))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.origin is None:
        self.origin = geometry_msgs.msg.Pose2D()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.ptn_mat = struct.unpack(pattern, str[start:end])
      _x = self
      start = end
      end += 49
      (_x.width, _x.height, _x.resolution, _x.outdated, _x.origin.x, _x.origin.y, _x.origin.theta,) = _get_struct_3dB3d().unpack(str[start:end])
      self.outdated = bool(self.outdated)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.pack('<I%ss'%length, length, _x))
      length = len(self.ptn_mat)
      buff.write(_struct_I.pack(length))
      pattern = '<%sd'%length
      buff.write(self.ptn_mat.tostring())
      _x = self
      buff.write(_get_struct_3dB3d().pack(_x.width, _x.height, _x.resolution, _x.outdated, _x.origin.x, _x.origin.y, _x.origin.theta))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.origin is None:
        self.origin = geometry_msgs.msg.Pose2D()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      pattern = '<%sd'%length
      start = end
      end += struct.calcsize(pattern)
      self.ptn_mat = numpy.frombuffer(str[start:end], dtype=numpy.float64, count=length)
      _x = self
      start = end
      end += 49
      (_x.width, _x.height, _x.resolution, _x.outdated, _x.origin.x, _x.origin.y, _x.origin.theta,) = _get_struct_3dB3d().unpack(str[start:end])
      self.outdated = bool(self.outdated)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_3dB3d = None
def _get_struct_3dB3d():
    global _struct_3dB3d
    if _struct_3dB3d is None:
        _struct_3dB3d = struct.Struct("<3dB3d")
    return _struct_3dB3d

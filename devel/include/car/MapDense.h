// Generated by gencpp from file car/MapDense.msg
// DO NOT EDIT!


#ifndef CAR_MESSAGE_MAPDENSE_H
#define CAR_MESSAGE_MAPDENSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <nav_msgs/MapMetaData.h>
#include <sensor_msgs/Image.h>
#include <std_msgs/Bool.h>

namespace car
{
template <class ContainerAllocator>
struct MapDense_
{
  typedef MapDense_<ContainerAllocator> Type;

  MapDense_()
    : metadata()
    , image()
    , valid()  {
    }
  MapDense_(const ContainerAllocator& _alloc)
    : metadata(_alloc)
    , image(_alloc)
    , valid(_alloc)  {
  (void)_alloc;
    }



   typedef  ::nav_msgs::MapMetaData_<ContainerAllocator>  _metadata_type;
  _metadata_type metadata;

   typedef  ::sensor_msgs::Image_<ContainerAllocator>  _image_type;
  _image_type image;

   typedef  ::std_msgs::Bool_<ContainerAllocator>  _valid_type;
  _valid_type valid;




  typedef boost::shared_ptr< ::car::MapDense_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::car::MapDense_<ContainerAllocator> const> ConstPtr;

}; // struct MapDense_

typedef ::car::MapDense_<std::allocator<void> > MapDense;

typedef boost::shared_ptr< ::car::MapDense > MapDensePtr;
typedef boost::shared_ptr< ::car::MapDense const> MapDenseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::car::MapDense_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::car::MapDense_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace car

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'nav_msgs': ['/opt/ros/kinetic/share/nav_msgs/cmake/../msg'], 'car': ['/home/marc/catkin_ws/src/car/msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::car::MapDense_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::car::MapDense_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::car::MapDense_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::car::MapDense_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::car::MapDense_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::car::MapDense_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::car::MapDense_<ContainerAllocator> >
{
  static const char* value()
  {
    return "93768b7beba1929321d13c1287623a44";
  }

  static const char* value(const ::car::MapDense_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x93768b7beba19293ULL;
  static const uint64_t static_value2 = 0x21d13c1287623a44ULL;
};

template<class ContainerAllocator>
struct DataType< ::car::MapDense_<ContainerAllocator> >
{
  static const char* value()
  {
    return "car/MapDense";
  }

  static const char* value(const ::car::MapDense_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::car::MapDense_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nav_msgs/MapMetaData metadata\n\
sensor_msgs/Image image\n\
std_msgs/Bool valid\n\
\n\
================================================================================\n\
MSG: nav_msgs/MapMetaData\n\
# This hold basic information about the characterists of the OccupancyGrid\n\
\n\
# The time at which the map was loaded\n\
time map_load_time\n\
# The map resolution [m/cell]\n\
float32 resolution\n\
# Map width [cells]\n\
uint32 width\n\
# Map height [cells]\n\
uint32 height\n\
# The origin of the map [m, m, rad].  This is the real-world pose of the\n\
# cell (0,0) in the map.\n\
geometry_msgs/Pose origin\n\
================================================================================\n\
MSG: geometry_msgs/Pose\n\
# A representation of pose in free space, composed of position and orientation. \n\
Point position\n\
Quaternion orientation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
\n\
================================================================================\n\
MSG: sensor_msgs/Image\n\
# This message contains an uncompressed image\n\
# (0, 0) is at top-left corner of image\n\
#\n\
\n\
Header header        # Header timestamp should be acquisition time of image\n\
                     # Header frame_id should be optical frame of camera\n\
                     # origin of frame should be optical center of cameara\n\
                     # +x should point to the right in the image\n\
                     # +y should point down in the image\n\
                     # +z should point into to plane of the image\n\
                     # If the frame_id here and the frame_id of the CameraInfo\n\
                     # message associated with the image conflict\n\
                     # the behavior is undefined\n\
\n\
uint32 height         # image height, that is, number of rows\n\
uint32 width          # image width, that is, number of columns\n\
\n\
# The legal values for encoding are in file src/image_encodings.cpp\n\
# If you want to standardize a new string format, join\n\
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.\n\
\n\
string encoding       # Encoding of pixels -- channel meaning, ordering, size\n\
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h\n\
\n\
uint8 is_bigendian    # is this data bigendian?\n\
uint32 step           # Full row length in bytes\n\
uint8[] data          # actual matrix data, size is (step * rows)\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: std_msgs/Bool\n\
bool data\n\
";
  }

  static const char* value(const ::car::MapDense_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::car::MapDense_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.metadata);
      stream.next(m.image);
      stream.next(m.valid);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MapDense_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::car::MapDense_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::car::MapDense_<ContainerAllocator>& v)
  {
    s << indent << "metadata: ";
    s << std::endl;
    Printer< ::nav_msgs::MapMetaData_<ContainerAllocator> >::stream(s, indent + "  ", v.metadata);
    s << indent << "image: ";
    s << std::endl;
    Printer< ::sensor_msgs::Image_<ContainerAllocator> >::stream(s, indent + "  ", v.image);
    s << indent << "valid: ";
    s << std::endl;
    Printer< ::std_msgs::Bool_<ContainerAllocator> >::stream(s, indent + "  ", v.valid);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CAR_MESSAGE_MAPDENSE_H

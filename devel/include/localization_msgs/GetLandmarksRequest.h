// Generated by gencpp from file localization_msgs/GetLandmarksRequest.msg
// DO NOT EDIT!


#ifndef LOCALIZATION_MSGS_MESSAGE_GETLANDMARKSREQUEST_H
#define LOCALIZATION_MSGS_MESSAGE_GETLANDMARKSREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point.h>
#include <std_msgs/Float64.h>
#include <std_msgs/Float64.h>

namespace localization_msgs
{
template <class ContainerAllocator>
struct GetLandmarksRequest_
{
  typedef GetLandmarksRequest_<ContainerAllocator> Type;

  GetLandmarksRequest_()
    : point()
    , width_meter()
    , heigth_meter()  {
    }
  GetLandmarksRequest_(const ContainerAllocator& _alloc)
    : point(_alloc)
    , width_meter(_alloc)
    , heigth_meter(_alloc)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _point_type;
  _point_type point;

   typedef  ::std_msgs::Float64_<ContainerAllocator>  _width_meter_type;
  _width_meter_type width_meter;

   typedef  ::std_msgs::Float64_<ContainerAllocator>  _heigth_meter_type;
  _heigth_meter_type heigth_meter;




  typedef boost::shared_ptr< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> const> ConstPtr;

}; // struct GetLandmarksRequest_

typedef ::localization_msgs::GetLandmarksRequest_<std::allocator<void> > GetLandmarksRequest;

typedef boost::shared_ptr< ::localization_msgs::GetLandmarksRequest > GetLandmarksRequestPtr;
typedef boost::shared_ptr< ::localization_msgs::GetLandmarksRequest const> GetLandmarksRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace localization_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'nav_msgs': ['/opt/ros/kinetic/share/nav_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'localization_msgs': ['/home/marc/catkin_ws/src/localization_msgs/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "df1dcb97700423fef9fc16d14781286a";
  }

  static const char* value(const ::localization_msgs::GetLandmarksRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xdf1dcb97700423feULL;
  static const uint64_t static_value2 = 0xf9fc16d14781286aULL;
};

template<class ContainerAllocator>
struct DataType< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "localization_msgs/GetLandmarksRequest";
  }

  static const char* value(const ::localization_msgs::GetLandmarksRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Point point\n\
std_msgs/Float64 width_meter\n\
std_msgs/Float64 heigth_meter\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: std_msgs/Float64\n\
float64 data\n\
";
  }

  static const char* value(const ::localization_msgs::GetLandmarksRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.point);
      stream.next(m.width_meter);
      stream.next(m.heigth_meter);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetLandmarksRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::localization_msgs::GetLandmarksRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::localization_msgs::GetLandmarksRequest_<ContainerAllocator>& v)
  {
    s << indent << "point: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.point);
    s << indent << "width_meter: ";
    s << std::endl;
    Printer< ::std_msgs::Float64_<ContainerAllocator> >::stream(s, indent + "  ", v.width_meter);
    s << indent << "heigth_meter: ";
    s << std::endl;
    Printer< ::std_msgs::Float64_<ContainerAllocator> >::stream(s, indent + "  ", v.heigth_meter);
  }
};

} // namespace message_operations
} // namespace ros

#endif // LOCALIZATION_MSGS_MESSAGE_GETLANDMARKSREQUEST_H

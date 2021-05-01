// Generated by gencpp from file thin_msgs/SphericalDepthCameraInfo.msg
// DO NOT EDIT!


#ifndef THIN_MSGS_MESSAGE_SPHERICALDEPTHCAMERAINFO_H
#define THIN_MSGS_MESSAGE_SPHERICALDEPTHCAMERAINFO_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>

namespace thin_msgs
{
template <class ContainerAllocator>
struct SphericalDepthCameraInfo_
{
  typedef SphericalDepthCameraInfo_<ContainerAllocator> Type;

  SphericalDepthCameraInfo_()
    : header()
    , horizontal_fov(0.0)
    , vertical_fov(0.0)
    , horizontal_resolution(0.0)
    , vertical_resolution(0.0)
    , max_range(0.0)
    , min_range(0.0)
    , depth_quantization(0.0)  {
    }
  SphericalDepthCameraInfo_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , horizontal_fov(0.0)
    , vertical_fov(0.0)
    , horizontal_resolution(0.0)
    , vertical_resolution(0.0)
    , max_range(0.0)
    , min_range(0.0)
    , depth_quantization(0.0)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef double _horizontal_fov_type;
  _horizontal_fov_type horizontal_fov;

   typedef double _vertical_fov_type;
  _vertical_fov_type vertical_fov;

   typedef double _horizontal_resolution_type;
  _horizontal_resolution_type horizontal_resolution;

   typedef double _vertical_resolution_type;
  _vertical_resolution_type vertical_resolution;

   typedef double _max_range_type;
  _max_range_type max_range;

   typedef double _min_range_type;
  _min_range_type min_range;

   typedef double _depth_quantization_type;
  _depth_quantization_type depth_quantization;





  typedef boost::shared_ptr< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> const> ConstPtr;

}; // struct SphericalDepthCameraInfo_

typedef ::thin_msgs::SphericalDepthCameraInfo_<std::allocator<void> > SphericalDepthCameraInfo;

typedef boost::shared_ptr< ::thin_msgs::SphericalDepthCameraInfo > SphericalDepthCameraInfoPtr;
typedef boost::shared_ptr< ::thin_msgs::SphericalDepthCameraInfo const> SphericalDepthCameraInfoConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace thin_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'thin_msgs': ['/home/salvathor/Documentos/Akira_1.2.2/src/thin_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c75aa0007bfd3792f8186edb932d7d9a";
  }

  static const char* value(const ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc75aa0007bfd3792ULL;
  static const uint64_t static_value2 = 0xf8186edb932d7d9aULL;
};

template<class ContainerAllocator>
struct DataType< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "thin_msgs/SphericalDepthCameraInfo";
  }

  static const char* value(const ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
float64 horizontal_fov\n\
float64 vertical_fov\n\
float64 horizontal_resolution\n\
float64 vertical_resolution\n\
float64 max_range\n\
float64 min_range\n\
float64 depth_quantization \n\
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
";
  }

  static const char* value(const ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.horizontal_fov);
      stream.next(m.vertical_fov);
      stream.next(m.horizontal_resolution);
      stream.next(m.vertical_resolution);
      stream.next(m.max_range);
      stream.next(m.min_range);
      stream.next(m.depth_quantization);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SphericalDepthCameraInfo_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::thin_msgs::SphericalDepthCameraInfo_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "horizontal_fov: ";
    Printer<double>::stream(s, indent + "  ", v.horizontal_fov);
    s << indent << "vertical_fov: ";
    Printer<double>::stream(s, indent + "  ", v.vertical_fov);
    s << indent << "horizontal_resolution: ";
    Printer<double>::stream(s, indent + "  ", v.horizontal_resolution);
    s << indent << "vertical_resolution: ";
    Printer<double>::stream(s, indent + "  ", v.vertical_resolution);
    s << indent << "max_range: ";
    Printer<double>::stream(s, indent + "  ", v.max_range);
    s << indent << "min_range: ";
    Printer<double>::stream(s, indent + "  ", v.min_range);
    s << indent << "depth_quantization: ";
    Printer<double>::stream(s, indent + "  ", v.depth_quantization);
  }
};

} // namespace message_operations
} // namespace ros

#endif // THIN_MSGS_MESSAGE_SPHERICALDEPTHCAMERAINFO_H

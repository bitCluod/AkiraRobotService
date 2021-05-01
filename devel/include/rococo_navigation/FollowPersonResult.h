// Generated by gencpp from file rococo_navigation/FollowPersonResult.msg
// DO NOT EDIT!


#ifndef ROCOCO_NAVIGATION_MESSAGE_FOLLOWPERSONRESULT_H
#define ROCOCO_NAVIGATION_MESSAGE_FOLLOWPERSONRESULT_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace rococo_navigation
{
template <class ContainerAllocator>
struct FollowPersonResult_
{
  typedef FollowPersonResult_<ContainerAllocator> Type;

  FollowPersonResult_()
    : result()  {
    }
  FollowPersonResult_(const ContainerAllocator& _alloc)
    : result(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _result_type;
  _result_type result;





  typedef boost::shared_ptr< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> const> ConstPtr;

}; // struct FollowPersonResult_

typedef ::rococo_navigation::FollowPersonResult_<std::allocator<void> > FollowPersonResult;

typedef boost::shared_ptr< ::rococo_navigation::FollowPersonResult > FollowPersonResultPtr;
typedef boost::shared_ptr< ::rococo_navigation::FollowPersonResult const> FollowPersonResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rococo_navigation::FollowPersonResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace rococo_navigation

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'rococo_navigation': ['/home/salvathor/Documentos/Akira_1.2.2/devel/share/rococo_navigation/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "c22f2a1ed8654a0b365f1bb3f7ff2c0f";
  }

  static const char* value(const ::rococo_navigation::FollowPersonResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xc22f2a1ed8654a0bULL;
  static const uint64_t static_value2 = 0x365f1bb3f7ff2c0fULL;
};

template<class ContainerAllocator>
struct DataType< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rococo_navigation/FollowPersonResult";
  }

  static const char* value(const ::rococo_navigation::FollowPersonResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
# Result\n\
string result\n\
";
  }

  static const char* value(const ::rococo_navigation::FollowPersonResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.result);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct FollowPersonResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rococo_navigation::FollowPersonResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::rococo_navigation::FollowPersonResult_<ContainerAllocator>& v)
  {
    s << indent << "result: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.result);
  }
};

} // namespace message_operations
} // namespace ros

#endif // ROCOCO_NAVIGATION_MESSAGE_FOLLOWPERSONRESULT_H

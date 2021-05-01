#ifndef IMU_MESSAGE_LISTENER_H
#define IMU_MESSAGE_LISTENER_H

#include "globals/defs.h"
#include "txt_io/sensor_message_sorter.h"

#include <ros/ros.h>
#include <sensor_msgs/Imu.h>

namespace fps_mapper
{

class CIMUMessageListener
{

//ds ctor/dtor (MUST NOT THROW)
public:

    EIGEN_MAKE_ALIGNED_OPERATOR_NEW;
    CIMUMessageListener( ros::NodeHandle* p_pNode, txt_io::SensorMessageSorter* p_pSorter );

//ds accessors
public:

    //ds subscription
    inline ros::NodeHandle* nodeHandle( ){ return m_pNode; }
    void subscribe( const std::string& p_strTopic );

    inline const std::string& getTopic( ) const { return m_strTopic; }

//ds members (inheritable)
protected:

    txt_io::SensorMessageSorter* m_pSorter;
    ros::NodeHandle* m_pNode;
    ros::Subscriber m_pSubscriberIMU;
    std::string m_strTopic;

//ds helpers
private:

    void _callbackIMU( const sensor_msgs::ImuPtr p_pIMUMessage );

};

} //namespace fps_mapper

#endif //#define IMU_MESSAGE_LISTENER_H

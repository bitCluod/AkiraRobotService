#include <ros/ros.h>
#include <tf/transform_broadcaster.h>

int main(int argc, char** argv){
  ros::init(argc, argv, "robot_tf_publisher");
  ros::NodeHandle n;

  ros::Rate r(100);

  tf::TransformBroadcaster broadcaster;

  while(n.ok()){
	  broadcaster.sendTransform(
      tf::StampedTransform(
        tf::Transform(tf::Quaternion(0, 0, 0, 1), tf::Vector3(0.0, 0.0, 0.6)),
        ros::Time::now(),"base_footprint", "base_link"));
    r.sleep();
	  //odom
    broadcaster.sendTransform(
      tf::StampedTransform(
        tf::Transform(tf::Quaternion(0, 0, 0, 1), tf::Vector3(0.0, 0.25, -0.54)),
        ros::Time::now(),"base_link", "odom_left"));
    r.sleep();
  
  //siguiente transformacion
  broadcaster.sendTransform(
      tf::StampedTransform(
        tf::Transform(tf::Quaternion(0, 0, 0, 1), tf::Vector3(0.0, -0.25, -0.54)),
        ros::Time::now(),"base_link", "odom_raihg"));
    r.sleep();
  //transformacion a laser scan
  broadcaster.sendTransform(
      tf::StampedTransform(
        tf::Transform(tf::Quaternion(0, 0, 0, 1), tf::Vector3(0.20, 0.0, -0.15)),
        ros::Time::now(),"base_link", "laser_scan"));
    r.sleep();
    
    //transformacion de mapa a odom
    broadcaster.sendTransform(
      tf::StampedTransform(
        tf::Transform(tf::Quaternion(0, 0, 0, 1), tf::Vector3(0, 0, 0)),
        ros::Time::now(),"mapa", "odom"));
    r.sleep();
  }
}

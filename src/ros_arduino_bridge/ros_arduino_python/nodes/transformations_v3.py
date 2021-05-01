#!/usr/bin/env python  

import roslib
import rospy
import tf
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Quaternion

def callback(data):

	broadcaster = tf.TransformBroadcaster()
	odom_quat = tf.transformations.quaternion_from_euler(0, 0, 0) 
	quaternion = Quaternion()
	quaternion = data.pose.pose.orientation

	# Transformacion de odometria.
	broadcaster.sendTransform(
		(data.pose.pose.position.x, data.pose.pose.position.y, 0), 
		(quaternion.x, quaternion.y, quaternion.z, quaternion.w),
		rospy.Time.now(),
		"base_footprint",
		"odom"
		)

	# Transofrmacion para rescatar base_footprint
	broadcaster.sendTransform(
		(0, 0, 0), 
		odom_quat,
 		rospy.Time.now(),
		"base_link",
		"base_footprint"
		)

	# Transformacion para obtener base_frame
	broadcaster.sendTransform(
		(0, 0, 0.115), #0, 0, 0.57
		odom_quat,
 		rospy.Time.now(),
		"base_frame",
		"base_link"
		)

	# Transformacion para el sensor laser
	broadcaster.sendTransform(
		(0.18, 0, 0.22), #0.18, 0, 0.24
		odom_quat,
		rospy.Time.now(),
		"base_laser",
		"base_frame" 
		)

	#Transformacion para el kinect
	broadcaster.sendTransform(
		(0.125, 0, 0.535), #0.125, 0, 0.075 or 0.125, 0, 0.65
		odom_quat,
		rospy.Time.now(),
		"camera_link", #rgbd_front_top_link
		"base_frame" 
		)

	# Transformacion de la llanta izquierda
	broadcaster.sendTransform(
		(0, 0.20, -0.043), #0, 0.20, -0.505 or 0, 0.20, 0.072
		odom_quat,
		rospy.Time.now(),
		"odom_left", 
		"base_frame" 
		)

	#Transformacion de la llanta derecha
	broadcaster.sendTransform(
		(0, -0.20, -0.043), #0, -0.20, -0.505 or 0, -0.20, 0.072
		odom_quat,
		rospy.Time.now(),
		"odom_right", 
		"base_frame" 
		)

rospy.init_node('tf_publisher')
rospy.Subscriber("/odom", Odometry, callback)
rospy.spin()


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

	# Transformacion para obtener base_link
	broadcaster.sendTransform(
		(0, 0, 0.11),
		odom_quat,
 		rospy.Time.now(),
		"base_link",
		"base_footprint"
		)

	# Transformacion para el sensor laser
	broadcaster.sendTransform(
		(0.162, 0.01, 0.217),
		odom_quat,
		rospy.Time.now(),
		"base_laser",
		"base_link" 
		)

	#Transformacion para el kinect
	broadcaster.sendTransform(
		(0.135, 0, 0.50),
		odom_quat,
		rospy.Time.now(),
		"camera_link", #rgbd_front_top_link
		"base_link" 
		)

	# Transformacion de la llanta izquierda
	broadcaster.sendTransform(
		(0, 0.205, -0.038),
		odom_quat,
		rospy.Time.now(),
		"left_wheel_link", 
		"base_link" 
		)

	#Transformacion de la llanta derecha
	broadcaster.sendTransform(
		(0, -0.205, -0.038),
		odom_quat,
		rospy.Time.now(),
		"right_wheel_link", 
		"base_link" 
		)

rospy.init_node('tf_publisher')
rospy.Subscriber("/odom", Odometry, callback)
rospy.spin()


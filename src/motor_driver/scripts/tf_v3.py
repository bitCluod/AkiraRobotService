#!/usr/bin/env python  

import roslib
import rospy
import tf
from nav_msgs.msg import Odometry
from geometry_msgs.msg import Quaternion

if __name__ == '__main__':
    
	rospy.init_node('akira_tf_publisher')

	#listener = tf.TransformListener()
	#turtle_vel = rospy.Publisher('turtle2/cmd_vel', geometry_msgs.msg.Twist, queue_size=1)

	rate = rospy.Rate(10.0)

	while not rospy.is_shutdown():
		
		#current_time = rospy.Time.now()
		
		#try:
		#	(trans,rot) = listener.lookupTransform('/base_link', '/odom', rospy.Time(0))
		#except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException):
		#	continue
		
		broadcaster = tf.TransformBroadcaster()
		odom_quat = tf.transformations.quaternion_from_euler(0, 0, 0)

		broadcaster.sendTransform(
			(0, 0, 0),
			odom_quat,
 			rospy.Time.now(),
			"base_footprint",
			"odom"
    	)

		broadcaster.sendTransform(
			(0, 0, 0),
			odom_quat,
 			rospy.Time.now(),
			"base_link",
			"base_footprint"
    	)

		broadcaster.sendTransform(
			(0.18, 0, 0.24),
			odom_quat,
 			rospy.Time.now(),
			"base_laser",
			"base_link"
    	)

		broadcaster.sendTransform(
			(0.125, 0, 0.545),
			odom_quat,
 			rospy.Time.now(),
			"camera_link",
			"base_link"
    	)

		#print(str(trans[0])+" "+str(trans[1]))
		#print(rot[3]) 
		rate.sleep()


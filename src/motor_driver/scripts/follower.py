#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Point
from geometry_msgs.msg import Twist

count = 0
speed = 0.2
t = Twist()
pub = rospy.Publisher("/akira/cmd_vel", Twist, queue_size=10)

def callback(data):

	global speed
	global t
	global pub
	
	ax = int(data.x) 
	ay = int(data.y)
 
	print('X ' + str(ax) + '  Y ' + str(ay)	)

	if ax == 0 and ay == 0:
		t.linear.x = 0
		t.angular.z = 0
		pub.publish(t)
	
	else:

		if ax >= 160 and ax <= 480:   
			
			t.linear.x = 1.6
			t.angular.z = 0
			pub.publish(t)
			print("frente"+" x:"+str(t.linear.x))
		
		else:

			if ax < 160: 
			
				t.angular.z -= 0.05 #right
				pub.publish(t)
				print("derecha"+" z:"+str(t.angular.z))
			
			elif ax > 480:
			
				t.angular.z += 0.05 #left
				pub.publish(t)
				print("izquierda"+" z:"+str(t.angular.z))

rospy.init_node('follower_node', anonymous=True)

rospy.Subscriber('follower', Point, callback)
rospy.spin()


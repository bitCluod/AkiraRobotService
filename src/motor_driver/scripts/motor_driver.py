#!/usr/bin/env python
# license removed for brevity
import rospy
from std_msgs.msg import String
from geometry_msgs.msg import Twist
import serial

def myhook():  #Antes de matar al nodo, cierras la conexion serial
	global ser
	ser.close()

# get cmd_vel message, and get linear velocity and angular velocity
def get_cmd_vel(data):
	x = data.linear.x
	angular = data.angular.z
	send_cmd_to_arduino(x, angular)

# translate x, and angular velocity to PWM signal of each wheels, and send to arduino
def send_cmd_to_arduino(self, x, angular):

	global ser
	global message
	# calculate right and left wheels' signal
	right = int((x + angular) * 120) #50
	left = int((x - angular) * 120) #50
	# format for arduino
	message = "{},{},{},{},{},{}*".format(right, left, right, left, right, left)
	print message
	# send by serial 
	ser.write(message)

# init ros
rospy.init_node('car_driver', anonymous=True)
rospy.Subscriber('/cmd_vel', Twist, get_cmd_vel)
rospy.on_shutdown(myhook)

ser = serial.Serial('/dev/ttyACM1', 115200)
pub = rospy.Publisher('arduino', String, queue_size=10)
r = rospy.Rate(10)
message = ""

while not rospy.is_shutdown():
	message = ser.readline()
	pub.publish(message)
	r.sleep()


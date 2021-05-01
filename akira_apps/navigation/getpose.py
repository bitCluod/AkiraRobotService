import math, time

import rospy
import actionlib
from threading import Thread

from nav_msgs.msg import Odometry
import tf

TOPIC_odom = '/odom'
FRAME_map = 'map'
FRAME_base = 'base_footprint' #base_link

odom_robot_pose = [0, 0, 0]
map_robot_pose = [0, 0, 0]
odomcount = 0 
odomframe = ''

listener = None

def odom_cb(data):
    global odom_robot_pose, odomcount, odomframe
    odom_robot_pose[0] = data.pose.pose.position.x
    odom_robot_pose[1] = data.pose.pose.position.y
    o = data.pose.pose.orientation
    q = (o.x, o.y, o.z, o.w)
    euler = tf.transformations.euler_from_quaternion(q)
    odom_robot_pose[2] = euler[2] # yaw
    odomcount += 1
    odomframe = data.header.frame_id


def get_robot_pose():
    global map_robot_pose
    try:
        (trans,rot) = listener.lookupTransform(FRAME_map, FRAME_base, rospy.Time(0))
    except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException) as e:
        print(e)
        return

    roll, pitch, yaw = tf.transformations.euler_from_quaternion(rot)
    map_robot_pose[0] = trans[0]
    map_robot_pose[1] = trans[1]
    map_robot_pose[2] = yaw


# main
if __name__ == "__main__":

    rospy.init_node('getpose', disable_signals=True)

    listener = tf.TransformListener()
    odom_sub = rospy.Subscriber(TOPIC_odom, Odometry, odom_cb)

    time.sleep(1)

    get_robot_pose()

    print("Robot pose: %.1f %.1f %.1f DEG"  
        %(map_robot_pose[0], map_robot_pose[1], map_robot_pose[2]*180/math.pi))

    odom_sub.unregister()








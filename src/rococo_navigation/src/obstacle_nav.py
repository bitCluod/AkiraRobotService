import math, random
import argparse
import os
import random
from argparse import RawTextHelpFormatter

import rospy
import actionlib
from threading import Thread

from nav_msgs.msg import Odometry
from geometry_msgs.msg import Twist, Quaternion
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
import tf

ACTION_move_base = '/diago_0/move_base'
TOPIC_cmd_vel = '/diago_0/cmd_vel'
TOPIC_desired_cmd_vel = '/diago_0/desired_cmd_vel'
TOPIC_odom = '/diago_0/odom'
FRAME_map = '/diago_0/map'
FRAME_base = '/diago_0/base_frame'

PARAM_obstNear = '/diago_0/gradient_based_navigation/obstacleNearnessEnabled'

odom_robot_pose = [0, 0, 0]
map_robot_pose = [0, 0, 0]
robot_vel = [0, 0]
robot_desired_vel = [0, 0]
target_pose = [0, 0, 0]
odomcount = 0 
odomframe = ''
log_pgv = []
log_recovery = []

doLog = True  # if trajectry data are logged on a file


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
    if doLog:
        log_current_state()

def get_robot_pose():
    global map_robot_pose
    try:
        (trans,rot) = listener.lookupTransform(FRAME_map, FRAME_base, rospy.Time(0))
    except (tf.LookupException, tf.ConnectivityException, tf.ExtrapolationException) as e:
        print(e)
        return False

    roll, pitch, yaw = tf.transformations.euler_from_quaternion(rot)
    map_robot_pose[0] = trans[0]
    map_robot_pose[1] = trans[1]
    map_robot_pose[2] = yaw
    return True


def dist_from_goal():
    global map_robot_pose, target_pose
    if (get_robot_pose()):
        return math.sqrt(math.pow(map_robot_pose[0]-target_pose[0],2)+math.pow(map_robot_pose[1]-target_pose[1],2))
    else:
        return 999


def cmdvel_cb(data):
    global robot_vel
    robot_vel[0] = data.linear.x
    robot_vel[1] = data.angular.z

def desired_cmdvel_cb(data):
    global robot_vel
    robot_desired_vel[0] = data.linear.x
    robot_desired_vel[1] = data.angular.z


ac_movebase = None 
move_base_running = False

def exec_movebase(gx, gy, gth_deg):
    global ac_movebase, move_base_running
    if (ac_movebase == None):
        ac_movebase = actionlib.SimpleActionClient(ACTION_move_base,MoveBaseAction)
    ac_movebase.wait_for_server()

    goal = MoveBaseGoal()
    goal.target_pose.header.frame_id = FRAME_map
    goal.target_pose.header.stamp = rospy.Time.now()
    goal.target_pose.pose.position.x = gx
    goal.target_pose.pose.position.y = gy
    yaw = gth_deg/180.0*math.pi
    q = tf.transformations.quaternion_from_euler(0, 0, yaw)
    goal.target_pose.pose.orientation = Quaternion(q[0],q[1],q[2],q[3])

    ac_movebase.send_goal(goal)
    move_base_running = True
    print('Moving to %.2f %.2f %.2f' %(gx,gy,gth_deg))

    ac_movebase.wait_for_result()  # blocking until goal is reached

    print('Move action completed.')
    move_base_running = False


def stop_movebase():
    global ac_movebase, move_base_running
    if (ac_movebase == None):
        ac_movebase = actionlib.SimpleActionClient('move_base',MoveBaseAction)
    try:
        ac_movebase.wait_for_server()
        print('Cancel move_base goal')
        ac_movebase.cancel_all_goals()
    except:
        pass
    move_base_running = False


thr_movebase = None
quit_request = False

def start_movebase(tpose):
    global thr_movebase, target_pose
    target_pose = tpose
    thr_movebase = Thread(target=exec_movebase, args=(target_pose[0], target_pose[1], target_pose[2],))
    thr_movebase.start()


def join_movebase():
    global thr_movebase
    thr_movebase.join()
    thr_movebase = None


def log_current_state():
    global map_robot_pose, target_pose, robot_vel, log_pgv
    get_robot_pose() # set map_robot_pose
    
    #define current log    
    log_curr = [map_robot_pose[0],map_robot_pose[1],map_robot_pose[2],
          target_pose[0],target_pose[1],target_pose[2],
          robot_vel[0],robot_vel[1]]
    
    #update the log list of lists     
    log_pgv.append(log_curr)

def empty_log_buffer():
    global log_pgv, log_recovery
    log_pgv = []
    log_recovery = []

def save_recovery_situation():
    global map_robot_pose, target_pose
    global robot_vel, robot_desired_vel
    global log_recovery
    
    log_recovery_curr = [map_robot_pose[0],map_robot_pose[1],map_robot_pose[2],
          target_pose[0],target_pose[1],target_pose[2]]

    log_recovery.append(log_recovery_curr)

    print('    %.1f,%.1f,%.1f, %.1f,%.1f,%.1f, %.2f,%.2f, %.2f,%.2f' 
        %(map_robot_pose[0],map_robot_pose[1],map_robot_pose[2],
            target_pose[0],target_pose[1],target_pose[2],
            robot_vel[0],robot_vel[1],robot_desired_vel[0],robot_desired_vel[1]))


def do_recovery():
    save_recovery_situation()
    print('  *** recovery: standard nav for 5 seconds ***')
    rospy.set_param(PARAM_obstNear, False)
    rate2 = rospy.Rate(1) # Hz
    for i in range(0,5):
        rate2.sleep()
    rospy.set_param(PARAM_obstNear, True)
    print('  *** recovery: stealth nav ***')


quit_request = False

def doSleep(rate):
    global move_base_running, quit_request      
    try:
        rate.sleep()
    except:
        quit_request = True
        move_base_running = False


def write2file(path):
    global log_pgv,log_recovery
    print("Appending position-goal-velocity log of last goal to specified input file ...")

    with open(path,"a") as f:
        for outs in log_pgv:
            for value in outs:
                f.write("%.2f " % value)
            f.write("\n")

    file_list = os.path.splitext(path)
    recovery_file = file_list[0] + "_recovery" + file_list[1]

    print("Appending recovery log to file \"filename_recovery.extension\" ...")
    with open(recovery_file,"a") as f:
        for outs in log_recovery:
            for value in outs:
                f.write("%.2f " % value)
            f.write("\n")


def reach_starting_pose(starting_pose):
    global quit_request, move_base_running
    
    start_movebase(starting_pose)

    # wait until move_base is actually started
    delay = 0.25 # sec
    rate = rospy.Rate(1/delay) # Hz
    print('wait until move_base is actually started')
    while not move_base_running:
        doSleep(rate)

    # Phase 1: normal nav for 5 seconds
    print('standard navigation for reaching starting pose')
    rospy.set_param(PARAM_obstNear, False)
    rate2 = rospy.Rate(1) # Hz

    while move_base_running and not rospy.is_shutdown() and dist_from_goal()>0.5:
        doSleep(rate)
    
    stop_movebase()
    print("reached starting pose")
    join_movebase()


# Reach target pose through adaptive navigation
def adaptive_nav(target_pose):
    global quit_request, move_base_running

    start_movebase(target_pose)

    # wait until move_base is actually started
    delay = 0.25 # sec
    rate = rospy.Rate(1/delay) # Hz
    print('0. wait until move_base is actually started')
    while not move_base_running:
        doSleep(rate)

    # Phase 1: normal nav for 5 seconds
    print('1. standard navigation (5 seconds)')
    rospy.set_param(PARAM_obstNear, False)
    rate2 = rospy.Rate(1) # Hz

    #no recovery situation
    
    for i in range(0,5):
        doSleep(rate2)

    # Phase 2: adaptive nav until 5 meters from the goal
    print('2. adaptive navigation (until 5 meters from goal)')
    rospy.set_param(PARAM_obstNear, True)
    count_slow = 0
    while move_base_running and not rospy.is_shutdown() and dist_from_goal()>5.0:
        # check
        if robot_vel[0]<0.1:
            count_slow += 1
            #if count_slow>7:
            #    print('  --DEBUG-- tv = %.2f  (%d)' %(robot_vel[0],count_slow))
            if count_slow>10:
                do_recovery()
        else:
            count_slow = 0
        doSleep(rate)

    # Phase 3: normal nav until the goal
    print('3. standard navigation (until goal)')
    rospy.set_param(PARAM_obstNear, False)
    
    while move_base_running and not rospy.is_shutdown() and dist_from_goal()>0.5:
        doSleep(rate)

    stop_movebase()

    join_movebase()


# main
if __name__ == "__main__":

    parser = argparse.ArgumentParser(description='obstacle nearness navigation',formatter_class=RawTextHelpFormatter)
    parser.add_argument('do_log', type=bool, help='Type True for log recording, False otherwise.')
    parser.add_argument('path', type=str, help='Path to the file where the robot position-goal-velocity log is written. For the recovery log a file \"filename_recovery.extension\" is created. Write any character if do_log is set to False.')
    parser.add_argument('seed', type=int, help='Enter a seed for the reproducibility of the experiment.')
    parser.add_argument('n_goals', type=int, help='Enter the number of goals that must be reached in random modality. Put any number for the other modalities.')
    requiredNamed = parser.add_argument_group('arguments required for task selection')
    requiredNamed.add_argument('-g','--goal_list', type=float, nargs='+', action='append', help='First case: \n - Write a \"list of lists\" of values on terminal as: -g StartX StartY StartTH -g GoalX GoalY GoalTH to drive the robot from an initial pose Start to a final pose Goal. If the robot is not at Start, it will navigate (normally) to Start and then it will perform the task. \n Second case: \n - Write a \"list of lists\" of values on terminal as: -g nan -g GoalX GoalY GoalTH to drive the robot from an initial random pose nan selected from a predifined set to a final pose Goal. If the robot is not at Start, it will navigate (normally) to nan and then it will perform the task. \n Third case: \n- Write a \"list of lists\" of values on terminal as: -g nan -g nan to continuously drive the robot from an initial random pose nan selected from a predifined set to a final random pose nan (again predifined). The robot in this case will directly start from its current pose.')
    
    #parse the arguments
    args = parser.parse_args()
    doLog = args.do_log
    path = args.path
    s = args.seed
    goal_list = args.goal_list
    num_goals = args.n_goals 
    #set the seed
    random.seed(s)

    #target_pose = [args.GX,args.GY,args.GTH]

    rospy.init_node('obstacle_nav', disable_signals=True)

    listener = tf.TransformListener()
    odom_sub = rospy.Subscriber(TOPIC_odom, Odometry, odom_cb)
    cmd_vel_sub = rospy.Subscriber(TOPIC_cmd_vel, Twist, cmdvel_cb)
    desired_cmd_vel_sub = rospy.Subscriber(TOPIC_desired_cmd_vel, Twist, desired_cmdvel_cb)

    # labirinto
    target_poses = [[2,2,0], [90,2,0], [98,48,0], [2,48,0], [42,24,0], [59,22,0],
                   [70,10,0], [18,20,0], [12,47,0], [66,45,0], [14,7,0]]

    # saman
    #target_poses = [[-2, 8, 0], [15,6,0], [14,-3,0], [5,5,0], [0,0,0]]
    
    count_goals = 0

    while not quit_request:
        
        #if input sub-lists contain only nans, go for continual random navigation
        if math.isnan(goal_list[0][0]) and math.isnan(goal_list[1][0]):

            print("Continual navigation -- Random goals")
            target_pose = random.choice(target_poses)
            adaptive_nav(target_pose)
            count_goals += 1
            if doLog == True:
                write2file(path)
                empty_log_buffer()

            if count_goals == num_goals:
                print("Reached the number of goals specified by the user")
                quit_request = True

        else:
            #if the first sublist is contains only nan, select a random starting point and the robot will pursue the specified goal
            t_pose = goal_list[1]
            if math.isnan(goal_list[0][0]):

                print("Random starting pose (reaching ...) -- Defined goal")
                s_pose = random.choice(target_poses)
                reach_starting_pose(s_pose)
                print("Starting adaptive navigation")
                adaptive_nav(t_pose)
                quit_request = True

            else:
                print("Defined starting pose (reaching ...) -- Defined goal")
                s_pose = goal_list[0]
                reach_starting_pose(s_pose)
                print("Starting adaptive navigation")
                adaptive_nav(t_pose)
                quit_request = True

            if doLog == True:
                write2file(path)
                

    odom_sub.unregister()
    cmd_vel_sub.unregister()
    desired_cmd_vel_sub.unregister()

    print('Quit')




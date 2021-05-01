#include <ros/ros.h>
#include <sensor_msgs/Joy.h>
#include <geometry_msgs/Twist.h>
#include <stdio.h>
using namespace std;

#define PS3_BUTTON_SELECT            0
#define PS3_BUTTON_STICK_LEFT        1
#define PS3_BUTTON_STICK_RIGHT       2
#define PS3_BUTTON_START             3
#define PS3_BUTTON_CROSS_UP          4
#define PS3_BUTTON_CROSS_RIGHT       5
#define PS3_BUTTON_CROSS_DOWN        6
#define PS3_BUTTON_CROSS_LEFT        7
#define PS3_BUTTON_REAR_LEFT_2       8
#define PS3_BUTTON_REAR_RIGHT_2      9
#define PS3_BUTTON_REAR_LEFT_1       10
#define PS3_BUTTON_REAR_RIGHT_1      11
#define PS3_BUTTON_ACTION_TRIANGLE   12
#define PS3_BUTTON_ACTION_CIRCLE     13
#define PS3_BUTTON_ACTION_CROSS      14
#define PS3_BUTTON_ACTION_SQUARE     15
#define PS3_BUTTON_PAIRING           16

#define PS3_AXIS_STICK_LEFT_LEFTWARDS    0
#define PS3_AXIS_STICK_LEFT_UPWARDS      1
#define PS3_AXIS_STICK_RIGHT_LEFTWARDS   2
#define PS3_AXIS_STICK_RIGHT_UPWARDS     3
#define PS3_AXIS_BUTTON_CROSS_UP         4
#define PS3_AXIS_BUTTON_CROSS_RIGHT      5
#define PS3_AXIS_BUTTON_CROSS_DOWN       6
#define PS3_AXIS_BUTTON_CROSS_LEFT       7
#define PS3_AXIS_BUTTON_REAR_LEFT_2      8
#define PS3_AXIS_BUTTON_REAR_RIGHT_2     9
#define PS3_AXIS_BUTTON_REAR_LEFT_1      10
#define PS3_AXIS_BUTTON_REAR_RIGHT_1     11
#define PS3_AXIS_BUTTON_ACTION_TRIANGLE  12
#define PS3_AXIS_BUTTON_ACTION_CIRCLE    13
#define PS3_AXIS_BUTTON_ACTION_CROSS     14
#define PS3_AXIS_BUTTON_ACTION_SQUARE    15
#define PS3_AXIS_ACCELEROMETER_LEFT      16
#define PS3_AXIS_ACCELEROMETER_FORWARD   17
#define PS3_AXIS_ACCELEROMETER_UP        18
#define PS3_AXIS_GYRO_YAW                19

#define LOGITECH_BUTTON_BLUE 0
#define LOGITECH_BUTTON_GREEN 1
#define LOGITECH_BUTTON_RED 2
#define LOGITECH_BUTTON_YELLOW 3
#define LOGITECH_BUTTON_LB 4
#define LOGITECH_BUTTON_RB 5
#define LOGITECH_BUTTON_LT 6
#define LOGITECH_BUTTON_RT 7
#define LOGITECH_BUTTON_BACK 8
#define LOGITECH_BUTTON_START 9



sensor_msgs::Joy joy;
geometry_msgs::Twist vel;
ros::Publisher pub;

static long cnt = 0;
static long cnt_zero = 0; // how many consecutive (0,0) values sent
static double max_vel_x, max_vel_theta;

void joyCallback(const sensor_msgs::Joy::ConstPtr& msg)
{
    vel.linear.x=msg->axes[PS3_AXIS_STICK_LEFT_UPWARDS]*max_vel_x;
    
    //if(msg->axes[PS3_AXIS_BUTTON_REAR_RIGHT_2]<-.05) vel.linear.x*=1-msg->axes[PS3_AXIS_BUTTON_REAR_RIGHT_2]*2;
    //std::cout<<msg->axes[PS3_AXIS_BUTTON_REAR_RIGHT_2]<<std::endl;
    
    vel.angular.z=msg->axes[PS3_AXIS_STICK_RIGHT_LEFTWARDS]*max_vel_theta;

    if ((fabs(vel.linear.x)<1e-3) && (fabs(vel.angular.z)<1e-3)) {
        vel.linear.x = 0;
        vel.angular.z = 0;
    }

    // cout << " -- " << vel.linear.x << " " << vel.angular.z << " " << cnt_zero << endl;

    if(msg->buttons[LOGITECH_BUTTON_RB]) {
      ROS_WARN("!!!Emergency Stop!!!");
      ros::param::set("emergency_stop", 1);
    }
    else if(msg->buttons[LOGITECH_BUTTON_RT]) {
      ROS_WARN("Emergency Stop RELEASE");
      ros::param::set("emergency_stop", 0);
    }
    else if(msg->buttons[LOGITECH_BUTTON_LB]) {
      ROS_WARN("!!!Joystick Override Active!!! Other controllers will be ignored");
      ros::param::set("use_only_joystick", 1);
    }
    else if(msg->buttons[LOGITECH_BUTTON_LT]) {
      ROS_WARN("Joystick Override Disactivated");
      ros::param::set("use_only_joystick", 0);
    }
    
    //cout << "Received message: " << msg->header.stamp.toSec() << " n." << cnt++ << endl;;
//     cout << msg->axes[PS3_AXIS_BUTTON_REAR_RIGHT_2] << endl;
}


int main(int argc, char **argv)
{
    ros::init(argc, argv, "joystick_control");

    ros::NodeHandle n, pn("~");

    pn.param("max_vel_x", max_vel_x, 1.0);
    pn.param("max_vel_th", max_vel_theta, 1.0);

    pub = n.advertise<geometry_msgs::Twist>("joystick_cmd_vel", 1);
    
    ros::Subscriber joy_sub = n.subscribe<sensor_msgs::Joy>("joy", 1, joyCallback);
    //ros::spin();

    int fps=50;
    ros::Rate loop_rate(fps);
    ros::AsyncSpinner spinner(1); // n threads
    spinner.start();
    while(n.ok()){
        if ((fabs(vel.linear.x)<1e-3) && (fabs(vel.angular.z)<1e-3) &&
            (cnt_zero<1000))  // to avoid overflow
            cnt_zero++;
        else {
            cnt_zero = 0;
        }
        if (cnt_zero<50) // don't publish 0,0 more than n times
            pub.publish(vel);  // always publish (to avoid interrupts when joy does not publish non-changing values
        loop_rate.sleep();
    }

    return 0;
}


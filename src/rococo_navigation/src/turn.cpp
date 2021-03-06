#include <boost/thread/thread.hpp>
#include <boost/interprocess/sync/scoped_lock.hpp>

#include <actionlib/server/simple_action_server.h>
#include <actionlib/client/simple_action_client.h>
#include <geometry_msgs/Twist.h>

#include <rococo_navigation/TurnAction.h>

#define RAD(a) ((a)/180.0*M_PI)
#define DEG(a) ((a)*180.0/M_PI)


// defined in robotpose.cpp
bool getRobotPose(std::string robotname, double &x, double &y, double &th_rad);


inline double norm180(double a) {
  while (a>180) a = a-360;
  while (a<=-180) a = a+360;
  return a;
}

inline double normPI(double a) {
  while (a>M_PI) a = a-2*M_PI;
  while (a<=-M_PI) a = a+2*M_PI;
  return a;
}

inline double norm360(double a) {
  while (a>=360) a = a-360;
  while (a<=-360) a = a+360;
  return a;
}

#define DEBUG 0

void doTurn(std::string robot_name, ros::Publisher &cmd_vel_pub, double target_angle_deg, 
            std::string absolute_relative_flag, double max_ang_vel_deg, bool *run)
{
    ROS_INFO_STREAM("Action turn: executing ...");
    geometry_msgs::Twist cmd;
    cmd.linear.x = 0; cmd.linear.y = 0; 

    double x,y,th_rad,th_deg,max_ang_vel,target_angle;

    while (*run && !getRobotPose(robot_name,x,y,th_rad)) {
      ROS_ERROR_STREAM("Turn:: Cannot read robot pose!!!");
      ros::Duration(0.25).sleep();
    }
    th_deg=DEG(th_rad); max_ang_vel=RAD(max_ang_vel_deg);

    if (absolute_relative_flag=="REL") {
        target_angle_deg = th_deg + target_angle_deg;
    }
    target_angle = RAD(target_angle_deg);
#if DEBUG
    printf("Robot pose: %.1f %.1f %.3f - Target: %.3f\n",x,y,th_rad,target_angle);
#endif
    double Kp=1.0;
    double min_diff_angle=RAD(5); // rad
    double adist = normPI(target_angle-th_rad); // rad
    while (*run && fabs(adist)>min_diff_angle) {
        cmd.angular.z = std::min(Kp*adist, max_ang_vel);
#if DEBUG
        printf("  -- Robot pose: %.1f %.1f %.3f - Target: %.3f - adist: %.3f - avel: %.3f\n", x,y,th_rad,target_angle,adist,cmd.angular.z);
#endif
        cmd_vel_pub.publish(cmd);
        ros::Duration(0.1).sleep(); // wait ...    
        if (getRobotPose(robot_name,x,y,th_rad))
          adist = normPI(target_angle-th_rad); // rad
        else
          adist -= max_ang_vel/10;
    }

    cmd.angular.z = 0;
    cmd_vel_pub.publish(cmd);
    ros::Duration(0.1).sleep(); // wait ...    

    ROS_INFO_STREAM("Action turn: finished");
}

// ********************    S E R V E R    ***********************

class TurnActionServer {

protected:

    ros::NodeHandle nh;
    ros::Publisher cmd_vel_pub;
    std::string action_name, robot_name;
    
    actionlib::SimpleActionServer<rococo_navigation::TurnAction> turn_server;


public:

    TurnActionServer(std::string _action_name, std::string _robot_name) : 
        action_name(_action_name), robot_name(_robot_name),
        turn_server(nh, action_name, boost::bind(&TurnActionServer::executeCB, this, _1), false)
    { 
        //set up the publisher for the cmd_vel topic
        cmd_vel_pub = nh.advertise<geometry_msgs::Twist>("cmd_vel", 1);
    }

    ~TurnActionServer() { }

    void start() {
        // Start the server
        turn_server.start();
        ROS_INFO_STREAM("Turn Action Server started!!!"); 
    }

    void executeCB(const rococo_navigation::TurnGoalConstPtr& goal)  {   
      // Run action (wait until it finishes)
      ROS_INFO_STREAM("Starting action: robot " << robot_name << " turn " << goal->target_angle << " " << 
              goal->absolute_relative_flag << " " << goal->max_ang_vel);

      bool run = true;

      //doTurn(robot_name,cmd_vel_pub,goal->target_angle, goal->absolute_relative_flag, goal->max_ang_vel);

      // start in a new thread
      boost::thread t(
            boost::bind(&doTurn, _1, _2, _3, _4, _5, _6),
              robot_name, cmd_vel_pub,goal->target_angle, goal->absolute_relative_flag, goal->max_ang_vel, &run);
       

      boost::this_thread::sleep(boost::posix_time::milliseconds(200));
      
      while (run && !t.timed_join(boost::posix_time::milliseconds(200))) {
        if (turn_server.isPreemptRequested() || !ros::ok()) {
          ROS_INFO("Request to cancel the goal.");
          run = false;
	      }
      }      

      // Set result
      if (run)
        turn_server.setSucceeded();
      else
        turn_server.setAborted();

      // wait for actual delivery...
      ros::Duration(0.1).sleep();

    }
};


// ********************    C L I E N T    ***********************

void turn_action_client(std::string robotname, double GTh, std::string absrel) {

    // Set turn topic
    std::string turn_topic = "/"+robotname+"/turn";

    // Define the action client (true: we want to spin a thread)
    actionlib::SimpleActionClient<rococo_navigation::TurnAction> ac(turn_topic, true);  

    // Wait for the action server to come up
    while(!ac.waitForServer(ros::Duration(5.0))){
        ROS_INFO("Waiting for turn action server to come up");
    }

    // Cancel all goals (JUST IN CASE SOME GOAL WAS NOT CLOSED BEFORE)
    ac.cancelAllGoals(); ros::Duration(1).sleep(); // wait 1 sec

    // Set the goal
    rococo_navigation::TurnGoal goal;
    goal.target_angle = GTh;  // deg
    goal.absolute_relative_flag = absrel;
    goal.max_ang_vel = 45.0;  // deg/s

    // Send the goal
    ROS_INFO("Turn: sending goal %.1f %s",GTh,absrel.c_str());
    ac.sendGoal(goal);

    // Wait for termination
    while (!ac.waitForResult(ros::Duration(1.0))) {
	    ROS_INFO_STREAM("Turn... [" << ac.getState().toString() << "]");
    }
    ROS_INFO_STREAM("Finished [" << ac.getState().toString() << "]");

    // Print result
    if (ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
        ROS_INFO("Turn successful");
    else
        ROS_INFO("Turn failed");

    // Cancel all goals (NEEDED TO ISSUE NEW GOALS LATER)
    ac.cancelAllGoals(); ros::Duration(1).sleep(); // wait 1 sec

}



// **********************    M A I N    *************************


int main(int argc, char** argv)  {

  if ( (argc<2) || ((std::string(argv[1])=="-client") && (argc<4)) ) {
  	std::cout << "Use: " << argv[0] << " -server <robotname>" << std::endl; 
  	std::cout << "  or " << argv[0] << " -client <robotname> <Theta [DEG]> <ABS|REL>" << std::endl; 
    exit(-1);
  }

  if (std::string(argv[1])=="-server") {
      std::string robotname = std::string(argv[2]);
      // Init ROS node
      ros::init(argc, argv, "turn_action_server");   
      // Start action server  
      TurnActionServer server("turn",robotname);
      server.start();
      ros::spin();
  }
  else if (std::string(argv[1])=="-client") {
      // Read args
      std::string robotname = std::string(argv[2]);
      double GTh = atof(argv[3]);
      std::string absrel = std::string(argv[4]);
      // Init ROS node
      std::ostringstream ss;
      ss << "turn_" << robotname << "_" << fabs(GTh);
      std::string nodename = ss.str();
      ros::init(argc, argv, nodename);
      // Start client
      turn_action_client(robotname,GTh,absrel);
  }
  return 0;
}


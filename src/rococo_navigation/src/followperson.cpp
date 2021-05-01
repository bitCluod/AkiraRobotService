#include <boost/thread/thread.hpp>
#include <boost/interprocess/sync/scoped_lock.hpp>

#include <tf/transform_listener.h>
#include <tf/transform_datatypes.h>
#include <actionlib/server/simple_action_server.h>
#include <actionlib/client/simple_action_client.h>
#include <geometry_msgs/Twist.h>
#include <sensor_msgs/LaserScan.h>

#include <rococo_navigation/FollowPersonAction.h>
#include <laser_analysis/LaserObstacleMap.h>
#include <spencer_tracking_msgs/DetectedPerson.h>

#define TOPIC_PERSON_DETECTED "/person_detected"
#define ACTION_FOLLOW_PERSON "follow_person"
#define TOPIC_LASER_OBSTACLE_MAP "/laser_obstacle_map"
#define TOPIC_LASER_PEPPER "/scan_filtered"
#define TOPIC_CMD_VEL "/cmd_vel"
#define FRAME_CAMERA "base_laser"
#define FRAME_BASE "base_link"

#define RAD(a) ((a)/180.0*M_PI)
#define DEG(a) ((a)*180.0/M_PI)

// Social space thresholds
#define PERSONAL_DISTANCE 1.2 //1.2
#define SOCIAL_DISTANCE 3.6 //3.6


// defined in robotpose.cpp
bool getRobotPose(std::string robot_name, double &x, double &y, double &th_rad);


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

// round angle to 0, PI/2, -PI/2, PI
inline double roundPI2(double a) {
    if ((a>=-M_PI/4 && a<=M_PI/4) || (a>=7*M_PI/4 && a<=2*M_PI))
        return 0;
    else if (a>=M_PI/4 && a<=3*M_PI/4)
        return M_PI/2;
    else if ((a>=3*M_PI/4 && a<=5*M_PI/4) || (a>=-M_PI && a<=-3*M_PI/4))
        return M_PI;
    else if ((a>=5*M_PI/4 && a<=7*M_PI/4) || (a>=-3*M_PI/4 && a<=-M_PI/4))
        return -M_PI/2;
}	


// ROS node handler ptr
ros::NodeHandle*  nh_ptr = NULL;

// GLOBAL VARIABLES

// position of the person to follow (relative to robot orientation)
// x: in front of the robot, y: side displacement
// stamp: time of last detection

double person_x=0, person_y=0;
ros::Time person_stamp = ros::Time(0);



void laser_obstacle_map_callback(const laser_analysis::LaserObstacleMap::ConstPtr& msg)
{
    //if (msg->npoints>2) 
    //  ROS_INFO_STREAM("Obstacle detected: " << msg->npoints << " " << msg->mx << " " << msg->my << " " << msg->var);
    
    // person_x=0; person_y=0;
    
    if (msg->npoints>2 && msg->npoints<20 && fabs(msg->my)<1.0 /*&& msg->var<1.0*/) {
      person_x=msg->mx; person_y=msg->my; person_stamp = ros::Time::now();
      // ROS_INFO("PERSON DETECTED %.1f %.1f!!!",person_x,person_y);
    }
    
}        


#define PEPPER_LASER_INDEX_BEGIN 23
#define PEPPER_LASER_INDEX_END   38


// callback for TOPIC_LASER_PEPPER
void laserPepperCallback(const sensor_msgs::LaserScan::ConstPtr& msg) {

    // cout << "laser Pepper: " << msg << endl;

	if (nh_ptr == NULL) return;

    // read parameters
	std::string robotname;
    int min_points;
    double max_dist;
    nh_ptr->param<std::string>("robot_name",robotname,std::string("diago")); //diago
	nh_ptr->param<int>("/"+robotname+"/PNPconditions/params/laser_obstacle_min_points", min_points, 2);
	nh_ptr->param<double>("/"+robotname+"/PNPconditions/params/laser_obstacle_max_dist", max_dist, 2.0);

	int cnt=0;	double rmin=99.9;
	for (int i=PEPPER_LASER_INDEX_BEGIN; i<PEPPER_LASER_INDEX_END; i++) {
    	double r = msg->ranges[i];
		if (r<max_dist) { cnt++; }
		rmin = std::min(rmin, r);
	}

    person_x=0; person_y=0;

	bool r = (cnt>=min_points);

	if (r)  {
    	person_x=rmin; person_stamp = ros::Time::now();
    }

}

tf::TransformListener *tl = NULL;

void personDetectedCallback(const spencer_tracking_msgs::DetectedPerson::ConstPtr& msg) {

    geometry_msgs::Point p = msg->pose.pose.position;
    ROS_DEBUG_STREAM("person detected " << p);

    std::string src_frame = FRAME_CAMERA;
    std::string target_frame = FRAME_BASE;

    geometry_msgs::PointStamped psin, psout;
    psin.point = p;
    psin.header.stamp = ros::Time(0);  // last transform available
    psin.header.frame_id = src_frame;

    if (tl == NULL)
        tl = new tf::TransformListener();

    tl->waitForTransform(src_frame, target_frame, ros::Time(0), ros::Duration(3));  // last transform available

    tl->transformPoint(target_frame, psin, psout);

    geometry_msgs::Point p2 = psout.point;
    // std::cout << "person detected base frame " << p2 << std::endl;

    person_x=p2.x; person_y=p2.y; person_stamp = ros::Time::now();
}

#if 0
// This function is to turn around the corner in DIAG_B1 map
void DIAG_B1_corridor_trick(double x, double y, double &target_angle, double &velp) {
	bool turning_l=false, turning_r=false;

	// left to up
	if ((target_angle==M_PI) && x<3.5 && y<3.5) {
	  //std::cout << "+++ follow person changing target angle to PI/2" << std::endl;
	  turning_l=true;
	}
	if (turning_l && x<2.0)
	  target_angle=M_PI/2;
	if (x>3.5 || y>3.5) {
	  turning_l=false;
	}
	// down to right
	if ((target_angle==-M_PI/2) && x<3.5 && y<3.5) {
	  //std::cout << "+++ follow person changing target angle to PI/2" << std::endl;
	  turning_r=true;
	}
	if (turning_r && y<2.5)
	  target_angle=0;
	if (x>3.5 || y>3.5) {
	  turning_r=false;
	}

	if (turning_l || turning_r) {
    	velp=0.5;
    }

	velp=1.0;
}
#endif
        

void doFollowPerson(std::string robot_name, ros::Publisher &cmd_vel_pub, int person_id, double max_vel, bool follow_in_corridor, bool *run)
{
    ROS_INFO("Action follow person id:%d maxvel:%.2f running ...", person_id, max_vel);

    geometry_msgs::Twist cmd;
    cmd.linear.x = 0; cmd.linear.y = 0; 

    double rx,ry,rth_rad,rth_deg,target_angle;
    double max_ang_vel = RAD(30);
    double min_vel = max_vel/4;
    double Kp_ang=1.0, adist=0.0;

    if (follow_in_corridor) {
        while (*run && !getRobotPose(robot_name,rx,ry,rth_rad)) {
          ROS_ERROR_STREAM("Cannot read robot pose!!!");
          ros::Duration(0.25).sleep();
        }

        // preferred target_angle: absolute radians
        rth_deg=DEG(rth_rad);
        target_angle = roundPI2(rth_rad); // rad
    }

    double min_distance=PERSONAL_DISTANCE, max_distance=SOCIAL_DISTANCE;
    double slowdown_distance = (max_distance - min_distance)/2;
    
    while (*run) {

      cmd.linear.x = 0;
      cmd.angular.z = 0;

      uint32_t d = ros::Time::now().sec - person_stamp.sec;

      if (d>3) { // stop on old readings
        cmd_vel_pub.publish(cmd);
        ros::Duration(0.1).sleep(); // wait ...
        continue;
      }

      if (person_x<0.01) { // too close -> stop and ignore
        cmd_vel_pub.publish(cmd);
        ros::Duration(0.1).sleep(); // wait ...
        continue;
      }

      // ROS_INFO("PERSON DETECTED %.1f %.1f (%d)!!!",person_x,person_y,d);

      if (person_x>min_distance && person_x<max_distance) {
        // set linear speed
        double dd = std::min(1.0,(person_x-min_distance)/(slowdown_distance-min_distance));
        cmd.linear.x = dd * max_vel; // slow down when close to target
      }
      else if (person_x<min_distance/2) {
        // set linear speed
        cmd.linear.x = -min_vel; // go back when too close to target
      }
      
      if (cmd.linear.x >= 0) { // move forward

          if (follow_in_corridor) {
              if (getRobotPose(robot_name,rx,ry,rth_rad)) {
                  adist = normPI(target_angle-rth_rad); // rad
                  double velp=1.0;
                  // DIAG_B1_corridor_trick(x,y,target_angle, velp);
                  cmd.linear.x *= velp;
              }
              else {
                  // just in case slow down angular vel
                  if (adist>0)
                    adist -= max_ang_vel/10;
                  else if (adist<0)
                    adist += max_ang_vel/10;
              }
          }
          else {
              adist = atan2(person_y,person_x);
          }


          double sign = (adist>0)?1:-1;

          if (fabs(adist)>RAD(30)) // reduce speed when turning towards the goal
            cmd.linear.x = min_vel;
          
          cmd.angular.z = sign * std::min(Kp_ang*fabs(adist), max_ang_vel);
          // printf("  -- Robot pose: %.1f %.1f %.3f - Target: %.2f %.2f  - adist: %.3f - cmd: %.3f %.3f \n", rx,ry,rth_rad,person_x,person_y,adist,cmd.linear.x,cmd.angular.z);

          if (fabs(cmd.angular.z)<0.01) cmd.angular.z=0.0; // avoid small rotations

      } // if move forward


      if (false && fabs(cmd.linear.x+cmd.angular.z)>0.01) {
        ROS_INFO("  -- Target: %.2f %.2f  - adist: %.3f deg - cmd: %.3f %.3f", 
                person_x,person_y,DEG(adist),cmd.linear.x,cmd.angular.z);

      }

      cmd_vel_pub.publish(cmd);

      ros::Duration(0.1).sleep(); // wait ...
    
    }

    cmd.linear.x = 0;
    cmd.angular.z = 0;
    cmd_vel_pub.publish(cmd);
    ros::Duration(0.1).sleep(); // wait ...    

    ROS_INFO("Action follow Person: finished [run=%d]",*run);
}

// ********************    S E R V E R    ***********************


typedef actionlib::SimpleActionServer<rococo_navigation::FollowPersonAction> FPAS;

class FollowPersonActionServer {

protected:

    ros::NodeHandle nh;
    ros::Publisher cmd_vel_pub;
    std::string action_name, robot_name;
    boost::mutex state_mutex;
    bool follow_in_corridor; // if true the robot will keep orientations 0,90,180,270
    FPAS fc_server;

public:

    FollowPersonActionServer(std::string _action_name, std::string _robot_name) : 
        action_name(_action_name), robot_name(_robot_name),
        fc_server(nh, action_name, boost::bind(&FollowPersonActionServer::executeCB, this, _1), false)
    { 
        //set up the publisher for the cmd_vel topic
        cmd_vel_pub = nh.advertise<geometry_msgs::Twist>(TOPIC_CMD_VEL, 1);
    }

    ~FollowPersonActionServer() { }

    void start() {
        // Start the server
        fc_server.start();
        ROS_INFO_STREAM("FollowPerson Action Server started " << action_name << " !!!"); 
    }

    void executeCB(const rococo_navigation::FollowPersonGoalConstPtr& goal)  {   
      // Run action (wait until it finishes)
      ROS_INFO_STREAM("Starting action: robot " << robot_name << " follow Person " << 
            goal->person_id << " max vel: " << goal->max_vel << "m/s");
      
      follow_in_corridor = false;

      bool run = true;

      // start in a new thread
      boost::thread t(
            boost::bind(&doFollowPerson, _1, _2, _3, _4, _5, _6),
            robot_name,cmd_vel_pub,goal->person_id, goal->max_vel, follow_in_corridor, &run);
       

      boost::this_thread::sleep(boost::posix_time::milliseconds(2000));
      
      while (run && !t.timed_join(boost::posix_time::milliseconds(500))) {
	
	    if (fc_server.isPreemptRequested() || !ros::ok()) {
	      ROS_INFO("Request to cancel the goal.");
	      run = false;
	    }
	
      }
      
      ROS_INFO("Action finished.");
      // Set result
      if (run)
	    fc_server.setSucceeded();
      else
	    fc_server.setAborted();

      // wait for actual delivery...
      ros::Duration(1).sleep();

    }

};


// ********************    C L I E N T    ***********************

void fc_action_client(std::string robot_name, double max_vel) {

    // Set fp action name
    std::string fp_topic = ACTION_FOLLOW_PERSON;
    if (robot_name!="")
        fp_topic = "/"+robot_name+"/"+ACTION_FOLLOW_PERSON;

    // Define the action client (true: we want to spin a thread)
    actionlib::SimpleActionClient<rococo_navigation::FollowPersonAction> ac(fp_topic, true);  

    // Wait for the action server to come up
    while(!ac.waitForServer(ros::Duration(5.0)) && ros::ok()){
        ROS_INFO_STREAM("Waiting for follow person action server " << fp_topic << " ... ");
    }

    // Cancel all goals (JUST IN CASE SOME GOAL WAS NOT CLOSED BEFORE)
    ac.cancelAllGoals(); ros::Duration(1).sleep(); // wait 1 sec

    // Set the goal
    rococo_navigation::FollowPersonGoal goal;
    goal.person_id = 0;      // unused so far
    goal.max_vel = max_vel;  // m/s

    // Send the goal
    ROS_INFO("Sending goal");
    ac.sendGoal(goal);

#if 0
	// Wait for termination - BLOCKING
    while (!ac.waitForResult(ros::Duration(1.0)) && ros::ok()) {
	    ROS_INFO_STREAM("Running... [" << ac.getState().toString() << "]");
    }
    ROS_INFO_STREAM("Finished [" << ac.getState().toString() << "]");

    // Print result
    if (ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
        ROS_INFO("FollowPerson successful");
    else
        ROS_INFO("FollowPerson failed");

    // Cancel all goals (NEEDED TO ISSUE NEW GOALS LATER)
    ac.cancelAllGoals(); 
#endif

    ros::Duration(1).sleep(); // wait 1 sec

}


void fc_action_client_cancel_goal(std::string robot_name) {
    // Set fp action name
    
    std::string fp_topic = ACTION_FOLLOW_PERSON;
    if (robot_name!="")
        fp_topic = "/"+robot_name+"/"+ACTION_FOLLOW_PERSON;

    // Define the action client (true: we want to spin a thread)
    actionlib::SimpleActionClient<rococo_navigation::FollowPersonAction> ac(fp_topic, true);  

    // Wait for the action server to come up
    while(!ac.waitForServer(ros::Duration(5.0)) && ros::ok()){
        ROS_INFO_STREAM("Waiting for follow person action server " << fp_topic << " ... ");
    }

    // Cancel the goal
    ROS_INFO("Cancel goal");
    ac.cancelAllGoals();  ros::Duration(1).sleep(); // wait 1 sec

}

// **********************    M A I N    *************************

void usage(const char *argv0) {
  std::cout << "Use: " << argv0 << " -server [<robot_name>|none]" << std::endl; 
  std::cout << "  or " << argv0 << " -client [<robot_name>|none] [<max_vel>|stop] " << std::endl; 
  exit(1);
}

int main(int argc, char** argv)  {

  if ( (argc<2) || ((std::string(argv[1])=="-client") && (argc<4)) ) {
    usage(argv[0]);
  }

  if (std::string(argv[1])=="-server") {
      std::string robot_name = std::string(argv[2]);
      if (robot_name == "none") robot_name = "";
      // Init ROS node
      std::string node_name = std::string(ACTION_FOLLOW_PERSON)+std::string("_action_server");
      ros::init(argc, argv, node_name.c_str());
      ros::NodeHandle nh;
	  nh_ptr = &nh;
      // subscriber laser_obstacle_map
      ros::Subscriber lomSubscriber =
                nh.subscribe(TOPIC_LASER_OBSTACLE_MAP, 1, laser_obstacle_map_callback);
      ros::Subscriber laserPepperSubscriber =
                nh.subscribe(TOPIC_LASER_PEPPER, 1, laserPepperCallback);
      ros::Subscriber person_detect_sub =
                nh.subscribe(TOPIC_PERSON_DETECTED, 1, personDetectedCallback);
      // Print params
      ROS_INFO_STREAM("robot_name: " << robot_name);
      ROS_INFO_STREAM("action: " << ACTION_FOLLOW_PERSON);
      ROS_INFO_STREAM("[pub] cmd vel: " << TOPIC_CMD_VEL);
      ROS_INFO_STREAM("[sub] laser obstacle: " << TOPIC_LASER_OBSTACLE_MAP);
      ROS_INFO_STREAM("[sub] person detected: " << TOPIC_PERSON_DETECTED);

      // Start action server  
      FollowPersonActionServer server(ACTION_FOLLOW_PERSON,robot_name);
      server.start();
      ros::spin();
  }
  else if (std::string(argv[1])=="-client") {
      // Read args
      std::string robot_name = std::string(argv[2]);
      if (robot_name == "none") robot_name = "";
      if (std::string(argv[3])=="stop") {
	      // Init ROS node
	      std::ostringstream ss;
	      ss << ACTION_FOLLOW_PERSON << "_" << robot_name << "_stop";
	      std::string nodename = ss.str();
	      ros::init(argc, argv, nodename);
	      // Start client
	      fc_action_client_cancel_goal(robot_name);
      }
      else {
	      double max_vel = atof(argv[3]);
	      // Init ROS node
	      std::ostringstream ss;
	      ss << ACTION_FOLLOW_PERSON << "_" << robot_name;
	      std::string nodename = ss.str();
	      ros::init(argc, argv, nodename);
	      // Start client
	      fc_action_client(robot_name,max_vel);
      }
  }
  else 
    usage(argv[0]);

  return 0;

}


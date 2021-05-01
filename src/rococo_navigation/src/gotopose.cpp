#include <sstream>

#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>

typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;

#define radians(a) ((a)/180.0*M_PI)
#define degrees(a) ((a)*180.0/M_PI)

// defined in robotpose.cpp
bool getRobotPose(std::string robot_name, double &x, double &y, double &th_rad);



int main(int argc, char** argv){

  if (argc<5) {
  	std::cout << "Use: " << argv[0] << " <robot_name> <X> <Y> <Theta [DEG]>" << std::endl; 
    exit(-1);
  }

  std::string robot_name = std::string(argv[1]);
  double GX = atof(argv[2]), GY = atof(argv[3]), GTh = atof(argv[4]); // goal pose (th dedrees)
  double RX, RY, RTh_rad; // robot pose

  // Init ROS node
  std::ostringstream ss;
  ss << "gotopose_" << robot_name << "_" << (int)(fabs(GX)) << "_" << (int)(fabs(GY)) << "_" << (int)(fabs(GTh)); // '.' is not a valid char for a ROS node name !!!
  std::string nodename = ss.str();
  ros::init(argc, argv, nodename);

  // Set move_base topic
  std::string movebase_topic = "/"+robot_name+"/move_base";

  // Define the action client (true: we want to spin a thread)
  MoveBaseClient ac(movebase_topic, true);  

  // Wait for the action server to come up
  while(!ac.waitForServer(ros::Duration(5.0))){
    ROS_INFO("Waiting for move_base action server to come up");
  }

  // Read time
  double secs =ros::Time::now().toSec();
  while (secs==0) {  // NEEDED OTHERWISE CLOCK WILL BE 0 AND GOAL_ID IS NOT SET CORRECTLY
    //ROS_WARNING_STREAM("Time is null: " << ros::Time::now());
    ros::Duration(0.1).sleep();
	secs =ros::Time::now().toSec();
  }

  // Set the goal (MAP frame)
  move_base_msgs::MoveBaseGoal goal;

  goal.target_pose.header.frame_id = "/map";
  goal.target_pose.header.stamp = ros::Time::now();

  goal.target_pose.pose.position.x = GX;
  goal.target_pose.pose.position.y = GY;
  goal.target_pose.pose.orientation.z = sin(radians(GTh)/2);
  goal.target_pose.pose.orientation.w = cos(radians(GTh)/2);

  // Send the goal
  ROS_INFO("Sending goal %.1f %.1f %.1f",GX,GY,GTh);
  ac.sendGoal(goal);

  // Wait for termination
  while (!ac.waitForResult(ros::Duration(1.0))) {
      getRobotPose(robot_name,RX,RY,RTh_rad);
	  ROS_INFO("Goto R:(%.1f,%.1f,%.1f) -> G:(%.1f,%.1f,%.1f)",RX,RY,degrees(RTh_rad),GX,GY,GTh);
  }

  // Print result
  if (ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
     ROS_INFO("Hooray, the base reached the goal position.");
  else
     ROS_INFO("The base failed to reach the goal for some reason");

  return 0;
}


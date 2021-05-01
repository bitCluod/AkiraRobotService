#include <fstream>
#include <iomanip>
#include <cmath>
#include <cstring>

// ROS
#include <ros/ros.h>
#include <sensor_msgs/LaserScan.h>
#include <tf/transform_listener.h>

// BOOST
#include <boost/thread.hpp>
#include <boost/thread/mutex.hpp>

// PCL
#include <pcl/io/io.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/visualization/pcl_visualizer.h>
#include <pcl/visualization/point_cloud_handlers.h>
#include <pcl/sample_consensus/sac_model_line.h>

#include <laser_analysis/LaserObstacle.h>
#include <laser_analysis/LaserObstacleMap.h>
#include <spqrel_navigation/LocalizerRanges.h>

using namespace std;

// UTM-30
#define LASER_DATA_SIZE 1081
#define LASER_RANGE_MIN 20
#define LASER_ANGLE_INC (M_PI/(4*360))
#define LASER_ANGLE_MIN (-540.0*LASER_ANGLE_INC)



// Global variables

bool rosnode=true, gui=false;
string map_frame_id="map";
string laser_frame_id="base_laser";
char filename[255];
static boost::mutex cloud_mutex;
pcl::PointCloud<pcl::PointXYZRGB>::Ptr cloud (new pcl::PointCloud<pcl::PointXYZRGB>);
ros::Publisher obstaclePublisher,obstacleMapPublisher;
tf::TransformListener *listener=NULL;

double obst_dx_min=0.0, obst_dx_max=10.0, obst_dy_min=-1.0, obst_dy_max=1.0;  // detection area
double red_map_distance=0.75; // '< green': OK - '> red': detect 
double green_map_distance=red_map_distance/2;

struct RobotPose {
    double x,y,th;
};

RobotPose robotpose;



void setPoint(double x, double y, double z, uint8_t r, uint8_t g, uint8_t b, pcl::PointXYZRGB &point) {
    point.x = x;
    point.y = y;
    point.z = z;
    uint32_t rgb = (static_cast<uint32_t>(r) << 16 |
                    static_cast<uint32_t>(g) << 8 | static_cast<uint32_t>(b));
    point.rgb = *reinterpret_cast<float*>(&rgb);
}

void cloud_add(const vector<float> &vx, const vector<float> &vy) 
{
      cloud_mutex.lock();

      cloud->points.clear();
      pcl::PointXYZRGB point;
      for (size_t i=0; i<vx.size(); i++) {
          uint8_t r(255), g(255), b(255);
          if (vy[i]>obst_dy_min && vy[i]<obst_dy_max && vx[i]>obst_dx_min && vx[i]<obst_dx_max) {
            b=0; g=0;
          }
          setPoint(vx[i],vy[i],0.0,r,g,b,point);
          cloud->points.push_back(point);
      }

      cloud_mutex.unlock();
}


void cloud_add_ranges(const vector<float> &vx, const vector<float> &vy, const vector<float> &dist)
{
      cloud_mutex.lock();

      cloud->points.clear();
      pcl::PointXYZRGB point;
      for (size_t i=0; i<vx.size(); i++) {
          uint8_t r(255), g(255), b(255);
          bool in = (vx[i]>obst_dx_min && vx[i]<obst_dx_max && vy[i]>obst_dy_min && vy[i]<obst_dy_max);

          if (dist[i]<green_map_distance) {
            b=0; r=0; // green
          }
          else if (dist[i]<red_map_distance) {
            if (in)
                b=0; // yellow
            else
                b=128; // half yellow
          }
          else {
            if (in) {
              b=0; g=0; // red
            }
            else {
              b=128; g=128; // half red
            }   
          }
          setPoint(vx[i],vy[i],0.0,r,g,b,point);
          cloud->points.push_back(point);

      }

      cloud_mutex.unlock();
}



void getRobotPose()
{
    tf::StampedTransform transform;

    try {
        listener->waitForTransform(map_frame_id, laser_frame_id, ros::Time(0), ros::Duration(1.0) );
        listener->lookupTransform(map_frame_id, laser_frame_id, ros::Time(0), transform);
    } catch (tf::TransformException ex) {
        ROS_ERROR("laserobstacle: %s",ex.what());
	std::cout << laser_frame_id << std::endl;
    }

    tf::Quaternion q = transform.getRotation();
    double roll, pitch, yaw;
    tf::Matrix3x3(q).getRPY(roll, pitch, yaw);

    robotpose.x = transform.getOrigin().x();
    robotpose.y = transform.getOrigin().y();
    robotpose.th = yaw;
#if 0
    cout << "Robot pose:  x = " << robotpose.x <<
            "   y = " << robotpose.y <<
            "  th (deg) = " << RAD2DEG(robotpose.th) << endl << endl;
#endif
}

double roundPI2(double a) // round angle to 0, PI/2, -PI/2, PI
{
    if ((a>=-M_PI_4 && a<=M_PI_4) || (a>=7*M_PI_4 && a<=2*M_PI)) {
        return 0;
    }
    else if (a>=M_PI_4 && a<=3*M_PI_4) {
        return M_PI_2;
    }
    else if ((a>=3*M_PI_4 && a<=5*M_PI_4) || (a>=-M_PI && a<=-3*M_PI_4)) {
        return M_PI;
    }
    else if ((a>=5*M_PI_4 && a<=7*M_PI_4) || (a>=-3*M_PI_4 && a<=-M_PI_4)) {
        return -M_PI_2;
    }
    else // should be not possible...
    	return 0;
}

void computeVectors(const sensor_msgs::LaserScan::ConstPtr& msg,
                    vector<float> &vx, vector<float> &vy)
{
    double t=msg->angle_min, r, x, y;
    double theta=roundPI2(robotpose.th)-robotpose.th; // rad
    t-=theta;
    for (size_t i=0; i<msg->ranges.size(); i++) {
        if (msg->ranges[i]<msg->range_min) {
            r = msg->range_max; x=0; y=0;
        }
        else {
            r = msg->ranges[i];
            x = r * cos(t); y = r * sin(t);
            vx.push_back(x); vy.push_back(y);
        }
        t += msg->angle_increment;
    }
}

void rotateVectors(const vector<float> &xx, const vector<float> &yy, vector<float> &vx, vector<float> &vy)
{
    float x, y;
    getRobotPose();
    float theta=roundPI2(robotpose.th)-robotpose.th; // rad
    
    for (size_t i=0; i<xx.size(); i++) {
      
	float t = atan2(yy[i],xx[i]);
	t-=theta;
      
      /*
        if (msg->ranges[i]<msg->range_min) {
            r = msg->range_max; x=0; y=0;
        }
        else { */
            float r = sqrt(xx[i]*xx[i]+yy[i]*yy[i]);
            x = r * cos(t); y = r * sin(t);
            vx.push_back(x); vy.push_back(y);
        

    }
}

void check_obstacles_ranges(const vector<float> &vx, const vector<float> &vy, const vector<float> &dist)
{
	
	double mx=0,my=0,varx=0,vary=0,var=0,wmx=0,wmy=0,ww=0; int count=0;
    double x,y,d;
	for (size_t i=0; i<vx.size(); i++) {
        x = vx[i]; y = vy[i]; d = dist[i];
	    if (x>obst_dx_min && x<obst_dx_max && y>obst_dy_min && y<obst_dy_max) {
		// cout << "   " << dist[i] << "   ";
		    if (d>red_map_distance) {
			    mx += x; my += y;
			    wmx += x*d; wmy += y*d;
			    count++;
			    ww += d;
                // cout << "   " << vx[i] << "," << vy[i] << " dist:  " << dist[i] << endl;
		    }
	    }
        else if (d>red_map_distance) {
            // cout << "Discarded: " << vx[i] << "," << vy[i] << " dist:  " << dist[i] << endl;
        }
	}
	// cout << endl;
	if (count>0) {
		mx /= count; my /= count;
		wmx /= ww; wmy /= ww;

		for (size_t i=0; i<vx.size(); i++) {
            x = vx[i]; y = vy[i]; d = dist[i];
		    if (x>obst_dx_min && x<obst_dx_max && y>obst_dy_min && y<obst_dy_max) {
			    if (d>red_map_distance) {
				    varx += (x-mx)*(x-mx);
				    vary += (y-my)*(y-my);
			    }
		    }
		}
		varx /= count; vary /= count;
		var = (varx+vary)/2;
	}

#if 0
   cout << setprecision(2);
   cout << "Obstacle_range:: count: " << count << "  ";
   cout << " obs. center: " << mx << " " << my << endl;
#endif

    laser_analysis::LaserObstacleMap omsg;
    omsg.stamp = ros::Time::now();
    omsg.npoints = count;
    omsg.mx = mx; omsg.my = my; omsg.var = var;

    obstacleMapPublisher.publish(omsg);
}

void check_obstacles(const sensor_msgs::LaserScan::ConstPtr& msg)
{
    double t=msg->angle_min, r, x, y;
    int di=4, count=0;
    double x1=0, y1=0, x2=0, y2=0;
    bool first=true;
    double rmin=obst_dx_max;

    double theta=roundPI2(robotpose.th)-robotpose.th; // rad
    t-=theta;

    for (size_t i=0; i<msg->ranges.size(); i+=di) {
        if (msg->ranges[i]>msg->range_min) {
            r = msg->ranges[i];
            x = r * cos(t); y = r * sin(t);
            if (x>obst_dx_min && x<obst_dx_max && y>obst_dy_min && y<obst_dy_max) {
                count++;
                if (first)  {
                    x1 = x; y1 = y; first=false;
                }
                x2 = x; y2 = y;
                rmin = std::min(rmin,r);
            }
        }
        t += msg->angle_increment * di;
    }

    laser_analysis::LaserObstacle omsg;
    omsg.stamp = ros::Time::now();
    omsg.npoints = count;
    omsg.mindist=rmin; omsg.y1 = y1; omsg.y2 = y2;

    obstaclePublisher.publish(omsg);
}

void laserCallback(const sensor_msgs::LaserScan::ConstPtr& msg)
{
#if 0
    if (gui) {
        // show plain laser readings
        vector<float> vx,vy;
        computeVectors(msg,vx,vy);
        cloud_add(vx,vy);
    }
#endif
    // getRobotPose();

    check_obstacles(msg); // use all the laser points (no distance map)
}

void laserRangeCallback(const spqrel_navigation::LocalizerRanges::ConstPtr& msg)
{
	size_t n=msg->x.size();
	
	ROS_DEBUG_STREAM("LocalizerRanges " << n << " data");
#if 1
	if (gui) {
        // show processed laser readings
	    vector<float> vx,vy;
	    rotateVectors(msg->x,msg->y,vx,vy);
	    cloud_add_ranges(vx,vy,msg->dist);
	}
#endif
	check_obstacles_ranges(msg->x,msg->y,msg->dist); // use laser map distances

}

void read_data(const char *filename, bool timestamp=true) 
{
    int l=strlen(filename)-3;
    bool csv = strncasecmp((filename+l),"csv",3)==0;
    ifstream f; f.open(filename); 
    int k=10; vector<float> vx,vy;
    while (f.good() && k-->0) {
	int d; char c;
	// read timestamp
	if (timestamp) {
		f >> d; if (csv) f >> c;
	}
	// read data
	double t = LASER_ANGLE_MIN, x,y;
	for (int k=0; k<=LASER_DATA_SIZE; k++) {
	    f >> d; if (csv) f >> c;
	    // cout << d << endl;

	    if (d>LASER_RANGE_MIN) {
		x = (d/1000.0) * cos(t); y = (d/1000.0) * sin(t);
		vx.push_back(x); vy.push_back(y);
	    }
	    
	    t += LASER_ANGLE_INC;
	}
	
	cloud_add(vx,vy);
    }
    f.close();
}



void display()
{
    pcl::visualization::PCLVisualizer p ("Online PointCloud2 Viewer");

    p.spinOnce (10);

    p.addCoordinateSystem(1.0);

    string name = "cloud";
    p.setCameraPosition(0,0,10,
        0,0,0,
        1,0,0
     );
    p.spinOnce (10);
    bool run=true;
    while (run)
    {
        p.removeAllShapes();
        p.removePointCloud (name);


        cloud_mutex.lock();
        pcl::visualization::PointCloudColorHandlerRGBField<pcl::PointXYZRGB> rgb(cloud);
        p.addPointCloud<pcl::PointXYZRGB> (cloud, rgb, name);
        p.setPointCloudRenderingProperties (pcl::visualization::PCL_VISUALIZER_POINT_SIZE, 1, name);
        cloud_mutex.unlock();

        double goalth=roundPI2(robotpose.th);  // rad
        double theta=robotpose.th-goalth, lsize=3;
        double lx = lsize * cos(theta), ly = lsize * sin(theta);

        Eigen::Vector3f point_on_line(0,0,0), line_direction(lx,ly,0);
        pcl::ModelCoefficients line_coeff;
        line_coeff.values.resize (6); // We need 6 values
        line_coeff.values[0] = point_on_line.x ();
        line_coeff.values[1] = point_on_line.y ();
        line_coeff.values[2] = point_on_line.z ();
        line_coeff.values[3] = line_direction.x ();
        line_coeff.values[4] = line_direction.y ();
        line_coeff.values[5] = line_direction.z ();

        p.addLine(line_coeff,string("thetarobot"),0);

        p.spinOnce (10);
        if (rosnode) {
            ros::spinOnce();
            int refresh_rate=20; // Hz
            ros::Rate rate(refresh_rate);
            rate.sleep();
            run = !ros::isShuttingDown();
        }
    }
}

void check_args(int argc, char **argv)
{
    filename[0]='\0';
    for (int i=0; i<argc; i++) {
        if (strcmp(argv[i],"-f")==0) {
            strcpy(filename,argv[i+1]); i++;
            rosnode = false;
        }
        else if (strcmp(argv[i],"-gui")==0) {
            gui = true;
        }

    }
}

#define TOPIC_LASER_OBS "/laser_obstacle"
#define TOPIC_LASER_OBS_MAP "/laser_obstacle_map"
#define TOPIC_SCAN "/scan_filtered"
#define TOPIC_LOC_RANGES "/localizer_ranges"

int main(int argc, char **argv)
{
    check_args(argc, argv);
    if (rosnode) {
        cout << "ROS node laserobstacle init ..."<< endl;
        ros::init(argc, argv, "laserobstacle");
        ros::NodeHandle n, np("~");
        ros::Subscriber laserSubscriber =
                n.subscribe(TOPIC_SCAN, 1, laserCallback);
        ros::Subscriber localizerRangeSubscriber =
                n.subscribe(TOPIC_LOC_RANGES, 1, laserRangeCallback);
        obstaclePublisher =
                n.advertise<laser_analysis::LaserObstacle>(TOPIC_LASER_OBS, 1000);

        obstacleMapPublisher =
                n.advertise<laser_analysis::LaserObstacleMap>(TOPIC_LASER_OBS_MAP, 1000);
        listener = new tf::TransformListener();

        ros::Duration(1.0).sleep();

        np.getParam("map_frame_id", map_frame_id);
        printf("laserobstacle:: map_frame_id:=%s\n",map_frame_id.c_str());
        np.getParam("laser_frame_id", laser_frame_id);
        printf("laserobstacle:: laser_frame_id:=%s\n",laser_frame_id.c_str());
        np.getParam("obstacle_margin_x_min", obst_dx_min);
        printf("laserobstacle:: obstacle_margin_x_min = %.3f\n",obst_dx_min);
        np.getParam("obstacle_margin_x_max", obst_dx_max);
        printf("laserobstacle:: obstacle_margin_x_max = %.3f\n",obst_dx_max);
        np.getParam("obstacle_margin_y_min", obst_dy_min);
        printf("laserobstacle:: obstacle_margin_y_min = %.3f\n",obst_dy_min);
        np.getParam("obstacle_margin_y_max", obst_dy_max);
        printf("laserobstacle:: obstacle_margin_y_max = %.3f\n",obst_dy_max);
        np.getParam("map_distance", red_map_distance);
        printf("laserobstacle:: map_distance = %.3f\n",red_map_distance);
        green_map_distance=red_map_distance/2; // '< green': OK - '> red': detect 

        printf("[pub] laser obstacle: %s\n",TOPIC_LASER_OBS);
        printf("[pub] laser obstacle map: %s\n",TOPIC_LASER_OBS_MAP);
        printf("[sub] laser scan: %s\n",TOPIC_SCAN);
        printf("[sub] localizer ranges: %s\n",TOPIC_LOC_RANGES);


        if (gui) {
            cout << "start laserobstacle GUI ..." << endl;
            ros::spinOnce();
            display();
        }
        else
            ros::spin();
    }
    else {
	    read_data(filename);
        display();
    }


    return 0;
}


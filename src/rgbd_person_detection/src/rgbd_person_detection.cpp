/*
 * rgbd_person_detection.cpp
 *
 * Luca Iocchi 2017
 */

#include <ros/ros.h>
#include <sensor_msgs/Image.h>
#include <cv_bridge/cv_bridge.h>
#include <opencv2/highgui/highgui.hpp>

#include <person_detection/detectBodyParts.h>

#include <spencer_tracking_msgs/DetectedPerson.h>
#include <geometry_msgs/PointStamped.h>  // for visualization in rviz

#define TOPIC_PERSON_DETECTED "person_detected"
#define TOPIC_VIEW_PERSON_DETECTED "view_person_detected"


#define SEGBINS 20
#define SEGSTEP 100
#define SEGTHRESH 60

#define DEPTH_METER 1  // depth values in meters

using namespace std;

ros::Publisher person_pub;
ros::Publisher viewperson_pub;

class Processor {

public:
	cv_bridge::CvImagePtr cv_rgb_ptr, cv_depth_ptr; // input RGB and depth images
	Rect faceRect, centerFaceRect; // face and center of face Rect
	Rect bodyRect; // body Rect
	cv::Mat H, mask, rgb_mask, depth_mask; // depth histogram, depth mask and RGB mask
//	int Ax=40, Ay=40, Aw=100, Ah=40; string As="Yes"; // button A
//	int Bx=500, By=40, Bw=100, Bh=40; string Bs="No"; // button B

	int Ax=200, Ay=200, Aw=100, Ah=200; string As="L"; // button A
	int Bx=340, By=200, Bw=100, Bh=200; string Bs="R"; // button B

	bool buttonAPressed=false, buttonBPressed=false;  // button status
    float buttonA_z, buttonB_z; // distance of points inside buttons
	bool bodydetected, facedetected; // if body/face is detected
	double bodydepth, bodyx, facedepth, facex; // values of body/face detected
    bool facedetection, bodydetection, virtualbuttons; // enable these functions
    bool GUI; // show windows

    Processor() {
        cv_rgb_ptr=NULL; cv_depth_ptr=NULL; 
        H.create(110, 400, CV_8UC1); H = Scalar(0);
        mask.create(100, 100, CV_8UC1); mask = Scalar(0);
        rgb_mask.create(100, 100, CV_8UC3); rgb_mask = Scalar(0);
        depth_mask.create(100, 100, CV_16UC1); depth_mask = Scalar(0);
        GUI = false;
    }

	void buildHist(cv::Mat& depthMap) {
        H = cv::Scalar(0);
        vector<int> v(SEGBINS);
        std::fill(v.begin(), v.end(), 0);

        for(int i = 0; i < depthMap.rows; ++i) {
            for(int j = 0; j < depthMap.cols; ++j) {

#if DEPTH_METER
                short z = (short) (1000*depthMap.at<float>(i, j));
#else
                short z = depthMap.at<short>(i, j);
#endif
                if(z > 0) {
                    int index = z / SEGSTEP;
                    if(index < SEGBINS)
                    	v[index]++;
                }
            }
        }

        int highest_bin = *(std::max_element(v.begin(), v.end()));

        if(highest_bin <= 0) {
            return;
        }

		int firsthigher=-1;
		for (int j=0; j<SEGBINS && (firsthigher<0); j++) {
			int high = cvRound(float(v[j] * 100) / highest_bin);
			if (high>SEGTHRESH) {
				firsthigher=j;
			}
		}

		for (int j=0; j<SEGBINS; j++) {
 			int high = cvRound(float(v[j] * 100) / highest_bin);
			int color = 125;
            if (firsthigher==j) {
            color = 250; // selected bin
            }

            for(int k = 0; k < 10; k++) {
              	for(int i = H.rows-1-high; i < H.rows-1; ++i) {
                	H.at<uchar>(i, j*10+k) = color;
                }
            }
		}

	}


	void buildMask(cv::Mat& rgbImg, cv::Mat& depthMap) {
		  int index = -1;
		  for(int i = H.rows-1; i >= 0; --i) {
		      for(int j = 0; j < H.cols; ++j) {
		           if(H.at<uchar>(i, j) > 200) { // selected bin
		               index = j;
		               break;
		           }   
		      }
		      if(index >= 0) {
		          break;
		      }
		  }
		  if(index < 0)
		      return;

		  mask.create(depthMap.rows, depthMap.cols, CV_8UC1); mask = Scalar(0);
		  depth_mask.create(depthMap.rows, depthMap.cols, CV_16UC1); depth_mask = Scalar(0);
		  rgb_mask.create(rgbImg.rows, rgbImg.cols, CV_8UC3); rgb_mask = Scalar(0);
		  
		  int min_z = index*SEGSTEP/10 - 300;
		  int max_z = min_z + 550;

		  for(int i = 0; i < depthMap.rows; ++i) {
		      for(int j = 0; j < depthMap.cols; ++j) {
#if DEPTH_METER
                  short z = (short) (1000*depthMap.at<float>(i, j));
#else
                  short z = depthMap.at<short>(i, j);
#endif
		           if(z > min_z && z < max_z) {
		           		mask.at<uchar>(i,j) = 255;
                        rgb_mask.at<Vec3b>(i,j) = rgbImg.at<Vec3b>(i,j);
                        depth_mask.at<short>(i,j) = z;
		           }
		      }
		  }
		  return;
	}

  bool checkButtonPressed(Rect rect, float &zmin) {
		cv::Mat mask_roi(mask, rect);
		cv::Mat depth_roi(depth_mask, rect);
		int count=0; zmin = 10.0;
		for(int i = 0; i < mask_roi.rows; ++i) {
			for(int j = 0; j < mask_roi.cols; ++j) {		           
		  		if (mask_roi.at<uchar>(i,j) > 128) count++;
                  float z = depth_roi.at<short>(i, j) / 1000.0;  // meters
                  if (z>0)
                    zmin = std::min(zmin,z);
		  }
		}
		return ((double)count / (mask_roi.rows*mask_roi.cols)) > 0.1;
	}


	// Main processing functions

  void faceDetection(bool segm=false) {
        facedepth = -1; facex = 0;
		cv::Mat image = (segm?rgb_mask:cv_rgb_ptr->image);
		facedetected = detectFace(image,faceRect); 
		if (facedetected) {
			int dx = 6, dy = 6;
			centerFaceRect = cv::Rect(faceRect.x + (faceRect.width/2-dx/2), faceRect.y + (faceRect.height/2-dy/2), dx, dy);
			cv::Mat faceimg = cv_depth_ptr->image(centerFaceRect);
			double dmin, dmax;
			cv::minMaxIdx(faceimg, &dmin, &dmax);
			facedepth = (dmin+dmax/2);
            facex = (faceRect.x + faceRect.width/2) - cv_rgb_ptr->image.cols/2;
            facex /= 570.34; // pixel size - TODO use calibration
			// cout << "Face depth: " << facedepth << endl;
		}
		else
			centerFaceRect = cv::Rect(0,0,0,0);
	}


	void bodyDetection(bool segm=false) {
        bodydepth = -1; bodyx = 0;
		cv::Mat image = (segm?rgb_mask:cv_rgb_ptr->image);
		bodydetected = detectUpperBody(image, bodyRect);
        if (!bodydetected)
            bodydetected = detectLowerBody(image, bodyRect); 
		if (bodydetected) {
			int dx = 6, dy = 6;
			cv::Rect centerRect = cv::Rect(bodyRect.x + (bodyRect.width/2-dx/2), bodyRect.y + (bodyRect.height/2-dy/2), dx, dy);
			cv::Mat bodyimg = cv_depth_ptr->image(centerRect);
			double dmin, dmax;
			cv::minMaxIdx(bodyimg, &dmin, &dmax);
			bodydepth = (dmin+dmax/2);
            bodyx = (bodyRect.x + bodyRect.width/2) - cv_rgb_ptr->image.cols/2;
            bodyx /= 570.34; // pixel size - TODO use calibration
			// cout << "Body depth: " << bodydepth << endl;
		}
		else
			bodyRect = cv::Rect(0,0,0,0);
	}

	void depthSegmentation() {

		if (cv_depth_ptr) { 
			buildHist(cv_depth_ptr->image);
			buildMask(cv_rgb_ptr->image, cv_depth_ptr->image);	
		}
	}

	void virtualButtons() {
		buttonAPressed = checkButtonPressed(Rect(Ax,Ay,Aw,Ah),buttonA_z);
		buttonBPressed = checkButtonPressed(Rect(Bx,By,Bw,Bh),buttonB_z);
	}


  // Display function

  void display() {

    cv::Mat disp_rgb, disp_depth; 

    cv_rgb_ptr->image.copyTo(disp_rgb);

#if DEPTH_METER
    cv::convertScaleAbs(cv_depth_ptr->image, disp_depth, 50);
#else
    double dmin, dmax;
    cv::minMaxIdx(cv_depth_ptr->image, &dmin, &dmax);
    cv::convertScaleAbs(cv_depth_ptr->image, disp_depth, 255/dmax);
#endif

    cv::rectangle(disp_rgb, faceRect, cv::Scalar(0,0,255), 2,8,0);
    cv::rectangle(disp_rgb, bodyRect, cv::Scalar(0,255,0), 2,8,0);
    cv::rectangle(disp_depth, faceRect, cv::Scalar(255), 2,8,0);
    cv::rectangle(disp_depth, bodyRect, cv::Scalar(255), 2,8,0);
    cv::rectangle(disp_depth, centerFaceRect, cv::Scalar(255), 2,8,0);

    cv::Scalar colA = CV_RGB(255,255,255);
    cv::Scalar colB = CV_RGB(255,255,255);
    if (buttonAPressed) {
	    colA = CV_RGB(0,200,0);
    }
    if (buttonBPressed) {
	    colB = CV_RGB(200,0,0);
    }

    cv::rectangle(rgb_mask, cv::Point(Ax, Ay), cv::Point(Ax+Aw, Ay+Ah), colA, 3);
    cv::putText(rgb_mask, As, cv::Point(Ax+Aw/2-20, Ay+Ah-10), cv::FONT_HERSHEY_SIMPLEX, 1.0, colA, 2);
    cv::rectangle(rgb_mask, cv::Point(Bx, By), cv::Point(Bx+Bw, By+Bh), colB, 3);
    cv::putText(rgb_mask, Bs, cv::Point(Bx+Bw/2-20, By+Bh-10), cv::FONT_HERSHEY_SIMPLEX, 1.0, colB, 2);

	cv::imshow("Face Detection RGB", disp_rgb);
	//cv::imshow("Face Detection Depth", disp_depth);		
	//cv::imshow("H", H);
	//cv::imshow("Mask", mask);
	//cv::imshow("RGB Mask", rgb_mask);

    cv::waitKey(5);
  }


	// Run Once processing step

	void runOnce() {
		if (cv_rgb_ptr && cv_depth_ptr) {

			// person detection at a distance
			//faceDetection();

			// person segmentation close to the robot
			depthSegmentation();
            if (facedetection)
			    faceDetection(true); // face detection after segmentation
            if (bodydetection)
			    bodyDetection(true);
            if (virtualbuttons)
         		virtualButtons();

            if (GUI)
			    display();

			if (facedetected || bodydetected) {
				cout << "!!! PERSON FOUND !!!  - body: " << bodydepth << " face: " << facedepth;

                
                float c=0; // confidence
                float z=0; // distance
                float x=0; // side
                if (facedetected && bodydetected) {
                    if (bodydepth>=1.0 && facedepth>=1.0 && fabs(bodydepth-facedepth) < 0.3) {
                        c = 1.0; z = (bodydepth+facedepth)/2; x = (bodyx+facex)/2;
                    }
                    else if (bodydepth>=1.0 && facedepth>=1.0) {
                        c = 0.8; z = std::min(bodydepth,facedepth); x = (bodyx+facex)/2;
                    }
                    else if (facedepth>=1.0) {
                        c = 0.7; z = facedepth; x = facex;
                    }
                    else if (bodydepth>=1.0) {
                        c = 0.6; z = bodydepth; x = bodyx;
                    }
                    else {
                        c = 0.3; z = 0;
                    }
                }
                else if (facedetected) {
                    if (facedepth>=1.0) {
                        c = 0.7; z = facedepth; x = facex;
                    }
                    else {
                        c = 0.3; z = 0;
                    }
                }
                else if (bodydetected) {
                    if (bodydepth>=1.0) {
                        c = 0.6; z = bodydepth; x = bodyx;
                    }
                    else {
                        c = 0.3; z = 0;
                    }
                }
                else {
                    c = 0.0; z = 0;
                }

                spencer_tracking_msgs::DetectedPerson msg;
                msg.confidence = c;
                msg.detection_id = 1;
                msg.pose.pose.position.z = z;
                msg.pose.pose.position.x = x;
                msg.pose.pose.position.y = -0.5;
                person_pub.publish(msg);

                cout << " - z: " << z << " x: " << x << " conf: " << c << endl;

                geometry_msgs::PointStamped vmsg;
                vmsg.header.frame_id = "camera_link"; //camera_frame
                vmsg.point = msg.pose.pose.position;
                viewperson_pub.publish(vmsg);

			} // if face/body detected

            if (buttonAPressed || buttonBPressed) {
              cout << "  Virtual button:  "; float x,z;
              if (buttonAPressed && buttonBPressed) {
                x = 0;
                z = (buttonA_z + buttonB_z)/2;
                cout << " F "; 
              }
              else if (buttonAPressed) {
                x = -0.2;
                z = buttonA_z;
                cout << " L "; 
              }
              else if (buttonBPressed) {
                x = 0.2;
                z = buttonB_z;
                cout << " R "; 
              }
              cout << z << endl;
                spencer_tracking_msgs::DetectedPerson msg;
                msg.confidence = 0.8;
                msg.detection_id = 2;
                msg.pose.pose.position.z = z;
                msg.pose.pose.position.x = x;
                msg.pose.pose.position.y = -0.5;
                person_pub.publish(msg);

                geometry_msgs::PointStamped vmsg;
                vmsg.header.frame_id = "camera_link"; //camera_frame
                vmsg.point = msg.pose.pose.position;
                viewperson_pub.publish(vmsg);

            } // if button pressed

		}
	}

};


// Global object
Processor proc;


void rgbCB(const sensor_msgs::ImageConstPtr& msg){
	try{
		proc.cv_rgb_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::BGR8);
		cv::resize(proc.cv_rgb_ptr->image, proc.cv_rgb_ptr->image, cvSize(640,480));
	} catch (cv_bridge::Exception& e){
		ROS_ERROR("cv_bridge exception: %s", e.what());
		return;
	}	
}


void depthCB(const sensor_msgs::ImageConstPtr& msg){
	try {
#if DEPTH_METER
		proc.cv_depth_ptr = cv_bridge::toCvCopy(msg, sensor_msgs::image_encodings::TYPE_32FC1);
#else
		proc.cv_depth_ptr = cv_bridge::toCvCopy(msg, msg->encoding);
#endif
		cv::resize(proc.cv_depth_ptr->image, proc.cv_depth_ptr->image, cvSize(640,480), 0, 0, INTER_NEAREST);
	} catch (cv_bridge::Exception& e) {
		ROS_ERROR("cv_bridge exception: %s", e.what());
		return;
	}
}


int main(int argc, char **argv)
{
	ros::init(argc, argv, "rgbd_person_detection");

	ros::NodeHandle nh, lnh("~");

	string camera_name_rgb, camera_name_depth, topic_rgb, topic_depth;
	string model_dir;

	lnh.param("camera_name_rgb",camera_name_rgb,string("camera/rgb"));
	lnh.param("camera_name_depth",camera_name_depth,string("camera/depth"));
	lnh.param("model_dir",model_dir,string("."));
	lnh.param("GUI",proc.GUI,false);
	lnh.param("facedetection",proc.facedetection,false);
	lnh.param("bodydetection",proc.bodydetection,false);
	lnh.param("virtualbuttons",proc.virtualbuttons,false);

	topic_rgb = camera_name_rgb+"/image_raw";
	topic_depth = camera_name_depth+"/image_raw";

	cout << "Parameters:" << endl;
	cout << "  - camera_name_rgb: " << camera_name_rgb << endl;
	cout << "  - camera_name_depth: " << camera_name_depth << endl;
	cout << "  - model_dir: " << model_dir << endl;
	cout << "  - facedetection: " << proc.facedetection << endl;
	cout << "  - bodydetection: " << proc.bodydetection << endl;
	cout << "  - virtualbuttons: " << proc.virtualbuttons << endl;
	cout << "  - GUI: " << proc.GUI << endl;

	cout << "Subscriptions:" << endl;
	cout << "  - RGB topic: " << topic_rgb << endl;
	cout << "  - Depth topic: " << topic_depth << endl;

	cout << "Publishers:" << endl;
	cout << "  - person detected: " << TOPIC_PERSON_DETECTED << endl;
	cout << "  - view person detected: " << TOPIC_VIEW_PERSON_DETECTED << endl;

  	if (!loadModels(model_dir)) {
		ROS_ERROR_STREAM("Cannot load models from " << model_dir);
	}

	ros::Subscriber rgb_sub = nh.subscribe(topic_rgb, 1, &rgbCB);
	ros::Subscriber depth_sub = nh.subscribe(topic_depth, 1, &depthCB);
    person_pub = nh.advertise<spencer_tracking_msgs::DetectedPerson>(TOPIC_PERSON_DETECTED, 10);
    viewperson_pub = nh.advertise<geometry_msgs::PointStamped>(TOPIC_VIEW_PERSON_DETECTED, 10);

	ros::Rate r(10.0); 
	while (ros::ok()) {
		ros::spinOnce();
		proc.runOnce();
		r.sleep();
	}

	return 0;
}


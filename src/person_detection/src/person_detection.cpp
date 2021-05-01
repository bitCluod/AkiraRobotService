/* 

   DETECT DIFFERENT BODY PARTS USING HAAR-LIKE FEATURES

*/

#include "opencv2/objdetect/objdetect.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"

#include <iostream>
#include <stdio.h>
#include <string.h>
#include <sstream>

#include <cstdlib>

#include <person_detection/detectBodyParts.h>

using namespace std;
using namespace cv;

int main( int argc,  char** argv )
{
  VideoCapture capture(0); // capture video from webcam

  //capture.set(CV_CAP_PROP_FRAME_WIDTH,1280);
  //capture.set(CV_CAP_PROP_FRAME_HEIGHT,720);

  Mat frame, prevFrame;
  Rect faceRect, bodyRect;

  bool fullbodydetected = false;
  bool lowerbodydetected = false;
  bool facedetected = false;

  stringstream ss;
  ss << getenv("HOME") << "/home/salvathor/Documentos/Akira_1.2.2/src/person_detection";
  string mdir = ss.str();

  cout << "Loading models from " << mdir << endl;
  loadModels(mdir);

  while (true) {
  	// Capture the current frame from the input video stream
  	capture >> frame;
        
  	// Downsample the input frame for faster processing
  	float downsampleFactor = 1;
  	resize(frame, frame, Size(), downsampleFactor, downsampleFactor, INTER_NEAREST);
    
    faceRect = Rect(0,0,0,0); bodyRect = Rect(0,0,0,0);
  	// Apply the classifier to the frame depending on the enabled macros
  	if( !frame.empty() ) {
  		  fullbodydetected = detectFullBody(frame, bodyRect);  
  		  lowerbodydetected = detectLowerBody(frame, bodyRect);  
		  facedetected = detectFace(frame, faceRect);
			if (fullbodydetected) cout << "Human body detected!!!" << endl;
			if (lowerbodydetected) cout << "Human lower body detected!!!" << endl;
			if (facedetected) cout << "Human face detected!!!" << endl;
  	}
    else {
  		cout << "No captured frame. Stopping!" << endl;
  		break;
  	}

    // Display
    Mat disp_rgb;
    frame.copyTo(disp_rgb);
	
    cv::rectangle(disp_rgb, faceRect, cv::Scalar(0,0,255), 2,8,0);
    cv::rectangle(disp_rgb, bodyRect, cv::Scalar(255,0,0), 2,8,0);
    imshow("Person Detection", disp_rgb);

  	int c = waitKey(10);
  	if( (char)c == 27 || c=='q' ) { break; }

  }	
	
  return 0;
}


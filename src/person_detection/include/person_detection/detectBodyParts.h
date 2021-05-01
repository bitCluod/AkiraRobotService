/* 

 DETECT DIFFERENT BODY PARTS USING HAAR-LIKE FEATURES

 AUTHOR: PRATEEK JOSHI

*/

#include "opencv2/objdetect/objdetect.hpp"
#include "opencv2/highgui/highgui.hpp"
#include "opencv2/imgproc/imgproc.hpp"

#include <iostream>
#include <stdio.h>

using namespace std;
using namespace cv;

// Set the folder with pre-trained models
bool loadModels(String folder);

// Face detection
bool detectFace( Mat frame, cv::Rect& outrect );

// Full body detection
bool detectFullBody( Mat frame, cv::Rect& outrect );

// Upper body detection
bool detectUpperBody( Mat frame, cv::Rect& outrect );

// Lower body detection
bool detectLowerBody( Mat frame, cv::Rect& outrect );


// Eye detection
void detectEyes( Mat frame );

// Ear detection
void detectEars( Mat frame );

// Mouth detection
void detectMouth( Mat frame );

// Nose detection
void detectNose( Mat frame );

// Smile detection
void detectSmile( Mat frame );




/* 

 DETECT DIFFERENT BODY PARTS USING HAAR-LIKE FEATURES

 AUTHOR: PRATEEK JOSHI

*/

#include <person_detection/detectBodyParts.h>

using namespace std;
using namespace cv;

String prefix = ""; 
String face_cascade_name = prefix + "CascadeFiles/haarcascade_frontalface_alt.xml";
String eyes_cascade_name = prefix + "CascadeFiles/haarcascade_eye_tree_eyeglasses.xml";
String leftear_cascade_name = prefix + "CascadeFiles/haarcascade_mcs_leftear.xml";
String rightear_cascade_name = prefix + "CascadeFiles/haarcascade_mcs_rightear.xml";
String mouth_cascade_name = prefix + "CascadeFiles/haarcascade_mcs_mouth.xml";
String nose_cascade_name = prefix + "CascadeFiles/haarcascade_mcs_nose.xml";
String smile_cascade_name = prefix + "CascadeFiles/haarcascade_smile.xml";
String upperbody_cascade_name = prefix + "CascadeFiles/haarcascade_upperbody.xml";
String lowerbody_cascade_name = prefix + "CascadeFiles/haarcascade_lowerbody.xml";
String pedestrians_cascade_name = prefix + "CascadeFiles/hogcascade_pedestrians.xml";
String fullbody_cascade_name = prefix + "CascadeFiles/haarcascade_fullbody.xml";


CascadeClassifier face_cascade;
CascadeClassifier eyes_cascade;
CascadeClassifier upperbody_cascade;
CascadeClassifier lowerbody_cascade;


void setModelFolder(String folder) {
	prefix = folder;
	face_cascade_name = prefix + "/CascadeFiles/haarcascade_frontalface_alt.xml";
	eyes_cascade_name = prefix + "/CascadeFiles/haarcascade_eye_tree_eyeglasses.xml";
	leftear_cascade_name = prefix + "/CascadeFiles/haarcascade_mcs_leftear.xml";
	rightear_cascade_name = prefix + "/CascadeFiles/haarcascade_mcs_rightear.xml";
	mouth_cascade_name = prefix + "/CascadeFiles/haarcascade_mcs_mouth.xml";
	nose_cascade_name = prefix + "/CascadeFiles/haarcascade_mcs_nose.xml";
	smile_cascade_name = prefix + "/CascadeFiles/haarcascade_smile.xml";
	upperbody_cascade_name = prefix + "/CascadeFiles/haarcascade_upperbody.xml";
	lowerbody_cascade_name = prefix + "/CascadeFiles/haarcascade_lowerbody.xml";
	pedestrians_cascade_name = prefix + "/CascadeFiles/hogcascade_pedestrians.xml";
	fullbody_cascade_name = prefix + "/CascadeFiles/haarcascade_fullbody.xml";

}

bool loadModels(String folder) {
		setModelFolder(folder);

    if( !face_cascade.load( face_cascade_name ) ) { 
			cout << "Error loading face cascade file " << face_cascade_name << endl; 
			return false; 
		}
    if( !eyes_cascade.load( eyes_cascade_name ) ) { 
			cout << "Error loading eyes cascade file\n" << endl; 
			return false; 
		}
	if( !upperbody_cascade.load( upperbody_cascade_name ) ) { 
		cout << "Error loading upper body cascade file\n" << endl; 
		return false; 
	}

	if( !lowerbody_cascade.load( lowerbody_cascade_name ) ) { 
		cout << "Error loading lower body cascade file\n" << endl; 
		return false; 
	}

	return true;
}


bool compareContourAreas ( cv::Rect contour1, cv::Rect contour2 ) 
{
    double i = fabs( contour1.area() );
    double j = fabs( contour2.area() );
    return ( i > j );
}




// Face detection using Haar-like features
bool detectFace( Mat frame, cv::Rect& outrect )
{
    vector<Rect> faces;
    Mat frame_gray, img_vis;
    frame.copyTo(img_vis);
    
    cvtColor( img_vis, frame_gray, CV_BGR2GRAY );
    equalizeHist( frame_gray, frame_gray );
    
    // Detect faces
    face_cascade.detectMultiScale( frame_gray, faces, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(30, 30) );

		// output the biggest one

   	// Sort bysize 
   	if (faces.size()>0) {
			std::sort(faces.begin(), faces.end(), compareContourAreas);
  		outrect = faces[0];
  	}
		else {
			outrect = Rect(0,0,0,0);
		}
    
    return faces.size() > 0 ;
}



// Full body detection using HOG
bool detectFullBody( Mat frame, cv::Rect& outrect )
{
    HOGDescriptor hog;
    hog.setSVMDetector(HOGDescriptor::getDefaultPeopleDetector());
    Mat full_body_img = frame;
    vector<Rect> found, found_filtered;
    hog.detectMultiScale(full_body_img, found, 0, Size(8,8), Size(32,32), 1.05, 2);
 
        size_t i, j;
        for (i=0; i<found.size(); i++)
        {
            Rect r = found[i];
            for (j=0; j<found.size(); j++)
                if (j!=i && (r & found[j])==r)
                    break;
            if (j==found.size())
                found_filtered.push_back(r);
        }
        for (i=0; i<found_filtered.size(); i++)
        {
	    Rect r = found_filtered[i];
            r.x += cvRound(r.width*0.1);
	    r.width = cvRound(r.width*0.8);
	    r.y += cvRound(r.height*0.06);
	    r.height = cvRound(r.height*0.9);

			outrect = r;
	    //rectangle(full_body_img, r.tl(), r.br(), cv::Scalar(0,255,0), 2);
	}

  /*  
    imshow( "Full Body Detection", full_body_img );
     cv::waitKey(5); */
    return (found_filtered.size()>0);
}




// Upper body detection using Haar-like features
bool detectUpperBody( Mat frame, cv::Rect& outrect )
{
    vector<Rect> upperbody;
    Mat frame_gray;
    
    cvtColor( frame, frame_gray, CV_BGR2GRAY );
    equalizeHist( frame_gray, frame_gray );
    
    // Detect body
    upperbody_cascade.detectMultiScale( frame_gray, upperbody, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(100, 100) );
    
	if (upperbody.size()==0)
		return false;
	else {
		outrect = upperbody[0];
		return true;
	}
/*
    for( size_t i = 0; i < upperbody.size(); i++ )
    {
        Rect temp = upperbody[i];
        // temp.y += 100;
        // rectangle(frame, temp, Scalar(255,255,255), 4, 8);
    }
    
    // imshow( "Upper Body Detection", frame );
*/
}


// Lower body detection using Haar-like features
bool detectLowerBody( Mat frame, cv::Rect& outrect )
{
    vector<Rect> lowerbody;
    Mat frame_gray;
    
    cvtColor( frame, frame_gray, CV_BGR2GRAY );
    equalizeHist( frame_gray, frame_gray );
    
    // Detect faces
    lowerbody_cascade.detectMultiScale( frame_gray, lowerbody, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(100, 100) );
    
    if (lowerbody.size()==0)
		return false;
	else {
		outrect = lowerbody[0];
		return true;
	}
/*
    for( size_t i = 0; i < lowerbody.size(); i++ )
    {
        Point center( lowerbody[i].x + lowerbody[i].width*0.5, lowerbody[i].y + lowerbody[i].height*0.5 );
        ellipse( frame, center, Size( lowerbody[i].width*0.5, lowerbody[i].height*0.5), 0, 0, 360, Scalar( 255, 255, 255 ), 4, 8, 0 );
    }
    
    imshow( "Lower Body Detection", frame );
*/
}








// Eye detection using Haar-like features
void detectEyes( Mat frame )
{
    
    vector<Rect> faces;
    Mat frame_gray;
    
    cvtColor( frame, frame_gray, CV_BGR2GRAY );
    equalizeHist( frame_gray, frame_gray );
    
    // Detect faces
    face_cascade.detectMultiScale( frame_gray, faces, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(30, 30) );
    
    for( size_t i = 0; i < faces.size(); i++ )
    {
        Mat faceROI = frame_gray( faces[i] );
        std::vector<Rect> eyes;
        
        // In each face, detect eyes
        eyes_cascade.detectMultiScale( faceROI, eyes, 1.1, 2, 0 |CV_HAAR_SCALE_IMAGE, Size(30, 30) );
        
        for( size_t j = 0; j < eyes.size(); j++ )
        {
            Point center( faces[i].x + eyes[j].x + eyes[j].width*0.5, faces[i].y + eyes[j].y + eyes[j].height*0.5 );
            int radius = cvRound( (eyes[j].width + eyes[j].height)*0.25 );
            circle( frame, center, radius, Scalar( 255, 255, 255 ), 4, 8, 0 );
        }
    }
    
    imshow( "Eye Detection", frame );
}


// Ear detection using Haar-like features
void detectEars( Mat frame )
{
    // Load the cascade
    CascadeClassifier leftear_cascade;
    CascadeClassifier rightear_cascade;
    if( !leftear_cascade.load( leftear_cascade_name ) ) { cout << "Error loading left ear cascade file\n" << endl; return; };
    if( !rightear_cascade.load( rightear_cascade_name ) ) { cout << "Error loading right ear cascade file\n" << endl; return; };
    
    vector<Rect> leftears, rightears;
    Mat frame_gray;
    
    cvtColor( frame, frame_gray, CV_BGR2GRAY );
    equalizeHist( frame_gray, frame_gray );
    
    // Detect left ears
    leftear_cascade.detectMultiScale( frame_gray, leftears, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(30, 30) );
    
    // Detect right ears
    rightear_cascade.detectMultiScale( frame_gray, rightears, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(30, 30) );
    
    for( size_t i = 0; i < leftears.size(); i++ )
    {
        Point center( leftears[i].x + leftears[i].width*0.5, leftears[i].y + leftears[i].height*0.5 );
        ellipse( frame, center, Size( leftears[i].width*0.5, leftears[i].height*0.5), 0, 0, 360, Scalar( 255, 255, 0 ), 4, 8, 0 );
    }
    
    for( size_t i = 0; i < rightears.size(); i++ )
    {
        Point center( rightears[i].x + rightears[i].width*0.5, rightears[i].y + rightears[i].height*0.5 );
        ellipse( frame, center, Size( rightears[i].width*0.5, rightears[i].height*0.5), 0, 0, 360, Scalar( 0, 255, 0 ), 4, 8, 0 );
    }
    
    imshow( "Ear Detection", frame );
}


// Mouth detection using Haar-like features
void detectMouth( Mat frame )
{
    // Load the cascade
    CascadeClassifier mouth_cascade;
    if( !mouth_cascade.load( mouth_cascade_name ) ) { cout << "Error loading mouth cascade file\n" << endl; return; };
    
    vector<Rect> mouths;
    Mat frame_gray;
    
    cvtColor( frame, frame_gray, CV_BGR2GRAY );
    equalizeHist( frame_gray, frame_gray );
    
    // Detect mouth
    mouth_cascade.detectMultiScale( frame_gray, mouths, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(30, 30) );
    
    for( size_t i = 0; i < mouths.size(); i++ )
    {
        Point center( mouths[i].x + mouths[i].width*0.5, mouths[i].y + mouths[i].height*0.5 );
        ellipse( frame, center, Size( mouths[i].width*0.5, mouths[i].height*0.5), 0, 0, 360, Scalar( 255, 255, 255 ), 4, 8, 0 );
    }
    
    imshow( "Mouth Detection", frame );
}


// Nose detection using Haar-like features
void detectNose( Mat frame )
{
    // Load the cascade
    CascadeClassifier nose_cascade;
    if( !nose_cascade.load( nose_cascade_name ) ) { cout << "Error loading nose cascade file\n" << endl; return; };
    
    vector<Rect> noses;
    Mat frame_gray;
    
    cvtColor( frame, frame_gray, CV_BGR2GRAY );
    equalizeHist( frame_gray, frame_gray );
    
    // Detect noses
    nose_cascade.detectMultiScale( frame_gray, noses, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(30, 30) );
    
    for( size_t i = 0; i < noses.size(); i++ )
    {
        Point center( noses[i].x + noses[i].width*0.5, noses[i].y + noses[i].height*0.5 );
        ellipse( frame, center, Size( noses[i].width*0.5, noses[i].height*0.5), 0, 0, 360, Scalar( 255, 255, 255 ), 4, 8, 0 );
    }
    
    imshow( "Nose Detection", frame );
}


// Smile detection using Haar-like features
void detectSmile( Mat frame )
{
    // Load the cascade
    CascadeClassifier smile_cascade;
    if( !smile_cascade.load( smile_cascade_name ) ) { cout << "Error loading smile cascade file\n" << endl; return; };
    
    vector<Rect> smiles;
    Mat frame_gray;
    
    cvtColor( frame, frame_gray, CV_BGR2GRAY );
    equalizeHist( frame_gray, frame_gray );
    
    // Detect faces
    smile_cascade.detectMultiScale( frame_gray, smiles, 1.1, 2, 0|CV_HAAR_SCALE_IMAGE, Size(30, 30) );
    
    for( size_t i = 0; i < smiles.size(); i++ )
    {
        Point center( smiles[i].x + smiles[i].width*0.5, smiles[i].y + smiles[i].height*0.5 );
        ellipse( frame, center, Size( smiles[i].width*0.5, smiles[i].height*0.5), 0, 0, 360, Scalar( 255, 255, 255 ), 4, 8, 0 );
    }
    
    imshow( "Smile Detection", frame );
}








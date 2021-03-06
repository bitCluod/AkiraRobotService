#include "laser_viewer.h"


using namespace std;
using namespace Eigen;
  
class StandardCamera: public qglviewer::Camera {
public:
  StandardCamera(): _standard(true) {}
  
  float zNear() const {
    if(_standard) { return 0.001f; } 
      else { return Camera::zNear(); } 
  }
  
  float zFar() const {  
    if(_standard) { return 10000.0f; } 
    else { return Camera::zFar(); }
    }
  
  bool standard() const { return _standard; }  
  void setStandard(bool s) { _standard = s; }
  
protected:
  bool _standard;
};


QKeyEvent* LaserViewer::lastKeyEvent() {
  if (_last_key_event_processed)
    return 0;
  return &_last_key_event;
}
  
void LaserViewer::keyEventProcessed() {
  _last_key_event_processed = true;
}

LaserViewer::LaserViewer() :
  _last_key_event(QEvent::None, 0, Qt::NoModifier){
  _last_key_event_processed = true;
  _points.resize(0);
}

void LaserViewer::keyPressEvent(QKeyEvent *e) {
  QGLViewer::keyPressEvent(e);
  _last_key_event = *e;
  _last_key_event_processed=false;
}

void LaserViewer::init() {
  // Init QGLViewer.
  QGLViewer::init();
  // Set background color light yellow.
  // setBackgroundColor(QColor::fromRgb(255, 255, 194));

  
  // Set background color white.
  setBackgroundColor(QColor::fromRgb(255, 255, 255));
  
  // Set some default settings.
  glEnable(GL_LINE_SMOOTH);
  glEnable(GL_BLEND); 
  glEnable(GL_DEPTH_TEST);
  glEnable(GL_NORMALIZE);
  glShadeModel(GL_FLAT);
  glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);

  // Don't save state.
  setStateFileName(QString::null);

  // Mouse bindings.
  setMouseBinding(Qt::RightButton, CAMERA, ZOOM);
  setMouseBinding(Qt::MidButton, CAMERA, TRANSLATE);
  setMouseBinding(Qt::ControlModifier, Qt::LeftButton, RAP_FROM_PIXEL);

  // Replace camera.
  qglviewer::Camera *oldcam = camera();
  qglviewer::Camera *cam = new StandardCamera();
  setCamera(cam);
  cam->setPosition(qglviewer::Vec(0.0f, 0.0f, 10.0f));
  cam->setUpVector(qglviewer::Vec(1.0f, 0.0f, 0.0f));
  cam->lookAt(qglviewer::Vec(0.0f, 0.0f, 0.0f));
  delete oldcam;
}
  
void LaserViewer::draw(){
  if (!_points.size())
    return;
  //Eigen::Vector3f t=t2v(_tracker->globalT());
  glPushMatrix();
  //glTranslatef(t.x(), t.y(), 0);
  //glRotatef(180.0f/M_PI*t.z(), 0,0,1);
      
  glTranslatef(0, 0, 0);
  glRotatef(-90, 0,0,1);

  glPushAttrib(GL_COLOR|GL_POINT_SIZE);
  glColor3f(0, 0, 0);

  glPointSize(2);
  
  glBegin(GL_POINTS);
  /*std::vector<float> ranges = _las_msg->ranges();
  std::cerr << "Size: " << ranges.size() << std::endl;
  std::cerr << "MinRange: " << _las_msg->minRange() << std::endl;
  std::cerr << "angleIncrement: " << _las_msg->angleIncrement() << std::endl;
*/
  //for(size_t i=0; i<_las_msg->ranges().size(); i++){
  for(size_t i=0; i<_points.size(); i++){
    Eigen::Vector2d point = _points[i];
    //std::cerr << "Point: " << point.x() << " " << point.y() << endl;
    glNormal3f(0,0,1);
    glVertex3f(point.x(), point.y(), 0);
  }
  glEnd();
  
  glPopAttrib();
  glPopMatrix();
}



#pragma once

#include "laser_message.h"
#include "qglviewer.h"
#include <qevent.h>

using namespace txt_io;

class LaserViewer: public QGLViewer{
public:
//! ctor
LaserViewer();
//! init method, opens the gl viewport and sets the key bindings
void init();
//! callback invoked by the application on new key event. It saves the last event in
//! a member variable
virtual void keyPressEvent(QKeyEvent *e);

//! returns the last key pressed since invoking keyEventProcessed();
QKeyEvent* lastKeyEvent();

//! call this to clear the events, after processing them
void keyEventProcessed();

void draw();

inline void setLaserPoints(std::vector<Eigen::Vector2d>& points){_points = points;}

protected:
QKeyEvent _last_key_event;
bool _last_key_event_processed;
std::vector<Eigen::Vector2d> _points;
};

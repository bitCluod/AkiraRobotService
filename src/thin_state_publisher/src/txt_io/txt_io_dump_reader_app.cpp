#include "message_reader.h"
#include "globals/system_utils.h"
#include <cstring>
#include "pinhole_image_message.h"
#include "laser_message.h"
#include "sensor_message_sorter.h"
#include <opencv/highgui.h>

#include "qapplication.h"
#include "laser_viewer.h"

using namespace system_utils;
using namespace std;
using namespace txt_io;

PinholeImageMessage i;
LaserMessage l;

const char* banner[]={
  "txt_io_dump_reader_app: a simple example on reading a dump file written with txt io",
  " it reads sequentially all elements in the file",
  " instantiates the objects and prints the class name",
  "",
  "usage: txt_io_dump_reader_app <dump_file>",
  0
};

class IDoMyStuffTrigger: public SensorMessageSorter::Trigger {
public:
  IDoMyStuffTrigger(SensorMessageSorter* sorter, LaserViewer* viewer) : SensorMessageSorter::Trigger(sorter, 0){_viewer=viewer;}

  virtual void action(std::tr1::shared_ptr<BaseSensorMessage> msg) {
    cerr << msg->tag() << endl;
    BaseImageMessage* img = dynamic_cast<BaseImageMessage*>(msg.get());
    if (img) {
      std::cerr << "Showing image: " << img->binaryFullFilename() << std::endl;
      cv::imshow(img->topic(), img->image());
      cv::waitKey(1);
    }
    LaserMessage* las = dynamic_cast<LaserMessage*>(msg.get());
    if(las) {
      if (_viewer){
	std::vector<float> ranges = las->ranges();
	std::vector<Eigen::Vector2d> points;
	points.resize(las->ranges().size());
	for(size_t i=0; i<las->ranges().size(); i++){
	  float r = ranges[i];
	  Eigen::Vector2d point(r * cosf(las->minRange() + i * las->angleIncrement()), r * sinf(las->minRange() + i * las->angleIncrement()));
	  
	  points[i] = point;
	}

	_viewer->setLaserPoints(points);
      }
    }
  }
  
protected:
  LaserViewer* _viewer;
};


int main(int argc, char ** argv) {
  if (argc<2 || ! strcmp(argv[1],"-h")) {
    printBanner(banner);
    return 0;
  }

  MessageReader reader;
  reader.open(argv[1]);
  
  QApplication* app = new QApplication(argc, argv);
  LaserViewer* viewer = new LaserViewer();
  viewer->init();
  viewer->show();
  

  SensorMessageSorter* sorter = new SensorMessageSorter;
  sorter->setWriteBackEnabled(false);
  IDoMyStuffTrigger* idmst = new IDoMyStuffTrigger(sorter, viewer);
  BaseMessage* msg=0;

  while ( (msg = reader.readMessage()) ) {
    txt_io::BaseSensorMessage* sensor_msg = dynamic_cast<txt_io::BaseSensorMessage*>(msg);
    sorter->insertMessage(sensor_msg);

    viewer->updateGL();
    app->processEvents();
    usleep(1000);
  }

  sorter->flush();
  cerr << "Finished" << std::endl;

}

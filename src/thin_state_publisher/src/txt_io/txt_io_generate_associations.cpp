#include "message_reader.h"
#include "globals/system_utils.h"
#include <cstring>
#include "pinhole_image_message.h"
#include "laser_message.h"
#include "sensor_message_sorter.h"
#include <opencv/highgui.h>
#include "message_timestamp_synchronizer.h"

using namespace system_utils;
using namespace std;
using namespace txt_io;

PinholeImageMessage i;
LaserMessage l;
MessageTimestampSynchronizer synchronizer;

const char* banner[]={
  "txt_io_dump_reader_app: a simple example on reading a dump file written with txt io",
  " it reads sequentially all elements in the file",
  " instantiates the objects and prints the class name",
  "",
  "usage: txt_io_dump_reader_app <dump_file>",
  0
};


int main(int argc, char ** argv) {
  if (argc<2 || ! strcmp(argv[1],"-h")) {
    printBanner(banner);
    return 0;
  }
  std::string depth_topic="/camera/depth/image_raw";
  std::string rgb_topic="/camera/rgb/image_raw";

  MessageReader reader;
  reader.open(argv[1]);
  
  std::vector<std::string> sync_topics;
  sync_topics.push_back(rgb_topic);
  sync_topics.push_back(depth_topic);
  synchronizer.setTopics(sync_topics);
  BaseMessage* msg=0;
  ofstream os("associations.txt");
  while ( (msg = reader.readMessage()) ) {
    msg->untaint();
    txt_io::BaseSensorMessage* sensor_msg = dynamic_cast<txt_io::BaseSensorMessage*>(msg);
    if (sensor_msg->topic()==rgb_topic) {
      synchronizer.putMessage(sensor_msg);
    } else if (sensor_msg->topic()==depth_topic) {
      synchronizer.putMessage(sensor_msg);
    } else
      delete sensor_msg;
    if (synchronizer.messagesReady()) {
      char buf[1024];
      sprintf(buf, "%.5f %s %.5f %s", synchronizer.messages()[0]->timestamp(), synchronizer.messages()[0]->binaryFullFilename().c_str(), synchronizer.messages()[1]->timestamp(), synchronizer.messages()[1]->binaryFullFilename().c_str());
      os << buf << endl;
      synchronizer.reset();
      cerr << ".";
    }
  }
  cerr << "done" << endl;
}

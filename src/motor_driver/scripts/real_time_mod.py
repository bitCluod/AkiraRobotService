from imutils.video import VideoStream
from imutils.video import FPS
import numpy as np
import argparse
import imutils
import time
import cv2
import freenect

import rospy
from geometry_msgs.msg import Point

#function to get RGB image from kinect
def get_video():
    array,_ = freenect.sync_get_video()
    array = cv2.cvtColor(array,cv2.COLOR_RGB2BGR)
    return array

point = Point()
rospy.init_node('follow', anonymous=True)
pub = rospy.Publisher('follower', Point, queue_size=10)  # 2-5 mensajes en cola de espera
rate = rospy.Rate(10) 

CLASSES = ["background", "avion", "bicicleta", "ave", "bote",
	"botella", "autobus", "auto", "gato", "silla", "vaca", "comedor",
	"perro", "horse", "motorbike", "persona", "maceta", "sheep",
	"sofa", "tren", "monitor de tv"]
COLORS = np.random.uniform(0, 255, size=(len(CLASSES), 3))

print("[INFO] loading model...")
net = cv2.dnn.readNetFromCaffe("MobileNetSSD_deploy.prototxt.txt", "MobileNetSSD_deploy.caffemodel")

print("[INFO] starting video stream...")
vs = VideoStream(src=0).start()
time.sleep(2.0)
#fps = FPS().start()

while True:
	
	#frame = get_video()	
	frame = vs.read()
	#frame = imutils.resize(frame, width=320, height=240)

	(h, w) = frame.shape[:2]
	blob = cv2.dnn.blobFromImage(cv2.resize(frame, (300, 300)), 0.007843, (300, 300), 127.5)

	net.setInput(blob)
	detections = net.forward()

	#cv2.rectangle(frame,(160,10),(480,470),(0,255,0),4)	

	for i in np.arange(0, detections.shape[2]):
		
		confidence = detections[0, 0, i, 2]

		if confidence > 0.8:

			idx = int(detections[0, 0, i, 1])
			box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
			(startX, startY, endX, endY) = box.astype("int")

			if CLASSES[idx] == "persona":
				
				label = "{}: {:.2f}%".format(CLASSES[idx], confidence * 100)
				cv2.rectangle(frame, (startX, startY), (endX, endY), COLORS[idx], 2)
				y = startY - 15 if startY - 15 > 15 else startY + 15
				cv2.putText(frame, label, (startX, y), cv2.FONT_HERSHEY_SIMPLEX, 0.5, COLORS[idx], 2)
				
				x = float((startX+endX)/2)
				y = float((startY+endY)/2)
				cv2.circle(frame,(int(x), int(y)),6,(0,0,100),-1)

				point.x = float(x)
				point.y = float(y)

				pub.publish(point)
				rate.sleep()

			else:

				point.x = 0
				point.y = 0

				pub.publish(point)
				rate.sleep()
				
	cv2.imshow("Deteccion", frame)
	key = cv2.waitKey(1) & 0xFF

	if key == ord("q"):
		break

	#fps.update()

#fps.stop()
#print("[INFO] elapsed time: {:.2f}".format(fps.elapsed()))
#print("[INFO] approx. FPS: {:.2f}".format(fps.fps()))

cv2.destroyAllWindows()
vs.stop()

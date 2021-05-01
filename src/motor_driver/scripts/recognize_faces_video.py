# python recognize_faces_video.py --encodings encodings.pickle
# -*- coding: utf-8 -*-

from imutils.video import VideoStream
import face_recognition
import imutils
import pickle
import time
import cv2
import freenect
import numpy as np

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
#rate = rospy.Rate(10) 

enco = "encodings.pickle"
display = 1  

print("[INFO] loading encodings...")
data = pickle.loads(open(enco, "rb").read())

print("[INFO] starting video stream...")
#vs = VideoStream(src=0).start()
#time.sleep(2.0)

captura = cv2.VideoCapture(0)
captura.set(cv2.CAP_PROP_FRAME_WIDTH,320) #450
captura.set(cv2.CAP_PROP_FRAME_HEIGHT,240) #720

yes = True

while True:

	ret, frame = captura.read()
	#frame = vs.read()
	#frame = get_video()	

	rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
	#rgb = imutils.resize(rgb, width=480, height=360) #frame
	r = frame.shape[1] / float(rgb.shape[1])

	boxes = face_recognition.face_locations(rgb, model="hog") # cnn el más lento ... hog el más rápido
	
	encodings = face_recognition.face_encodings(rgb, boxes)
	names = []

	cv2.rectangle(frame,(210,20),(410,460),(0,255,0),4)

	for encoding in encodings:

		matches = face_recognition.compare_faces(data["encodings"], encoding)
		name = "Desconocido"

		if True in matches:

			matchedIdxs = [i for (i, b) in enumerate(matches) if b]
			counts = {}

			for i in matchedIdxs:
				name = data["names"][i]
				counts[name] = counts.get(name, 0) + 1

			name = max(counts, key=counts.get)

		names.append(name)

	if len(names) == 1:
		yes = True
	else:
		yes = False

	for ((top, right, bottom, left), name) in zip(boxes, names):

		top = int(top * r)
		right = int(right * r)
		bottom = int(bottom * r)
		left = int(left * r)

		cv2.rectangle(frame, (left, top), (right, bottom),(0, 255, 25), 2)

		y = top - 15 if top - 15 > 15 else top + 15
		cv2.putText(frame, name, (left, y), cv2.FONT_HERSHEY_SIMPLEX,
			0.85, (0, 255, 0), 2)

	if (yes):
			
		x = float((left+right)/2)
		y = float((top+bottom)/2)

		point.x = float(x)
		point.y = float(y)

		pub.publish(point)

	if (yes == False):
			
		point.x = 0
		point.y = 0

		pub.publish(point)

	if display > 0:
		cv2.imshow("Reconocimiento facial", frame)
		if cv2.waitKey(1) & 0xFF == ord('q'):
			break

cv2.destroyAllWindows()
#vs.stop()

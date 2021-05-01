# USAGE
# python encode_faces.py --dataset dataset --encodings encodings.pickle

from imutils import paths
import face_recognition
import pickle
import cv2
import os

datas = "dataset"
ouput = "encodings.pickle"

print("[INFO] quantifying faces...")
imagePaths = list(paths.list_images(datas))

knownEncodings = []
knownNames = []

for (i, imagePath) in enumerate(imagePaths):

	print("[INFO] processing image {}/{}".format(i + 1,
		len(imagePaths)))
	name = imagePath.split(os.path.sep)[-2]

	image = cv2.imread(imagePath)
	rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)

	boxes = face_recognition.face_locations(rgb, model="hog") #cnn o hog

	encodings = face_recognition.face_encodings(rgb, boxes)

	for encoding in encodings:

		knownEncodings.append(encoding)
		knownNames.append(name)

print("[INFO] serializing encodings...")
data = {"encodings": knownEncodings, "names": knownNames}
f = open(ouput, "wb")
f.write(pickle.dumps(data, protocol=0)) #protocolo=0
f.close()

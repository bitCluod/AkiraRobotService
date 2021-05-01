# RGBD Person Detection #

This is a simple ROS node showing how to access and process data from RGBD sensors.
The application shows three features:

* depth segmentation based on histogram of depth values
* face detection on the segmented image
* virtual button pressing


### Requirements ###

This node requires the following components

* [thin_drivers](https://bitbucket.org/ggrisetti/thin_drivers), [astra driver](https://github.com/tfoote/ros_astra_camera.git) or naoqi_driver
* [person_detection](https://bitbucket.org/iocchi/person_detection)
* [spencer_tracking_msgs](https://github.com/spencer-project/spencer_messages.git)


### Build ###

Just add this node to your catkin workspace


### Run ###

```
#!shell
$ roslaunch rgbd_person_detection rgbd_person_detection.launch use_<DEVICE>:=true
```


Available devices: kinect, xtion, astra, pepper

Examples:

```
$ roslaunch rgbd_person_detection rgbd_person_detection.launch use_astra:=true
```

```
$ roslaunch rgbd_person_detection rgbd_person_detection.launch use_pepper:=true camera_name_rgb:=/pepper/camera/front camera_name_depth:=/pepper/camera/depth
```


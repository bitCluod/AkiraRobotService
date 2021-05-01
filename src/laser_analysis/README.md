# laser_analysis #

laser_analysis package implements a simple method to detect changes between the current laser scan and the map in a localized robot. It uses the 'localizer_ranges' topic published by thin_localizer node, in order to determine which laser points are "close" to the map and which relates to objects not in the map (typically dynamic stuff, such as people moving in the environment).

Parameters:


```
#!text

- obstacle_margin_x : x margin of the detection space (default: 20.0) - front of the robot
- obstacle_margin_y : y margin of the detection space (default:  0.5) - side of the robot
  The following filter is applied: (x>0 && x<obstacle_margin_x && fabs(y)<obstacle_margin_y) 
- map_distance : distance from the map to activate detection (default: 0.75)

```

laser_analysis publishes two topics:

**laser_obstacle** (considering all the laser points)


```
#!text

stamp: 
  secs: 2182
  nsecs: 900000000
npoints: 34
mindist: 1.62096095085
y1: -0.490381844024
y2: 0.470933399785
```

- npoints: number of points detected in the detection area\\
- mindist: distance of the closest point detected\\
- y1,y2 : leftmost and rightmost point detected



**laser_obstacle_map** (considering only laser points with distance from the map > map_distance)


```
#!text

stamp: 
  secs: 2078
  nsecs: 200000000
npoints: 8
mx: 1.2499999851
my: -0.184673331911
var: 0.0073012683974
```


- npoints: number of points detected in the detection area
- mx,my: average position of all the points detected
- var : variance of all the points detected
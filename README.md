# 2D-Aircraft_Collision_Avoidance
  Aircraft Collision Avoidance System (ACAS) based on 2-D map. Being composed with pilots, aircraft, sensor detection, collision detection, actual direction modification components so that we can easily get access to each function.

# Component Flow Chart
![](image/Screen%20Shot%202017-12-24%20at%203.44.59%20AM.png)

# Functions
## AircraftCollisionSystem.m
  Main function for the whole system processing, It has initial variables of velocity, position, and directions. The experiment is set up as there are only two aircraft moving around 2-D map. In the AircraftCollisionSystem, with initial values, system sub components are called and ran. each sub process is connected with other processes using input and output parameters. Detecting functions return flag output for being used in main system function to consider which process would the process run as next procedure. The system is running while both aircraft arrive to the destinations. 

## detectRange.m
  Function for detecting the range of beggining to recognizing. In given condition, sensing range is 4-by-4 square km, and collision range is 1-by-1 square km. Thus, the system should deferenciate these two situations.
This simple function can detect the distance between two aircraft continuously and synchronously. A return value of detectRange function is an integer value 'flag', so that we can use this as checking if two aircraft are going to potentially meet at the range of 1-by-1 square. 

## detectCollision.m
  Important part of the system is checking the distance of 1-by-1 square range at every step of update. Since there are three possible direction change at every step, we should consider all the possibility for detecting the collision. In this function, the system is checking 9(3x3) possible executions.

## normal_modify.m
  At normal_modify function, the only things that we have to consider are whether the updated direction is possibile or not, and whether the updated position can be closer to destination or not. Two conditional executions would be considered in this function.
  
## detectCollision_modify.m
  It is similar to normal_modify.m function, but has some differences which are satisfying more improved requirements. Former parts of the function are exactly same as normal_modify function. After conducting the same process and getting the potential direction for modifying, it should run one more process which is for making only one aircraft heads closer to the destination and the other to detour around the opponents.
  
## Substitute functions to call
dist.m : Measuring distance between two positions.
check_closer_possible.m : Checking whether modified position is closer to destination than previous location or not.

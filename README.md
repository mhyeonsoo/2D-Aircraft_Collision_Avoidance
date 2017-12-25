# 2D-Aircraft_Collision_Avoidance
Aircraft Collision Avoidance System (ACAS) based on 2-D map. Being composed with pilots, aircraft, sensor detection, collision detection, actual direction modification components so that we can easily get access to each function.

# Component Flow Chart
![](image/Screen%20Shot%202017-12-24%20at%203.44.59%20AM.png)

# Separate Functions
## AircraftCollisionSystem.m
Main function for the whole system processing, It has initial variables of velocity, position, and directions. The experiment is set up as there are only two aircraft moving around 2-D map. In the AircraftCollisionSystem, with initial values, system sub components are called and ran. each sub process is connected with other processes using input and output parameters. Detecting functions return flag output for being used in main system function to consider which process would the process run as next procedure. The system is running while both aircraft arrive to the destinations. 

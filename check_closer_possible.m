function flag = check_closer_possible(x,y,theta,dest)
test1 = theta;
[x_est1,y_est1] = movement(x,y,test1);
test2 = mod(theta+1,4);
[x_est2,y_est2] = movement(x,y,test2);
test3 = mod(theta+3,4);
[x_est3,y_est3] = movement(x,y,test3);

if dist(x,y,dest(1),dest(2)) < dist(x_est1,y_est1,dest(1),dest(2)) && ...
   dist(x,y,dest(1),dest(2)) < dist(x_est2,y_est2,dest(1),dest(2)) && ...
   dist(x,y,dest(1),dest(2)) < dist(x_est3,y_est3,dest(1),dest(2))
    flag = 0;
else
    flag = 1;

end
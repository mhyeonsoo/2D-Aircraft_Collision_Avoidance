function flag = detectCollision(x1,y1,theta1,x2,y2,theta2)
test_t1 = theta1;
[x1_est1,y1_est1] = movement(x1,y1,test_t1);
test_t2 = theta2;
[x2_est1,y2_est1] = movement(x2,y2,test_t2);

test_t1 = mod(theta1+1,4);
[x1_est2,y1_est2] = movement(x1,y1,test_t1);
test_t2 = mod(theta2+1,4);
[x2_est2,y2_est2] = movement(x2,y2,test_t2);

test_t1 = mod(theta1+3,4);
[x1_est3,y1_est3] = movement(x1,y1,test_t1);
test_t2 = mod(theta2+3,4);
[x2_est3,y2_est3] = movement(x2,y2,test_t2);

% all possible excution of direction modification
if dist(x1_est1,y1_est1,x2_est1,y2_est1) <= sqrt(2) || dist(x1_est1,y1_est1,x2_est2,y2_est2) <= sqrt(2) ...
    || dist(x1_est2,y1_est2,x2_est3,y2_est3) <= sqrt(2) || dist(x1_est2,y1_est2,x2_est1,y2_est1) <= sqrt(2) ...
    || dist(x1_est2,y1_est2,x2_est2,y2_est2) <= sqrt(2) || dist(x1_est2,y1_est2,x2_est3,y2_est3) <= sqrt(2) ...
    || dist(x1_est3,y1_est3,x2_est1,y2_est1) <= sqrt(2) || dist(x1_est3,y1_est3,x2_est2,y2_est2) <= sqrt(2) ...
    || dist(x1_est3,y1_est3,x2_est3,y2_est3) <= sqrt(2)
    flag = 1;
else
    flag = 0;
end

end

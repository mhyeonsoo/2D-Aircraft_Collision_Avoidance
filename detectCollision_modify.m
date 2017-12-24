function [theta1_mod,theta2_mod] = detectCollision_modify(x1,y1,theta1,x2,y2,theta2,dest1,dest2)
% first estimated position
[x1_est,y1_est] = movement(x1,y1,theta1);
[x2_est,y2_est] = movement(x2,y2,theta2);

% define variable for checking wheter changing direction is only less than 90
% degree.
theta1_subtmp = theta1;
theta2_subtmp = theta2;
flag1 = 0;
flag2 = 0;

% if there is possible direction modification that make next position
% closer to destination than current position,
if check_closer_possible(x1,y1,theta1,dest1) == 1
    while (1)
        theta1_subtmp = randi([0 3],1,1);
        [x1_est,y1_est] = movement(x1,y1,theta1_subtmp);
        if (abs(theta1_subtmp - theta1) ==1 || abs(theta1_subtmp - theta1) == 3 || abs(theta1_subtmp - theta1) == 0)
            flag1 = 1;
        else
            theta1_subtmp = randi([0 3],1,1);
        end
        if dist(dest1(1),dest1(2),x1,y1) > dist(dest1(1),dest1(2),x1_est,y1_est) && flag1 == 1
            theta1_tmp = mod(theta1_subtmp,4);
            break;
        else
            theta1_subtmp = randi([0 3],1,1);      
        end
    end
% If there is no possible modification that make distance to destination
% closer.
else
    while (1)
        theta1_subtmp = randi([0 3],1,1);
        if (abs(theta1_subtmp - theta1) == 1 || abs(theta1_subtmp - theta1) == 3 || abs(theta1_subtmp - theta1) == 0)
            theta1_tmp = theta1_subtmp;
            break;
        else
            theta1_subtmp = randi([0 3],1,1);
        end
    end
end


if check_closer_possible(x2,y2,theta2,dest2) == 1
    while (1)
        theta2_subtmp = randi([0 3],1,1);
        [x2_est,y2_est] = movement(x2,y2,theta2_subtmp);
        if (abs(theta2_subtmp - theta2) ==1 || abs(theta2_subtmp - theta2) == 3 || abs(theta2_subtmp - theta2) == 0) 
            flag2 = 1;
        else
            theta2_subtmp = randi([0 3],1,1);
        end
        if dist(dest2(1),dest2(2),x2,y2) > dist(dest2(1),dest2(2),x2_est,y2_est) && flag2 == 1
            theta2_tmp = mod(theta2_subtmp,4);
            break;
        else
            theta2_subtmp = randi([0 3],1,1);
        end
    end
else
    while (1)
        theta2_subtmp = randi([0 3],1,1);
        if (abs(theta2_subtmp - theta2) == 1 || abs(theta2_subtmp - theta2) == 3 || abs(theta2_subtmp - theta2) == 0)
            theta2_tmp = theta2_subtmp;
            break;
        else
            theta2_subtmp = randi([0 3],1,1);
        end
    end  
end


% Check for whether there is possibility that next positions of aircraft
% can be within the 1x1 square distance or not.
theta1_new = theta1_tmp;
theta2_new = theta2_tmp;
flag = 0;
while (1)
    [x1_est,y1_est] = movement(x1,y1,theta1_new);
    [x2_est,y2_est] = movement(x2,y2,theta2_new);
    if dist(x1_est,y1_est,x2_est,y2_est) <= sqrt(2)
        flag = 0;
    else
        flag = 1;
    end
    if ( (theta2_new ~= theta2_tmp) && ( abs(theta2_new - theta2) == 1 || abs(theta2_new - theta2) == 3 ...
            || abs(theta2_new - theta2) == 0) ) && ( (theta1_new ~= theta1_tmp) && (abs(theta1_new - theta1) == 1 ...
            || abs(theta1_new - theta1) == 3 || abs(theta1_new - theta1) == 0) ) && flag == 1
        theta2_mod = theta2_new;
        theta1_mod = theta1_new;
        break;
    else
        theta2_new = randi([0 3],1,1);
        theta1_new = randi([0 3],1,1);
    end
end


end
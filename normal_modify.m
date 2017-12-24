function [theta1_mod,theta2_mod] = normal_modify(x1,y1,theta1,x2,y2,theta2,dest1,dest2)
% At normal modification function, the important thing is each aircraft
% does not have to consider about the other aircraft's location.
% They just can head to the destination.

% One applicable algorithm for this situation is, making the aircraft to
% choose the ideal direction which would be closer than the current
% position after it goes with decided direction.

[x1_est,y1_est] = movement(x1,y1,theta1);
[x2_est,y2_est] = movement(x2,y2,theta2);

theta1_tmp = theta1;
theta2_tmp = theta2;

if check_closer_possible(x1,y1,theta1,dest1) == 1
    flag1 = 0;
    while (1)
        theta1_tmp = randi([0 3],1,1);
        [x1_est,y1_est] = movement(x1,y1,theta1_tmp);
        if (abs(theta1_tmp - theta1) == 1 || abs(theta1_tmp - theta1) == 3 || abs(theta1_tmp - theta1) == 0)
            flag1 = 1;
        else
            theta1_tmp = randi([0 3],1,1);
            flag1 = 0;
        end
        if dist(dest1(1),dest1(2),x1,y1) > dist(dest1(1),dest1(2),x1_est,y1_est) && flag1 == 1
            theta1_mod = mod(theta1_tmp,4);
            break;
        else
            theta1_tmp = randi([0 3],1,1);
        end
    end
else
    while (1)
        theta1_tmp = randi([0 3],1,1);
        if (abs(theta1_tmp - theta1) == 1 || abs(theta1_tmp - theta1) == 3 || abs(theta1_tmp - theta1) == 0)
            theta1_mod = theta1_tmp;
            break;
        else
            theta1_tmp = randi([0 3],1,1);
        end
    end
end
    
if check_closer_possible(x2,y2,theta2,dest2) == 1
    flag2 = 0;
    while (1)
        theta2_tmp = randi([0 3],1,1);
        [x2_est,y2_est] = movement(x2,y2,theta2_tmp);
        if (abs(theta2_tmp - theta2) ==1 || abs(theta2_tmp - theta2) == 3 || abs(theta2_tmp - theta2) == 0) 
            flag2 = 1;
        else
            theta2_tmp = randi([0 3],1,1);
            flag2 = 0;
        end
        if dist(dest2(1),dest2(2),x2,y2) > dist(dest2(1),dest2(2),x2_est,y2_est) && flag2 == 1
            theta2_mod = mod(theta2_tmp,4);
            break;
        else
            theta2_tmp = randi([0 3],1,1);
        end
    end
else
    while (1)
        theta2_tmp = randi([0 3],1,1);
        if (abs(theta2_tmp - theta2) ==1 || abs(theta2_tmp - theta2) == 3 || abs(theta2_tmp - theta2) == 0)
            theta2_mod = theta2_tmp;
            break;
        else
            theta2_tmp = randi([0 3],1,1);
        end
    end
end


end

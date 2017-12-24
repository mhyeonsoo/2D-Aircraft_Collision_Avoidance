function f = AircraftCollisionSystem

%% set up the initial position, direction and velocity of aircraft 1 and aircraft 2

% % Getting Aircraft1's initial position and Aircraft2's initial position from user.
% prompt1 = 'What is the aircraft1 initial position? : (ex: [1,1], integer components) ';
% pos1 = input(prompt1);
% while (~isvector(pos1) || pos1(1) < 0 || pos1(2) < 0) || (pos1(1) ~= floor(pos1(1))) || (pos1(2) ~= floor(pos1(2)))
%     fprintf('The position has to be positive integer\n');
%     prompt1 = 'What is the aircraft1 initial position? : (ex: [1,1], integer components) ';
%     pos1 = input(prompt1);
% end
% prompt2 = 'What is the aircraft2 initial position? : (ex: [1,1], integer components) ';
% pos2 = input(prompt2);
% while (~isvector(pos2) || pos2(1) < 0 || pos2(2) < 0) || (pos2(1) ~= floor(pos2(1))) || (pos2(2) ~= floor(pos2(2)))
%     fprintf('The position has to be positive integer\n');
%     prompt2 = 'What is the aircraft2 initial position? : (ex: [1,1], integer components) ';
%     pos2 = input(prompt2);
% end
% 
% % setting aircrafts' current coordinates as seperate variables.
% x1 = pos1(1); y1 = pos1(2);
% x2 = pos2(1); y2 = pos2(2);
% 
% velocity
% default velocity of the aircraft are givne as 1. not actually used.
v1 = 1;
v2 = 1;

%% Initial theta (direction)
% In this project, we can set the initial direction as right(->) on x-axis.
theta1 = 0;
theta2 = 0;

%% Destinations
% % Getting Destinations of both Aircraft from the user.
% prompt3 = 'What is the aircraft1 destination position? : (ex: [1,1], integer components) ';
% dest1 = input(prompt3);
% while (~isvector(dest1) || dest1(1) < 0 || dest1(2) < 0) || (dest1(1) ~= floor(dest1(1))) || ...
%         (dest1(2) ~= floor(dest1(2)))
%     fprintf('The position has to be positive integer\n');
%     prompt3 = 'What is the aircraft1 destination position? : (ex: [1,1], integer components) ';
%     dest1 = input(prompt3);
% end
% prompt4 = 'What is the aircraft2 destination position? : (ex: [1,1], integer components) ';
% dest2 = input(prompt4);
% while (dest2(1) == dest1(1) && dest2(2) == dest1(2))
%     fprintf('Two destinations cannot be the same\n');
%     prompt4 = 'What is the aircraft2 destination position? : (ex: [1,1], integer components) ';
%     dest2 = input(prompt4);
% end
% while (~isvector(dest2) || dest2(1) < 0 || dest2(2) < 0) || (dest2(1) ~= floor(dest2(1))) || ...
%         (dest2(2) ~= floor(dest2(2)))
%     fprintf('The position has to be positive integer\n');
%     prompt4 = 'What is the aircraft2 destination position? : (ex: [1,1], integer components) ';
%     dest2 = input(prompt4);
% end
% 
% % setting aircrafts' destination coordinates as seperate variables.
% dstx1 = dest1(1); dsty1 = dest1(2);
% dstx2 = dest2(1); dsty2 = dest2(2);

dest1 = [6 6];
dest2 = [2 2];
x1 = 1; y1 = 1;
x2 = 7; y2 = 7;

%% Main system

% flag for checking whether one or both of the aircraft have been arrived
% to the destination or not.
arrived1_flag = 0;
arrived2_flag = 0;

% If the aircraft has been arrived, check only at the first time and after
% notifying that the aircraft has arrived, never check again.
already_checked1 = 0;
already_checked2 = 0;

flag_range = 0;
flag_collision = 0;

figure;
count = 1;

% Define and initialize the variables that would be used for modification.
mod_x1 = x1; mod_y1 = y1;
mod_x2 = x2; mod_y2 = y2;
mod_theta1 = theta1;
mod_theta2 = theta2;

while (arrived1_flag ~= 1 || arrived2_flag ~= 1)
    % Plot current position with whole trajectory
    if arrived1_flag == 0 && arrived2_flag == 0
        p1 = plot(mod_x1,mod_y1);set(gca,'XLim',[-2 10],'Ylim',[-2 10]);
        set(p1, 'Marker', 'h','MarkerSize',15);hold on
        set(p1,'MarkerEdgeColor' , [0 0 1]); set(p1, 'MarkerFaceColor', [0 1 0]);
        txt1 = '    Aircraft1';
        text(mod_x1,mod_y1,txt1);
        p2 = plot(mod_x2,mod_y2);set(p2, 'Marker', 'h','MarkerSize',15);
        set(p2,'MarkerEdgeColor' , [0 0 1]);set(p2, 'MarkerFaceColor', [1 1 0]);hold off
        txt2 = '    Aircraft2';
        text(mod_x2,mod_y2,txt2);
        title('Aircraft Collision Avoidance System');
        xlabel('X limits and Y limits are not actually matter');
        pause(0.4);
    elseif arrived1_flag == 1 && arrived2_flag == 0
        p1 = plot(mod_x1,mod_y1);set(gca,'XLim',[-2 10],'Ylim',[-2 10]);
        set(p1, 'Marker', 'h','MarkerSize',15);hold on
        set(p1,'MarkerEdgeColor' , [0 0 1]); set(p1, 'MarkerFaceColor', [0 1 0]);
        txt1 = '    Aircraft1';
        text(mod_x1,mod_y1,txt1);
        p2 = plot(mod_x2,mod_y2);set(p2, 'Marker', 'h','MarkerSize',15);
        set(p2,'MarkerEdgeColor' , [0 0 1]);set(p2, 'MarkerFaceColor', [1 1 0]);hold off
        txt2 = '    Aircraft2';
        text(mod_x2,mod_y2,txt2);
        title('Aircraft Collision Avoidance System');
        xlabel('X limits and Y limits are not actually matter');    
        pause(0.4);
    elseif arrived1_flag == 0 && arrived2_flag == 1
        p1 = plot(mod_x1,mod_y1);set(gca,'XLim',[-2 10],'Ylim',[-2 10]);
        set(p1, 'Marker', 'h','MarkerSize',15);hold on
        set(p1,'MarkerEdgeColor' , [0 0 1]); set(p1, 'MarkerFaceColor', [0 1 0]);
        txt1 = '    Aircraft1';
        text(mod_x1,mod_y1,txt1);
        p2 = plot(mod_x2,mod_y2);set(p2, 'Marker', 'h','MarkerSize',15);
        set(p2,'MarkerEdgeColor' , [0 0 1]);set(p2, 'MarkerFaceColor', [1 1 0]);hold off
        txt2 = '    Aircraft2';
        text(mod_x2,mod_y2,txt2);
        title('Aircraft Collision Avoidance System');
        xlabel('X limits and Y limits are not actually matter');
        pause(0.4);
    else
        break;
    end
    % check if aircraft1 has arrived
    if (mod_x1 == dest1(1) && mod_y1 == dest1(2)) && already_checked1 == 0
        arrived1_flag = 1;
        fprintf('aircraft1 has arrived\n');
        already_checked1 = 1;
    end
    
    % check if aircraft2 has arrived
    if (mod_x2 == dest2(1) && mod_y2 == dest2(2)) && already_checked2 == 0
        arrived2_flag = 1;
        fprintf('aircraft2 has arrived\n');
        already_checked2 = 1;
    end
    
    % When both aircraft have not been arrived
    if arrived1_flag == 0 && arrived2_flag == 0
        flag_range = detectRange(mod_x1,mod_y1,mod_theta1,mod_x2,mod_y2,mod_theta2);
        flag_collision = detectCollision(mod_x1,mod_y1,mod_theta1,mod_x2,mod_y2,mod_theta2);
        if flag_range == 1 && flag_collision == 1
            [mod_theta1, mod_theta2] = detectCollision_modify(mod_x1,mod_y1,mod_theta1,mod_x2,mod_y2,mod_theta2,dest1,dest2);
        else
            if detectCollision(mod_x1,mod_y1,mod_theta1,mod_x2,mod_y2,mod_theta2) == 1
                [mod_theta1, mod_theta2] = detectCollision_modify(mod_x1,mod_y1,mod_theta1,mod_x2,mod_y2,mod_theta2,dest1,dest2);
            else
                [mod_theta1, mod_theta2] = normal_modify(mod_x1,mod_y1,mod_theta1,mod_x2,mod_y2,mod_theta2,dest1,dest2);
            end
        end
        % actual update and movement of the aircraft
        [mod_x1,mod_y1] = movement(mod_x1,mod_y1,mod_theta1);
        [mod_x2,mod_y2] = movement(mod_x2,mod_y2,mod_theta2);
        
    % When Aircraft1 has been arrived
    elseif arrived1_flag == 1 && arrived2_flag == 0
        theta2_tmp = mod_theta2;
        [x2_est,y2_est] = movement(mod_x2,mod_y2,mod_theta2);
        if check_closer_possible(mod_x2,mod_y2,mod_theta2,dest2) == 1
            flag_t = 0;
            while (1)
                if (abs(theta2_tmp - mod_theta2) == 1 || abs(theta2_tmp - mod_theta2) == 3 || ...
                        abs(theta2_tmp - mod_theta2) == 0)
                    flag_t = 1;
                else
                    theta2_tmp = randi([0 3],1,1);
                    flag_t = 0;
                end
                if dist(dest2(1),dest2(2),mod_x2,mod_y2) > dist(dest2(1),dest2(2),x2_est,y2_est) && flag_t == 1
                    mod_theta2 = mod(theta2_tmp,4);
                    break;
                else
                    theta2_tmp = randi([0 3],1,1);
                    [x2_est,y2_est] = movement(mod_x2,mod_y2,theta2_tmp);
                end
            end
        else
            while (1)
                theta2_tmp = randi([0 3],1,1);
                if (abs(theta2_tmp - mod_theta2) == 1 || abs(theta2_tmp - mod_theta2) == 3 || ...
                        abs(theta2_tmp - mod_theta2) == 0)
                    mod_theta2 = theta2_tmp;
                    break;
                else
                    theta2_tmp = randi([0 3],1,1);
                end
            end
        end
        [mod_x2,mod_y2] = movement(mod_x2,mod_y2,mod_theta2);
    
    % When Aircraft2 has been arrived
    elseif arrived1_flag == 0 && arrived2_flag == 1
        theta1_tmp = mod_theta1;
        [x1_est,y1_est] = movement(mod_x1,mod_y1,mod_theta1);
        if check_closer_possible(mod_x1,mod_y1,mod_theta1,dest1) == 1
            flag_t = 0;
            while (1)
                if (abs(theta1_tmp - mod_theta1) == 1 || abs(theta1_tmp - mod_theta1) == 3 || ...
                        abs(theta1_tmp - mod_theta1) == 0)
                    flag_t = 1;
                else
                    theta1_tmp = randi([0 3],1,1);
                    flag_t = 0;
                end
                if dist(dest1(1),dest1(2),mod_x1,mod_y1) > dist(dest1(1),dest1(2),x1_est,y1_est) && flag_t == 1
                    mod_theta1 = mod(theta1_tmp,4);
                    break;
                else
                    theta1_tmp = randi([0 3],1,1);
                    [x1_est,y1_est] = movement(mod_x1,mod_y1,theta1_tmp);
                end
            end
        else
            while (1)
                theta1_tmp = randi([0 3],1,1);
                if (abs(theta1_tmp - mod_theta1) == 1 || abs(theta1_tmp - mod_theta1) == 3 || ...
                        abs(theta1_tmp - mod_theta1) == 0)
                    mod_theta1 = theta1_tmp;
                    break;
                else
                    theta1_tmp = randi([0 3],1,1);
                end
            end
        end
        [mod_x1,mod_y1] = movement(mod_x1,mod_y1,mod_theta1);
    else
        break;
    end
    count = count + 1;
    %refresh(1)
end
%hold off;

end

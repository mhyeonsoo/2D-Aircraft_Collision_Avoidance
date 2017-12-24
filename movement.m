function [x,y] = movement(x,y,theta)

if mod(theta,4) == 0
    x = x + 1;
elseif mod(theta,4) == 1
    y = y + 1;
elseif mod(theta,4) == 2
    x = x - 1;
elseif mod(theta,4) == 3
    y = y - 1;

end
function flag = detectRange(x1,y1,theta1,x2,y2,theta2)

[x1_mod,y1_mod] = movement(x1,y1,theta1);
[x2_mod,y2_mod] = movement(x2,y2,theta2);
if dist(x1_mod,y1_mod,x2_mod,y2_mod) <= sqrt(32)
    flag = 1;
else
    flag = 0;

end

end
function set_bodyR(R)
global uLINK

if nargin == 0
    uLINK(1).R = eye(3);
else
    uLINK(1).R = R;
end
ForwardKinematics(1);

clf
DrawAllJoints(1);
view(40,20)
axis equal
xlim([-0.7 0.7])
ylim([-0.7 0.7])
zlim([0.1 1.5])
grid on
title(num2str(uLINK(1).R))
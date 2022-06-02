function set_angles(idx,q)
global uLINK

if nargin == 1
    q = zeros(length(idx),1);
end
SetJointAngles(idx,q);

clf
DrawAllJoints(1);
view(40,20)
axis equal
xlim([-0.7 0.7])
ylim([-0.7 0.7])
zlim([0.0 1.2])
grid on
function set_angles(idx,q)
global uLINK

SetJointAngles(idx,q);

clf
DrawAllJoints(1);
view(40,20)
axis equal
xlim([-0.6 0.6])
ylim([-0.6 0.6])
zlim([0.1 1.2])
grid on
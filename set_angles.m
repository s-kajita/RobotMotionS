function set_angles(idx,q)
global uLINK AxisLimitInfo

if nargin == 1
    q = zeros(length(idx),1);
end
SetJointAngles(idx,q);

[az,el] = view;  % remember view angle

clf
DrawAllJoints(1);
view(az,el)      % recover view angle
axis equal
if exist('AxisLimitInfo')
    xlim(AxisLimitInfo.xl);
    ylim(AxisLimitInfo.yl);
    zlim(AxisLimitInfo.zl);
end
grid on
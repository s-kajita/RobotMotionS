% ロボットを表示
% show_robot.m
% 2022 May 19 s.kajita Chubu Univ.

close all
clear              % 作業領域のメモリを初期化

SetupBipedRobotS;   % 図2.19，図2.20の2足歩行ロボットのデータを設定


uLINK(BODY).p = [0.0, 0.0, 0.75]';
uLINK(BODY).R = eye(3);
ForwardKinematics(1);

clf
DrawAllJoints(1);
view(40,20)
axis equal
if exist('AxisLimitInfo')
    xlim(AxisLimitInfo.xl);
    ylim(AxisLimitInfo.yl);
    zlim(AxisLimitInfo.zl);
end
grid on
    

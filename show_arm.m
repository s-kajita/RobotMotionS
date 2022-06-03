% ロボットを表示
% show_arm.m
% 2022 May 29 s.kajita Chubu Univ.

close all
clear           % 作業領域のメモリを初期化

SetupCraneX7;   %  Crane-X7 を設定


uLINK(BASE).p = [0.0, 0.0, 0.0]';
uLINK(BASE).R = eye(3);
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
    

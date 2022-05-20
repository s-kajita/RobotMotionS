% ロボットを表示
% show_robot.m
% 2022 May 19 s.kajita Chubu Univ.

if ~exist('uLINK')
    close all
    clear              % 作業領域のメモリを初期化
    global uLINK       % グローバル変数として，外部関数からの参照を可能にする

    SetupBipedRobotS;   % 図2.19，図2.20の2足歩行ロボットのデータを設定
end


uLINK(BODY).p = [0.0, 0.0, 0.75]';
uLINK(BODY).R = eye(3);
ForwardKinematics(1);

clf
DrawAllJoints(1);
view(40,20)
axis equal
xlim([-0.6 0.6])
ylim([-0.6 0.6])
zlim([0.1 1.2])
grid on
    

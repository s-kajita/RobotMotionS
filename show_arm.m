% ロボットを表示
% show_arm.m
% 2022 May 29 s.kajita Chubu Univ.

if ~exist('uLINK')
    close all
    clear              % 作業領域のメモリを初期化
    global uLINK       % グローバル変数として，外部関数からの参照を可能にする

    SetupCraneX7;   %  Crane-X7 を設定
end


uLINK(BASE).p = [0.0, 0.0, 0.0]';
uLINK(BASE).R = eye(3);
ForwardKinematics(1);

clf
DrawAllJoints(1);
view(40,20)
axis equal
xlim([-0.7 0.7])
ylim([-0.7 0.7])
zlim([0.0 1.0])
grid on
    

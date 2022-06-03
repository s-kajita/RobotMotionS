% ���{�b�g��\��
% show_robot.m
% 2022 May 19 s.kajita Chubu Univ.

close all
clear              % ��Ɨ̈�̃�������������

SetupBipedRobotS;   % �}2.19�C�}2.20��2�����s���{�b�g�̃f�[�^��ݒ�


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
    

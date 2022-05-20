% ���{�b�g��\��
% show_robot.m
% 2022 May 19 s.kajita Chubu Univ.

if ~exist('uLINK')
    close all
    clear              % ��Ɨ̈�̃�������������
    global uLINK       % �O���[�o���ϐ��Ƃ��āC�O���֐�����̎Q�Ƃ��\�ɂ���

    SetupBipedRobotS;   % �}2.19�C�}2.20��2�����s���{�b�g�̃f�[�^��ݒ�
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
    

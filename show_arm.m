% ���{�b�g��\��
% show_arm.m
% 2022 May 29 s.kajita Chubu Univ.

if ~exist('uLINK')
    close all
    clear              % ��Ɨ̈�̃�������������
    global uLINK       % �O���[�o���ϐ��Ƃ��āC�O���֐�����̎Q�Ƃ��\�ɂ���

    SetupCraneX7;   %  Crane-X7 ��ݒ�
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
    

% ���^���w�̃f���@�����_���Ȏp����\��
% fk_random.m
% 2004 Dec.17 s.kajita AIST

close all
clear              % ��Ɨ̈�̃�������������
global uLINK       % �O���[�o���ϐ��Ƃ��āC�O���֐�����̎Q�Ƃ��\�ɂ���

SetupBipedRobot;   % �}2.19�C�}2.20��2�����s���{�b�g�̃f�[�^��ݒ�

%%%%%%%%%%% �����_���Ȏp���@%%%%%%%%%%%%

rand('state',0);  %�����������

figure
while 1
    qR1 = 2/3*pi*(rand(6,1)-0.5);  %  -pi/2 < q < pi/2
    qR1(4) = pi*rand;          %   0 < q4 < pi 
    
    qL1 = pi*(rand(6,1)-0.5);  %  -pi/2 < q < pi/2
    qL1(4) = pi*rand;          %   0 < q4 < pi 
    
    for n=0:5
        uLINK(RLEG_J0+n).q = qR1(n+1);
        uLINK(LLEG_J0+n).q = qL1(n+1);
    end
    
    uLINK(BODY).p = [0.0, 0.0, 0.7]';
    uLINK(BODY).R = eye(3);
    ForwardKinematics(1);
    
    clf
    DrawAllJoints(1);
    view(38,14)
    axis equal
    zlim([0.1 1.3])
    grid on
    
    fprintf('Ctrl-C:�I��, ����ȊO�F�ʂ̎p����\��\n');
    pause
end

%%%  robot_simulation.m
%%%  �P�ʃx�N�g���@�ɂ�铮�͊w�V�~�����[�V����
%%%  ���F���ʂƂ̐ڐG���͂��v�Z���Ă��Ȃ��̂Ŏ��R�������邾���ł��D
close all
clear

global uLINK G
G = 9.8;  % �d�͉����x [m/s^2]

SetupBipedRobot2;   % �}2.19�C�}2.20��2�����s���{�b�g�̃f�[�^��ݒ�i�d�S�ʒu�C�����e���\���t�j

%%%%%% ���̂̋�ԑ��x�E�����x %%%%%
uLINK(BODY).vo = [0, 0, 0]';
uLINK(BODY).w  = [0, 0, 0]';

uLINK(BODY).dvo = [0, 0, 0]';
uLINK(BODY).dw  = [0, 0, 0]';

%%%%%%%�@�֐߃g���N %%%%%%%
u_joint = zeros(length(uLINK),1); % �S�֐߃g���N��0�ɐݒ�
u_joint(RLEG_J2) = -10.0;   % �E�Ҋ֐߃s�b�`���Ƀg���N��^����@[Nm]

%%%%%%% �V�~�����[�V���� %%%%%%%
global Dtime

Dtime = 0.005;
EndTime = 0.3;
time = 0:Dtime:EndTime;
tsize = length(time);
com_m = zeros(tsize,3);

figure
tic
for k = 1:tsize
    %fprintf('time=%f\n',time(n))
    ForwardDynamics; 
    
    IntegrateEuler(1);    
    com = calcCoM;
    com_m(k,:) = com';
    
    hold off
    newplot
    DrawAllJoints(1);
    axis equal
    set(gca,...
        'CameraPositionMode','manual',...
        'CameraPosition',[4,4,1],...
        'CameraViewAngleMode','manual',....
        'CameraViewAngle',15,...
        'Projection','perspective',... 
        'XLimMode','manual',...
        'XLim',[-0.5 0.5],...
        'YLimMode','manual',...
        'YLim',[-0.5 0.5],...
        'ZLimMode','manual',...
        'ZLim',[0 1.5])
    grid on
    text(0.5, -0.4, 1.4, ['time=',num2str(time(k),'%5.3f')])

    drawnow;
%    if k == 1
%      Mov = moviein(tsize);
%    end
%    Mov(:,k) = getframe;   
end        
toc

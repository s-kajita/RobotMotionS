% top_simulation.m
% �R�}�̉^���̃V�~�����[�V����
clear
close all
global uLINK G
G = 9.8;
r = 0.2; a = 0.05; c = 0.2;           % �~�Ղ̔��a,���݁C���̒���/2 [m]
MakeTop(1, r,a,c);

uLINK(1).p = [0 0 0.3]';                 % �����ʒu [m]
uLINK(1).R = Rodrigues([1 0 0],pi/50);   % �����p��
uLINK(1).vo= [0 0 0]';                   % �����x [m/s]
uLINK(1).w = [0 0 50]';                  % �����p���x [rad/s]
Dtime   = 0.002;
EndTime = 2.0;
time  = 0:Dtime:EndTime;
frame_skip = 3;
figure
AX=[-0.2 0.4];  AY=[-0.3 0.3]; AZ=[0 0.8];  % 3D�\���͈�
for n = 1:length(time)
    [f,tau] = TopForce(1);                           % �O�͂̌v�Z
    [P,L]   = SE3dynamics(1,f,tau);                  % �����x�̌v�Z    
    [uLINK(1).p, uLINK(1).R] = SE3exp(1, Dtime);           % �ʒu�E�p���̍X�V       
    uLINK(1).w = uLINK(1).w + Dtime * uLINK(1).dw;   % �p���x�̍X�V
    uLINK(1).vo= uLINK(1).vo+ Dtime * uLINK(1).dvo;  % ���x�̍X�V
    if mod(n,frame_skip) == 0
         ShowObject;                                 % �\��
    end
end

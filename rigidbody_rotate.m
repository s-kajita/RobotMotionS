global uLINK
lx  = 0.1; ly  = 0.4; lz  = 0.9;         % �c�C���C���� [m]
mass = 36.0;                             % ���� [kg]
MakeRigidBody(1, [lx ly lz], mass);      % �����̂̃f�[�^���쐬

uLINK(1).p = [0.0, 0.0, 0]'; % �����ʒu [m]
uLINK(1).R = eye(3);         % �����p��
uLINK(1).w = [1, 1, 1]';     % �����p���x [rad/s]
Dtime   = 0.02;           % �ϕ��X�e�b�v [s]
EndTime = 5.0;            % �I������ [s]
time  = 0:Dtime:EndTime;
figure
AX=[-0.5 0.5]; AY=[-0.5 0.5]; AZ=[-0.5 1.0]; % 3D�\���͈�
for n = 1:length(time)
    L = EulerDynamics(1);    % Euler�̉^��������
    uLINK(1).R = Rodrigues(uLINK(1).w, Dtime) * uLINK(1).R; % Rodrigues
    uLINK(1).w = uLINK(1).w + Dtime * uLINK(1).dw;          % Euler�@
    ShowObject;                 %  ���̂�`�悷��
end        
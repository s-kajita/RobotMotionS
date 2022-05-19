% ForwardDynamics.m
% �P�ʃx�N�g���@�Ɋ�Â������͊w�̌v�Z
nDoF = length(uLINK)-1+6;
A = zeros(nDoF,nDoF);
b = InvDyn(0);
for n=1:nDoF
    A(:,n) = InvDyn(n) - b;
end

% ���[�^�d�@�q�������[�����g�̌���
for n=7:nDoF
    j = n-6+1;
    A(n,n) = A(n,n) + uLINK(j).Ir * uLINK(j).gr^2;
end

% �����x�̌v�Z
u   = [0 0 0 0 0 0 u_joint(2:end)']';
ddq = A \ (-b + u);
uLINK(1).dvo = ddq(1:3);
uLINK(1).dw  = ddq(4:6);
for j=2:length(uLINK)
    uLINK(j).ddq = ddq(j+6-1);
end

function L = EulerDynamics(j)
global uLINK
I = uLINK(j).R * uLINK(j).I * uLINK(j).R';    % �����e���\��
L = I * uLINK(j).w;                           % �p�^����
uLINK(j).dw  = I \ (-cross(uLINK(j).w, L));   % Euler�̕�����
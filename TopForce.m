function [f,t] = TopForce(j)
global uLINK G
w_c = uLINK(j).R * uLINK(j).c + uLINK(j).p;   % �d�S�ʒu
f = [0 0 -uLINK(j).m * G]';    % �d��
t = cross(w_c, f);            % �d�͂ɂ�錴�_��胂�[�����g

if uLINK(j).p(3) < 0.0  % �x�_�͏��ʂƐڐG���Ă���
    Kf = 1.0E+4;        % ���ʂ̍���[N/m]
    Df = 1.0E+3;        % ���ʂ̔S��[N/(m/s)]
    v = uLINK(j).vo + cross(uLINK(j).w,uLINK(j).p);  % �x�_�̑��x
    fc = [-Df*v(1)  -Df*v(2) -Kf*uLINK(j).p(3)-Df*v(3)]';
    f = f + fc;
    t = t + cross(uLINK(j).p, fc);
end

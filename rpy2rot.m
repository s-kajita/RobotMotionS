function rot = rpy2rot(q,pitch,yaw)

if nargin == 1
    yaw = q(3);
    pitch = q(2);
    roll  = q(1);
else
    roll = q;
end


Cphi = cos(roll);  Sphi = sin(roll);
Cthe = cos(pitch); Sthe = sin(pitch);
Cpsi = cos(yaw);   Spsi = sin(yaw);

rot = [Cpsi*Cthe  -Spsi*Cphi+Cpsi*Sthe*Sphi  Spsi*Sphi+Cpsi*Sthe*Cphi;
       Spsi*Cthe  Cpsi*Cphi+Spsi*Sthe*Sphi   -Cpsi*Sphi+Spsi*Sthe*Cphi;
       -Sthe      Cthe*Sphi                  Cthe*Cphi                 ];

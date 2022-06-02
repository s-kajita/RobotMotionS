%%% SetupCraneX7.m
%%% Set biped robot structure of Figure 2.19, 2.20
%%% Field definition: Table 2.1 Link Parameters

global uLINK

ToDeg = 180/pi;
ToRad = pi/180;
UX = [1 0 0]';
UY = [0 1 0]';
UZ = [0 0 1]';

uLINK    = struct('name','BASE'    , 'm', 10, 'sister', 0, 'child', 2, 'b',[0  0    0.05]','a',UZ,'q',0);

uLINK(2) = struct('name','J1' , 'm',  5, 'sister', 0, 'child', 3, 'b',[0 0 0.12]'   ,'a',UZ,'q',0);
uLINK(3) = struct('name','J2' , 'm',  2, 'sister', 0, 'child', 4, 'b',[0 0 0.055]'   ,'a',UY,'q',0);
uLINK(4) = struct('name','J3' , 'm',  5, 'sister', 0, 'child', 5, 'b',[0.05 0  0]'  ,'a',UX,'q',0);
uLINK(5) = struct('name','J4' , 'm',  1, 'sister', 0, 'child', 6, 'b',[0.20 0  0]'  ,'a',UY,'q',0);
uLINK(6) = struct('name','J5' , 'm',  1, 'sister', 0, 'child', 7, 'b',[0.13 0  0]'  ,'a',UX,'q',0);
uLINK(7) = struct('name','J6' , 'm',  2, 'sister', 0, 'child', 8, 'b',[0.12 0  0]'  ,'a',UY,'q',0);
uLINK(8) = struct('name','J7' , 'm',  1, 'sister', 0, 'child', 0, 'b',[0 0 -0.043]'  ,'a',UZ,'q',0);

[uLINK(1).vertex,uLINK(1).face]   = MakeBox([0.1 0.1 0.1]  ,[0.05 0.05 0.0] );    % BASE
[uLINK(8).vertex,uLINK(8).face]   = MakeBox([0.05 0.05 0.02] ,[0.025  0.025 0.04]);    % Hand
AddBox(8, [0.01 0.04 0.05], [0.005+0.02 0.02 0.09]);
AddBox(8, [0.01 0.04 0.05], [0.005-0.02 0.02 0.09])

FindMother(1);   % Find mother link from sister and child data

%%% Substitute the ID to the link name variables. For example, BODY=1.
for n=1:length(uLINK)
    eval([uLINK(n).name,'=',num2str(n),';']);
end

uLINK(BASE).p = [0.0, 0.0, 0.0]';
uLINK(BASE).R = eye(3);
ForwardKinematics(1);

uLINK(BASE).v = [0 0 0]';
uLINK(BASE).w = [0 0 0]';
for n=1:length(uLINK)
    uLINK(n).dq     = 0;            % joint speed   [rad/s]
end
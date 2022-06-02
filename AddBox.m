function AddBox(j, wdh , origin_xyz)
% Setup box object to uLINK 
% wdh : [width depth height] (size in xyz)
global uLINK

wdh = reshape(wdh, 3,1);
origin_xyz = reshape(origin_xyz, 3,1);
         
[vert, face] = MakeBox(wdh  ,origin_xyz); % size [x y z], origin [x0 y0 z0]

if isempty(uLINK(j).vertex)
    uLINK(j).vertex = vert;
    uLINK(j).face   = face;
else
    Nvert = size(uLINK(j).vertex, 2);
    uLINK(j).vertex = [uLINK(j).vertex vert];
    uLINK(j).face   = [uLINK(j).face face+Nvert];
end

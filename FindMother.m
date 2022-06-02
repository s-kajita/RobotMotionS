function FindMother(j)
global uLINK

if j ~= 0
    if j == 1
        uLINK(j).mother = 0;
    end
    if uLINK(j).child ~= 0  
        %fprintf('j= %d uLINK(j).child=%d ',j, uLINK(j).child)
        child = uLINK(j).child;
        uLINK(child).mother = j;
        %fprintf(' %d \n',uLINK(child).mother)
        FindMother(child);
    end
    if uLINK(j).sister ~= 0
        sister = uLINK(j).sister;
        uLINK(sister).mother = uLINK(j).mother;
        FindMother(sister);
    end
end
function PrintLinkName(j)
global uLINK  % �O���[�o���ϐ�uLINK���Q�Ƃ���

if j ~= 0
    fprintf('j=%2d : %s\n',j,uLINK(j).name); % �����̖��O��\��
    PrintLinkName(uLINK(j).child);       % ���̖��O��\��
    PrintLinkName(uLINK(j).sister);      % ���̖��O��\��
end

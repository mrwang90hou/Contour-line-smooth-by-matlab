%freeman��������
clc,clear;
load('newPointLines(XY)Number-rifeng.mat')
lines = newpointLine11(1:88,:);
%8������0��1��2��3��4��5��6��7
judgeDirection = [
1,0;
1,1;
0,1;
-1,1;
-1,0;
-1,-1;
0,-1;
1,-1];
%��ʼ��Cn�����Լ�¼����
% Cn = ones(length(lines));
for i=1:length(lines)-1         %(n-1)
    A = lines(i,:);
    B = lines(i+1,:);
    %�����
    differXY = sign(B-A);%��������0���ж�
    row = find(ismember(judgeDirection,differXY,'rows'));%�ж�ƥ��������
    Cn(i) = row-1;
end
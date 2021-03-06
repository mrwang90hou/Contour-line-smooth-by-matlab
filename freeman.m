%%freeman链码生成
clc,clear;
load('newPointLines(XY)Number-rifeng.mat')
lines = newpointLine11(1:88,:);
figure;
plot(lines(:,1),lines(:,2),'b.');
hold on;
plot(lines(:,1),lines(:,2),'r-');


%8个方向：0，1，2，3，4，5，6，7
judgeDirection = [
1,0;
1,1;
0,1;
-1,1;
-1,0;
-1,-1;
0,-1;
1,-1];
%初始化Cn，用以记录链码
% Cn = ones(length(lines));
for i=1:length(lines)-1         %(n-1)
    A = lines(i,:);
    B = lines(i+1,:);
    %做差处理
    differXY = sign(B-A);%正、负、0的判断
    row = find(ismember(judgeDirection,differXY,'rows'));%判断匹配所在行
    Cn(i) = row-1;
end
%%
newLines = newpointLine11(126:213,:);
x = newLines(:,1);
y = newLines(:,2);
plot(x,y,'.')

function  newpointLine = drawLunKuoLines(str)
%UNTITLED17 此处显示有关此函数的摘要
%   此处显示详细说明

%imshow(data);


% str='日丰-锯齿-中右.jpg';

data = imread(str);
% data2 = data
[X,Y]=getCoordinate(data);%获取坐标函数
total =[X,-Y];
% figure;
% plot(X,-Y,'.');
%存储像素点的顺序方法
total(1,:)%先删除一点
len = length(total);
total = sortrows(total,2);
total = sortrows(total,1);
Total = total;
newPoint = total(1,:);
total(1,:) = [];
disp(str);
disp('起始点坐标为：');
disp(newPoint);
newpointLine = zeros(len+1,2);
i=1;
while ~isempty(total)
    newpointLine(i,:) = newPoint;
    x=newPoint(1,1);
    y=newPoint(1,2);
%     judge = abs(x1-x2)||abs(y1-y2);
    %total(1,:) = [];
    [a1,~,~]=find(total(:,1)==[x-1,x,x+1]);%x值位置的判断
    [a2,~,~]=find(total(:,2)==[y-1,y,y+1]);%y值位置的判断
    a3 = a1(ismember(a1,a2));%取出相同坐标

    [m,n]=size(a3);
    if  m==2%如果出现2个点（起始点），则取顺时针方向，靠上点（y值大的点）
        %列出（x,y）周围8点坐标，从而标出取点顺序【顺时针】：（x,y+1）->(x-1,y+1)
        judgeArray = getJudgeArray(x,y);
        sameRow = ismember(judgeArray,total(a3,:),'rows');%元素相同的行
        finalArray = judgeArray(find(sameRow),:);
%         [~,q,~] = find(a3 == max(total(a3,:));
        newPoint = finalArray(1,:);
        r = find(ismember(total,newPoint,'rows'));
        total(r(1),:) = [];
    else%m=1
        newPoint = total(a3,:);
        total(a3,:) = [];
    end
    %%%存在不相邻的轮廓线
    if isempty(a3)
        %寻找距离该点最近的一个点（即：x差和y差最少的一个点）
        total2 = [];
        total2(:,1) = abs(total(:,1)-x);
        total2(:,2) = abs(total(:,2)-y);
        distance = abs(total(:,1)-x).^2+abs(total(:,2)-y).^2;
        weizhi = find(distance == min(distance));%找到距离最短的位置
        if length(weizhi)>1
            array = total(weizhi,:)%输出【3*3以外判断且存在多点】的位置坐标
            weizhi2 = weizhi(2);
        else
            weizhi2 = weizhi(1);
        end
        newPoint = total(weizhi2,:);
        total(weizhi2,:) = [];

    end
    i=i+1;

end
newpointLine(i,:) = newPoint;
newpointLine(len+1,:) = Total(1,:);
figure;
plot(X,-Y,'r.');
%plot(t,yy5,'k','linewidth',3);  % 绘制平滑后波形图
grid on;
hold on;
plot(newpointLine(:,1),newpointLine(:,2),'b-')

title([str,'    轮廓线绘制图']);
xlabel('x');
xlabel('y');
% legend('加噪波形','平滑后波形');
end


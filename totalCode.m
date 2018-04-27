%轮廓线平滑处理步骤
% S1:划分连通域
% S2:连通域逐个处理【注：坐标范围为整个图片的范围】
%     (1)像素放大
%     (2)提取轮廓线坐标
%     (3)平滑处理
%     (4)重新赋值该连通域的轮廓线坐标
% S3:重新绘制该图的轮廓线

clc
clear
newpointLine11 = drawLunKuoLines('日丰-锯齿-左上.jpg');
newpointLine12 = drawLunKuoLines('日丰-锯齿-右上.jpg');
%%%%%%%%%%%%%%%%%%%%%%%修缮日丰商标中部区域轮廓线的排序方法！！！！
newpointLine21 = drawLunKuoLines('日丰-锯齿-中左.jpg');
figure;
plot(newpointLine21(:,1),newpointLine21(:,2),'r.')
grid on;
hold on;
plot(newpointLine21(1,1),newpointLine21(1,2),'r*')
grid on;
hold on;
plot(newpointLine21(:,1),newpointLine21(:,2),'b-')
title(['日丰-锯齿-中左.jpg','    轮廓线绘制图']);
xlabel('x');
xlabel('y');
%%%%%%%%%%%%%%%%%%%%%%%%
newpointLine22 = drawLunKuoLines('日丰-锯齿-中右.jpg');
figure;
plot(newpointLine22(:,1),newpointLine22(:,2),'r.')
grid on;
hold on;
plot(newpointLine22(1,1),newpointLine22(1,2),'r*')
grid on;
hold on;
plot(newpointLine22(:,1),newpointLine22(:,2),'b-')
title(['日丰-锯齿-中右.jpg','    轮廓线绘制图']);
xlabel('x');
xlabel('y');
%%%%%%%%%%%%%%%%%%%%%%%
newpointLine31 = drawLunKuoLines('日丰-锯齿-左下.jpg');
newpointLine32 = drawLunKuoLines('日丰-锯齿-右下.jpg');

%imshow(data);
[X,Y]=getCoordinate(data);%获取坐标函数
total =[X,-Y];
% figure;
% plot(X,-Y,'.');
%存储像素点的顺序方法
total(1,:)%先删除一点
len = length(total);
% 第1个点：(x1,y1);
% 第2个点：(x2,y2);
% for i=1:len
%     for j=1:len
%         a=total(i,j);
%         b=total(i,j);
%         x1=a(1);
%         y1=a(2);
%         x2=b(1);
%         y2=b(2);
%         %如果不在9宫格内，则跳出循环
%         if(abs(x1-x2)>1||abs(y1-y2)>1)
%             break;
%         else
%             distance = dist(a,b);%求得两点间距离
%             switch distance
%                 case 1
%                     break;
%                 case sqrt(2)
%                     break;
%                 otherwise
%                     break;
%             end
%         end
%     end
% end
%确保起点为左下角点（排序处理）

total = sortrows(total,2);
total = sortrows(total,1);
Total = total;
newPoint = total(1,:);
total(1,:) = [];
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
%     if ~isempty(a1)
%         total2= total(a1,:);
%         [a2,~,~]=find(total2(:,2)==[y-1,y,y+1]);%y值位置的判断
%         if ~isempty(a2)
%             total3= total(a2,:);
%         else
%             total3 = [];
%         end
%     end
    [m,n]=size(a3);
    if  m==2%如果出现2个点（起始点），则取顺时针方向，靠上点（y值大的点）
        %列出（x,y）周围8点坐标，从而标出取点顺序【顺时针】：（x,y+1）->(x-1,y+1)
        judgeArray = getJudgeArray(x,y);
        sameRow = ismember(judgeArray,total(a3,:),'rows');%元素相同的行
        finalArray = judgeArray(find(sameRow),:);
%         [~,q,~] = find(a3 == max(total(a3,:));
        newPoint = finalArray(1,:);
        r = find(ismember(total,newPoint,'rows'))
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
            array = total(weizhi,:);%找到距离超出【3*3方格】的像素点
            weizhi2 = weizhi(2);
        else
            weizhi2 = weizhi(1);
        end
        newPoint = total(weizhi2,:);
        total(weizhi2,:) = [];
        %先取y，向右取
%         break;
%         newPoint = [newY,newY];
    end
    i=i+1;
    %判断[14,-48]何时消失
%     tt=[14,-48];
%     ttt = find(ismember(total,tt,'rows'))
%     if isempty(ttt)
%         break;
%     end
end
newpointLine(i,:) = newPoint;
newpointLine(len+1,:) = Total(1,:);
figure;
plot(X,-Y,'r.');
%plot(t,yy5,'k','linewidth',3);  % 绘制平滑后波形图
grid on;
hold on;
plot(newpointLine(:,1),newpointLine(:,2),'b-')
% 
% 
% 
% a = [3,0];%任意数1，x,y坐标
% b = [0,4];%任意数2，x,y坐标
% dist(a,b)

% a = [1,2];%任意数1，x,y坐标
% b = [4,6];%任意数2，x,y坐标
% 
% dist(a,b)
% d = norm(a-b);
% plot(a,b,'.-');

% %像素放大处理
% data2=imresize(data,4);        %放大2倍
% figure;
% imshow(data2);
% getCoordinate(data2);%获取坐标函数
% %分段处理
% a=[0,0,0,0,0,0,0,0,0;
%     0,120,120,120,120,120,120,120,0;
%     0,120,200,200,200,200,200,120,0;
%     0,120,200,255,255,255,200,120,0;
%     0,120,200,255,255,255,200,120,0;
%     0,120,200,255,255,255,200,120,0;
%     0,120,200,200,200,200,200,120,0;
%     0,120,120,120,120,120,120,120,0;
%     0,0,0,0,0,0,0,0,0];
% gdata = a;
% %%%%%%%%%%%%%%%见uint.mat变量%%%%%%%%%%%%%
% % gdata =
% % 
% %   9×9 uint8 矩阵
% % 
% %    255   255   255   255   255   255   255   255   255
% %    255   120   120   120   120   120   120   120   255
% %    255   120   100   100   100   100   100   120   255
% %    255   120   100     1     1     1   100   120   255
% %    255   120   100     1     1     1   100   120   255
% %    255   120   100     1     1     1   100   120   255
% %    255   120   100   100   100   100   100   120   255
% %    255   120   120   120   120   120   120   120   255
% %    255   255   255   255   255   255   255   255   255
% % 
% 
% for i=1:81
%     if(a(i)==0)
%         a(i)=255;
%     end
% end
% 
% % 
% % %在一定范围内筛选坐标
% % for(colX=1:1024 )   
% %     for(rowY=1:768)       
% %         if(colX>374 & colX<481 &rowY>146 &rowY<246)          
% %         [colX,rowY]  %输出坐标         
% %         end
% %     end
% % end

%������ƽ��������
% S1:������ͨ��
% S2:��ͨ���������ע�����귶ΧΪ����ͼƬ�ķ�Χ��
%     (1)���طŴ�
%     (2)��ȡ����������
%     (3)ƽ������
%     (4)���¸�ֵ����ͨ�������������
% S3:���»��Ƹ�ͼ��������

clc
clear
newpointLine11 = drawLunKuoLines('�շ�-���-����.jpg');
newpointLine12 = drawLunKuoLines('�շ�-���-����.jpg');
%%%%%%%%%%%%%%%%%%%%%%%�����շ��̱��в����������ߵ����򷽷���������
newpointLine21 = drawLunKuoLines('�շ�-���-����.jpg');
figure;
plot(newpointLine21(:,1),newpointLine21(:,2),'r.')
grid on;
hold on;
plot(newpointLine21(1,1),newpointLine21(1,2),'r*')
grid on;
hold on;
plot(newpointLine21(:,1),newpointLine21(:,2),'b-')
title(['�շ�-���-����.jpg','    �����߻���ͼ']);
xlabel('x');
xlabel('y');
%%%%%%%%%%%%%%%%%%%%%%%%
newpointLine22 = drawLunKuoLines('�շ�-���-����.jpg');
figure;
plot(newpointLine22(:,1),newpointLine22(:,2),'r.')
grid on;
hold on;
plot(newpointLine22(1,1),newpointLine22(1,2),'r*')
grid on;
hold on;
plot(newpointLine22(:,1),newpointLine22(:,2),'b-')
title(['�շ�-���-����.jpg','    �����߻���ͼ']);
xlabel('x');
xlabel('y');
%%%%%%%%%%%%%%%%%%%%%%%
newpointLine31 = drawLunKuoLines('�շ�-���-����.jpg');
newpointLine32 = drawLunKuoLines('�շ�-���-����.jpg');

%imshow(data);
[X,Y]=getCoordinate(data);%��ȡ���꺯��
total =[X,-Y];
% figure;
% plot(X,-Y,'.');
%�洢���ص��˳�򷽷�
total(1,:)%��ɾ��һ��
len = length(total);
% ��1���㣺(x1,y1);
% ��2���㣺(x2,y2);
% for i=1:len
%     for j=1:len
%         a=total(i,j);
%         b=total(i,j);
%         x1=a(1);
%         y1=a(2);
%         x2=b(1);
%         y2=b(2);
%         %�������9�����ڣ�������ѭ��
%         if(abs(x1-x2)>1||abs(y1-y2)>1)
%             break;
%         else
%             distance = dist(a,b);%�����������
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
%ȷ�����Ϊ���½ǵ㣨������

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
    [a1,~,~]=find(total(:,1)==[x-1,x,x+1]);%xֵλ�õ��ж�
    [a2,~,~]=find(total(:,2)==[y-1,y,y+1]);%yֵλ�õ��ж�
    a3 = a1(ismember(a1,a2));%ȡ����ͬ����
%     if ~isempty(a1)
%         total2= total(a1,:);
%         [a2,~,~]=find(total2(:,2)==[y-1,y,y+1]);%yֵλ�õ��ж�
%         if ~isempty(a2)
%             total3= total(a2,:);
%         else
%             total3 = [];
%         end
%     end
    [m,n]=size(a3);
    if  m==2%�������2���㣨��ʼ�㣩����ȡ˳ʱ�뷽�򣬿��ϵ㣨yֵ��ĵ㣩
        %�г���x,y����Χ8�����꣬�Ӷ����ȡ��˳��˳ʱ�롿����x,y+1��->(x-1,y+1)
        judgeArray = getJudgeArray(x,y);
        sameRow = ismember(judgeArray,total(a3,:),'rows');%Ԫ����ͬ����
        finalArray = judgeArray(find(sameRow),:);
%         [~,q,~] = find(a3 == max(total(a3,:));
        newPoint = finalArray(1,:);
        r = find(ismember(total,newPoint,'rows'))
        total(r(1),:) = [];
    else%m=1
        newPoint = total(a3,:);
        total(a3,:) = [];
    end
    %%%���ڲ����ڵ�������
    if isempty(a3)
        %Ѱ�Ҿ���õ������һ���㣨����x���y�����ٵ�һ���㣩
        total2 = [];
        total2(:,1) = abs(total(:,1)-x);
        total2(:,2) = abs(total(:,2)-y);
        distance = abs(total(:,1)-x).^2+abs(total(:,2)-y).^2;
        weizhi = find(distance == min(distance));%�ҵ�������̵�λ��
        if length(weizhi)>1
            array = total(weizhi,:);%�ҵ����볬����3*3���񡿵����ص�
            weizhi2 = weizhi(2);
        else
            weizhi2 = weizhi(1);
        end
        newPoint = total(weizhi2,:);
        total(weizhi2,:) = [];
        %��ȡy������ȡ
%         break;
%         newPoint = [newY,newY];
    end
    i=i+1;
    %�ж�[14,-48]��ʱ��ʧ
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
%plot(t,yy5,'k','linewidth',3);  % ����ƽ������ͼ
grid on;
hold on;
plot(newpointLine(:,1),newpointLine(:,2),'b-')
% 
% 
% 
% a = [3,0];%������1��x,y����
% b = [0,4];%������2��x,y����
% dist(a,b)

% a = [1,2];%������1��x,y����
% b = [4,6];%������2��x,y����
% 
% dist(a,b)
% d = norm(a-b);
% plot(a,b,'.-');

% %���طŴ���
% data2=imresize(data,4);        %�Ŵ�2��
% figure;
% imshow(data2);
% getCoordinate(data2);%��ȡ���꺯��
% %�ֶδ���
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
% %%%%%%%%%%%%%%%��uint.mat����%%%%%%%%%%%%%
% % gdata =
% % 
% %   9��9 uint8 ����
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
% % %��һ����Χ��ɸѡ����
% % for(colX=1:1024 )   
% %     for(rowY=1:768)       
% %         if(colX>374 & colX<481 &rowY>146 &rowY<246)          
% %         [colX,rowY]  %�������         
% %         end
% %     end
% % end

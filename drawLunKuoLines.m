function  newpointLine = drawLunKuoLines(str)
%UNTITLED17 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

%imshow(data);


% str='�շ�-���-����.jpg';

data = imread(str);
% data2 = data
[X,Y]=getCoordinate(data);%��ȡ���꺯��
total =[X,-Y];
% figure;
% plot(X,-Y,'.');
%�洢���ص��˳�򷽷�
total(1,:)%��ɾ��һ��
len = length(total);
total = sortrows(total,2);
total = sortrows(total,1);
Total = total;
newPoint = total(1,:);
total(1,:) = [];
disp(str);
disp('��ʼ������Ϊ��');
disp(newPoint);
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

    [m,n]=size(a3);
    if  m==2%�������2���㣨��ʼ�㣩����ȡ˳ʱ�뷽�򣬿��ϵ㣨yֵ��ĵ㣩
        %�г���x,y����Χ8�����꣬�Ӷ����ȡ��˳��˳ʱ�롿����x,y+1��->(x-1,y+1)
        judgeArray = getJudgeArray(x,y);
        sameRow = ismember(judgeArray,total(a3,:),'rows');%Ԫ����ͬ����
        finalArray = judgeArray(find(sameRow),:);
%         [~,q,~] = find(a3 == max(total(a3,:));
        newPoint = finalArray(1,:);
        r = find(ismember(total,newPoint,'rows'));
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
            array = total(weizhi,:)%�����3*3�����ж��Ҵ��ڶ�㡿��λ������
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
%plot(t,yy5,'k','linewidth',3);  % ����ƽ������ͼ
grid on;
hold on;
plot(newpointLine(:,1),newpointLine(:,2),'b-')

title([str,'    �����߻���ͼ']);
xlabel('x');
xlabel('y');
% legend('���벨��','ƽ������');
end


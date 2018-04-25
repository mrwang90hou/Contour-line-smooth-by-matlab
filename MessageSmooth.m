%%%%%%%%%%%%matlab �ź�ƽ����������%%%%%%%%%%%%%
%https://blog.csdn.net/han____shuai/article/details/50727040
%--------------------------------------------------------------------------
%              ����smooth�������м������ݵ�ƽ������
%--------------------------------------------------------------------------

%��������
data
figure;  % �½�һ��ͼ�δ���
plot(x,y);  % ���Ƽ��벨��ͼ
xlabel('x');  % ΪX��ӱ�ǩ
ylabel('y');  % ΪY��ӱ�ǩ
yy1 = smooth(y,30);  % �����ƶ�ƽ������y����ƽ������
figure;  % �½�һ��ͼ�δ���
plot(x,y,'b*-');  % ���Ƽ��벨��ͼ
hold on;
%figure;  % �½�һ��ͼ�δ���
plot(x,yy1,'r','linewidth',3);  % ����ƽ������ͼ
xlabel('t');  % ΪX��ӱ�ǩ
ylabel('moving');  % ΪY��ӱ�ǩ
legend('�����߲���','ƽ������');
title('�ƶ�ƽ�����Լ����źŽ���ƽ������������ƽ������ͼ');



%*****************�����������Ҳ��źţ����Ƽ��벨��ͼ*************************
t = linspace(0,2*pi,500)';  % ����һ����0��2*pi������������Ϊ500
y = 100*sin(t);  % �������Ҳ��ź�
% ����500��1�еķ���N(0,152)�ֲ������������Ϊ�����ź�
noise = normrnd(0,15,500,1);
y = y + noise;  % �����Ҳ��źż��������ź�
figure;  % �½�һ��ͼ�δ���
plot(t,y);  % ���Ƽ��벨��ͼ
xlabel('t');  % ΪX��ӱ�ǩ
ylabel('y = sin(t) + ����');  % ΪY��ӱ�ǩ
%*************�����ƶ�ƽ�����Լ����źŽ���ƽ������������ƽ������ͼ*************
yy1 = smooth(y,30);  % �����ƶ�ƽ������y����ƽ������
figure;  % �½�һ��ͼ�δ���
plot(t,y,'k:');  % ���Ƽ��벨��ͼ
hold on;
%figure;  % �½�һ��ͼ�δ���
plot(t,yy1,'k','linewidth',3);  % ����ƽ������ͼ
xlabel('t');  % ΪX��ӱ�ǩ
ylabel('moving');  % ΪY��ӱ�ǩ
legend('���벨��','ƽ������');


%*************����lowess�����Լ����źŽ���ƽ������������ƽ������ͼ*************
yy2 = smooth(y,30,'lowess');  % ����lowess������y����ƽ������
figure;  % �½�һ��ͼ�δ���
plot(t,y,'k:');  % ���Ƽ��벨��ͼ
hold on;
figure;  % �½�һ��ͼ�δ���
plot(t,yy2,'k','linewidth',3);  % ����ƽ������ͼ
xlabel('t');  % ΪX��ӱ�ǩ
ylabel('lowess');  % ΪY��ӱ�ǩ
legend('���벨��','ƽ������');


%*************����rlowess�����Լ����źŽ���ƽ������������ƽ������ͼ************
yy3 = smooth(y,30,'rlowess');  % ����rlowess������y����ƽ������
figure;  % �½�һ��ͼ�δ���
plot(t,y,'k:');  % ���Ƽ��벨��ͼ
hold on;
figure;  % �½�һ��ͼ�δ���
plot(t,yy3,'k','linewidth',3);  % ����ƽ������ͼ
xlabel('t');  % ΪX��ӱ�ǩ
ylabel('rlowess');  % ΪY��ӱ�ǩ
legend('���벨��','ƽ������');


%*************����loess�����Լ����źŽ���ƽ������������ƽ������ͼ*************
yy4 = smooth(y,30,'loess');  % ����loess������y����ƽ������
figure;  % �½�һ��ͼ�δ���
plot(t,y,'k:');  % ���Ƽ��벨��ͼ
hold on;
figure;  % �½�һ��ͼ�δ���
plot(t,yy4,'k','linewidth',3);  % ����ƽ������ͼ
xlabel('t');  % ΪX��ӱ�ǩ
ylabel('loess');  % ΪY��ӱ�ǩ
legend('���벨��','ƽ������');


%*************����sgolay�����Լ����źŽ���ƽ������������ƽ������ͼ*************
yy5 = smooth(y,30,'sgolay',3);  % ����sgolay������y����ƽ������
figure;  % �½�һ��ͼ�δ���
figure;  % �½�һ��ͼ�δ���
plot(t,y,'k:');  % ���Ƽ��벨��ͼ
hold on;
figure;  % �½�һ��ͼ�δ���
plot(t,yy5,'k','linewidth',3);  % ����ƽ������ͼ
xlabel('t');  % ΪX��ӱ�ǩ
ylabel('sgolay');  % ΪY��ӱ�ǩ
legend('���벨��','ƽ������');
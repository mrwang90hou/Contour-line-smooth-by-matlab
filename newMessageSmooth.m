%%%%%%%%%%%%matlab �ź�ƽ��������%%%%%%%%%%%%%
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
yy1 = smooth(y,72);  % �����ƶ�ƽ������y����ƽ������
figure;  % �½�һ��ͼ�δ���
plot(x,y,'b:.');  % ���Ƽ��벨��ͼ
hold on;
%figure;  % �½�һ��ͼ�δ���
plot(x,yy1,'r','linewidth',1);  % ����ƽ������ͼ
xlabel('x');  % ΪX��ӱ�ǩ
ylabel('moving');  % ΪY��ӱ�ǩ
legend('�����߲���','ƽ������');
title('�ƶ�ƽ�����Լ����źŽ���ƽ����������ƽ������ͼ');

%*************����lowess�����Լ����źŽ���ƽ����������ƽ������ͼ*************
yy2 = smooth(y,72,'lowess');  % ����lowess������y����ƽ������
figure;  % �½�һ��ͼ�δ���
plot(x,y,'b:.');  % ���Ƽ��벨��ͼ
hold on;
plot(x,yy2,'r','linewidth',1);  % ����ƽ������ͼ
xlabel('x');  % ΪX��ӱ�ǩ
ylabel('lowess');  % ΪY��ӱ�ǩ
legend('���벨��','ƽ������');
title('lowess������y����ƽ������');
%*************����rlowess�����Լ����źŽ���ƽ����������ƽ������ͼ************
yy3 = smooth(y,72,'rlowess');  % ����rlowess������y����ƽ������
figure;  % �½�һ��ͼ�δ���
plot(x,y,'b:.');  % ���Ƽ��벨��ͼ
hold on;
plot(x,yy3,'r','linewidth',1);  % ����ƽ������ͼ
xlabel('x');  % ΪX��ӱ�ǩ
ylabel('rlowess');  % ΪY��ӱ�ǩ
legend('���벨��','ƽ������');
title('rlowess����ƽ������');
%*************����loess�����Լ����źŽ���ƽ����������ƽ������ͼ*************
yy4 = smooth(y,72,'loess');  % ����loess������y����ƽ������
figure;  % �½�һ��ͼ�δ���
plot(x,y,'b:.');  % ���Ƽ��벨��ͼ
hold on;
plot(x,yy4,'r','linewidth',1);  % ����ƽ������ͼ
xlabel('x');  % ΪX��ӱ�ǩ
ylabel('loess');  % ΪY��ӱ�ǩ
legend('���벨��','ƽ������');
title('loess����ƽ������');

%*************����sgolay�����Լ����źŽ���ƽ����������ƽ������ͼ*************
yy5 = smooth(y,72,'sgolay',1);  % ����sgolay������y����ƽ������
figure;  % �½�һ��ͼ�δ���
plot(x,y,'b:.');  % ���Ƽ��벨��ͼ
hold on;
plot(x,yy5,'r','linewidth',1);  % ����ƽ������ͼ
xlabel('x');  % ΪX��ӱ�ǩ
ylabel('sgolay');  % ΪY��ӱ�ǩ
legend('���벨��','ƽ������');
title('sgolay����ƽ������');

yy6 = medfilt1(y,72); % ָ������Ϊ30����y������ֵ�˲�
figure; % �½�һ��ͼ�δ���>> plot(t,y,'k:'); % ���Ƽ��벨��ͼ
plot(x,y,'b:.');  % ���Ƽ��벨��ͼ
hold on % ����ƽ��������ͼ����ɫʵ�ߣ��߿�Ϊ3
plot(x,yy6,'r','LineWidth',1);
xlabel('t'); % ΪX��ӱ�ǩ
ylabel('��ֵ�˲�'); % ΪY��ӱ�ǩ
legend('���벨��','ƽ������');
% 
% xx = medfilt1(cc);
% yy = medfilt1(cc,20);
% plot(cc);hold on;plot(xx);hold on;plot(yy);
% legend('��������','Ĭ����ֵ�˲�','20����ֵ�˲�')
% �˲�����n��������20����
% Example: If n = 11, then y(k) is the median of x(k-5:k+5).
% Example: If n = 12, then y(k) is the median of x(k-6:k+5).
% figure;plot(ff);hold on;plot(yy);
% legend('�ƶ�ƽ���˲�','��ֵ�˲�');
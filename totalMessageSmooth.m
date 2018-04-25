%%%%%%%%%%%%matlab �ź�ƽ��������%%%%%%%%%%%%%
%https://blog.csdn.net/han____shuai/article/details/50727040
%--------------------------------------------------------------------------
%              ����smooth�������м������ݵ�ƽ������
%--------------------------------------------------------------------------
%           'moving'   - Moving average (default)       %�ƶ�ƽ��
%           'lowess'   - Lowess (linear fit)            %��˹��������ϣ�
%           'loess'    - Loess (quadratic fit)          %��˹��������ϣ�
%           'sgolay'   - Savitzky-Golay                 %Savitzky����
%           'rlowess'  - Robust Lowess (linear fit)     %��׳����˹
%           'rloess'   - Robust Loess (quadratic fit)   %��׳����˹
%��������
data
figure;  % �½�һ��ͼ�δ���
plot(x,y);  % ���Ƽ��벨��ͼ
xlabel('x');  % ΪX��ӱ�ǩ
ylabel('y');  % ΪY��ӱ�ǩ
figure;  % �½�һ��ͼ�δ���
plot(x,y,'b:.');  % ���Ƽ��벨��ͼ
yy1 = smooth(y,36);  % �����ƶ�ƽ������y����ƽ������
yy2 = smooth(y,36,'lowess');  % ����lowess������y����ƽ������    ����˹��������ϣ���
yy3 = smooth(y,36,'rlowess');  % ����rlowess������y����ƽ������
yy4 = smooth(y,36,'loess');  % ����loess������y����ƽ������       (��˹��������ϣ�)
yy5 = smooth(y,36,'sgolay',1);  % ����sgolay������y����ƽ������   (Savitzky����)
yy6 = medfilt1(y,36); % ָ������Ϊ30����y������ֵ�˲�
hold on;
plot(x,yy1,'r','linewidth',2);  % ����ƽ������ͼ
hold on;
plot(x,yy2,'g','linewidth',2);  % ����ƽ������ͼ
hold on;
plot(x,yy3,'k','linewidth',2);  % ����ƽ������ͼ
hold on;
plot(x,yy4,'c','linewidth',2);  % ����ƽ������ͼ
hold on;
plot(x,yy5,'m','linewidth',2);  % ����ƽ������ͼ
hold on;
plot(x,yy6,'y','linewidth',2);  % ����ƽ������ͼ
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
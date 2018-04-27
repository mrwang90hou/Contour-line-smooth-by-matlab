%%����ƽ���ķ���dataSmooth.m

clc,clear;
load('newPointLines(XY)Number-rifeng.mat')
lines = newpointLine11(1:88,:);
figure;
plot(lines(:,1),lines(:,2),'b.');
hold on;
plot(lines(:,1),lines(:,2),'r-');
x=lines(:,1);
y=lines(:,2);
A=polyfit(x,y,3); %n�Ǹ����Ķ���ʽ�Ĵ�������ϳ����Ľ��A��ϵ������
y1=polyval(A,x); %�������ϵ�yֵ
plot(x,y,'k*',x,y1,'r-'); %�������ݶԱ�ͼ���ڵ���ԭʼ���ݣ��������������
%ָ���������
% f=fittype('a*e^(b*x)+c'); %�����������ĺ���ģ�ͣ�Ĭ������xΪ�Ա���������Ϊ��������
% fity=fit(x,y,f) %������ϣ��������Ͻ��

% ����һ�����ӷ���
% �ú��ӷ�ƽ�����ݣ�����Ϊ30
output1 = smoothts(price,'b',30);
% �ú��ӷ�ƽ�����ݣ�����Ϊ100
output2 = smoothts(price,'b',100);
figure; % �½�һ��ͼ�δ���
plot(price,'.'); % ���������̼�ɢ��ͼ
hold on
% ����ƽ��������ͼ����ɫʵ�ߣ��߿�Ϊ2
plot(output1,'k','LineWidth',2);
% ����ƽ��������ͼ����ɫ�㻮�ߣ��߿�Ϊ2
plot(output2,'k-.','LineWidth',2);
% ΪX���Y��ӱ�ǩ
xlabel('�۲����'); ylabel('Box method');
% Ϊͼ�μӱ�ע��
legend('ԭʼɢ��','ƽ������(����30)','ƽ������(����100)','location','northwest');
%%���������ø�˹������ƽ�����ݣ�
output3 = smoothts(price,'g',30); % ����Ϊ30����׼��ΪĬ��ֵ0.65
output4 = smoothts(price,'g',100,100); % ����Ϊ100����׼��Ϊ100
figure; % �½�һ��ͼ�δ���
plot(price,'.'); % ���������̼�ɢ��ͼ
hold on % ����ƽ��������ͼ����ɫʵ�ߣ��߿�Ϊ2
plot(output3,'k','LineWidth',2); % ����ƽ��������ͼ����ɫ�㻮�ߣ��߿�Ϊ2
plot(output4,'k-.','LineWidth',2); % ΪX���Y��ӱ�ǩ>> xlabel('�۲����'); ylabel('Gaussian window method');
legend('ԭʼɢ��','ƽ������(����30����׼��0.65)',... 'ƽ������(����100����׼��100)','location','northwest');
%%����������ָ����ƽ������
output5 = smoothts(price,'e',30z); % ��ָ����ƽ�����ݣ�����Ϊ30
output6 = smoothts(price:'e',100); % ��ָ����ƽ�����ݣ�����Ϊ100 >> figure; % �½�һ��ͼ�δ���
plot(price,'.'); % ���������̼�ɢ��ͼ
hold on % ����ƽ��������ͼ����ɫʵ�ߣ��߿�Ϊ2
plot(output5,'k','LineWidth',2); % ����ƽ��������ͼ����ɫ�㻮�ߣ��߿�Ϊ2
plot(output6,'k-.','LineWidth',2); % ΪX���Y��ӱ�ǩ>> xlabel('�۲����'); ylabel('Exponential method');
legend('ԭʼɢ��','ƽ������(����30)','ƽ������(����100)','location','northwest');



% ����medfilt1������һά��ֵ�˲���
% ���ø�ʽ��
% y = medfilt1(x,n)
% y = medfilt1(x,n,blksz)
% y = medfilt1(x,n,blksz,dim)
% 
% ����7.1-3������һ�����Ҳ��źţ����������źţ�Ȼ�����medfilt1�����Լ������������Ҳ������˲���ƽ������
% ����һ����0��2*pi������������Ϊ500
t = linspace(0,2*pi,500)';
y = 100*sin(t); % �������Ҳ��ź�
% ����500��1�еķ���N(0,152)�ֲ������������Ϊ�����ź�
noise = normrnd(0,15,500,1);
y = y + noise; % �����Ҳ��źż��������ź�
figure; % �½�һ��ͼ�δ���
plot(t,y); % ���Ƽ��벨��ͼ
xlabel('t'); % ΪX��ӱ�ǩ
ylabel('y = sin(t) + ����'); % ΪY��ӱ�ǩ
%%��ֵ�˲���
% ����medfilt1�Լ������Ҳ��ź�y������ֵ�˲��������Ʋ���ͼ
yy = medfilt1(y,30); % ָ������Ϊ30����y������ֵ�˲�
figure; % �½�һ��ͼ�δ���>> plot(t,y,'k:'); % ���Ƽ��벨��ͼ
hold on % ����ƽ��������ͼ����ɫʵ�ߣ��߿�Ϊ3
plot(t,yy,'k','LineWidth',3);
xlabel('t'); % ΪX��ӱ�ǩ
ylabel('��ֵ�˲�'); % ΪY��ӱ�ǩ
legend('���벨��','ƽ������');


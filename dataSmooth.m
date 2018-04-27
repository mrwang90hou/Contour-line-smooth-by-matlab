%%数据平滑的方法dataSmooth.m

clc,clear;
load('newPointLines(XY)Number-rifeng.mat')
lines = newpointLine11(1:88,:);
figure;
plot(lines(:,1),lines(:,2),'b.');
hold on;
plot(lines(:,1),lines(:,2),'r-');
x=lines(:,1);
y=lines(:,2);
A=polyfit(x,y,3); %n是给定的多项式的次数，拟合出来的结果A是系数向量
y1=polyval(A,x); %计算出拟合的y值
plot(x,y,'k*',x,y1,'r-'); %画出数据对比图，黑点是原始数据，红线是拟合曲线
%指定函数拟合
% f=fittype('a*e^(b*x)+c'); %引号里的是你的函数模型，默认是以x为自变量，其余为待定参数
% fity=fit(x,y,f) %曲线拟合，会给出拟合结果

% 方法一：盒子法：
% 用盒子法平滑数据，窗宽为30
output1 = smoothts(price,'b',30);
% 用盒子法平滑数据，窗宽为100
output2 = smoothts(price,'b',100);
figure; % 新建一个图形窗口
plot(price,'.'); % 绘制日收盘价散点图
hold on
% 绘制平滑后曲线图，黑色实线，线宽为2
plot(output1,'k','LineWidth',2);
% 绘制平滑后曲线图，黑色点划线，线宽为2
plot(output2,'k-.','LineWidth',2);
% 为X轴和Y轴加标签
xlabel('观测序号'); ylabel('Box method');
% 为图形加标注框
legend('原始散点','平滑曲线(窗宽30)','平滑曲线(窗宽100)','location','northwest');
%%方法二：用高斯窗方法平滑数据：
output3 = smoothts(price,'g',30); % 窗宽为30，标准差为默认值0.65
output4 = smoothts(price,'g',100,100); % 窗宽为100，标准差为100
figure; % 新建一个图形窗口
plot(price,'.'); % 绘制日收盘价散点图
hold on % 绘制平滑后曲线图，黑色实线，线宽为2
plot(output3,'k','LineWidth',2); % 绘制平滑后曲线图，黑色点划线，线宽为2
plot(output4,'k-.','LineWidth',2); % 为X轴和Y轴加标签>> xlabel('观测序号'); ylabel('Gaussian window method');
legend('原始散点','平滑曲线(窗宽30，标准差0.65)',... '平滑曲线(窗宽100，标准差100)','location','northwest');
%%方法三：用指数法平滑数据
output5 = smoothts(price,'e',30z); % 用指数法平滑数据，窗宽为30
output6 = smoothts(price:'e',100); % 用指数法平滑数据，窗宽为100 >> figure; % 新建一个图形窗口
plot(price,'.'); % 绘制日收盘价散点图
hold on % 绘制平滑后曲线图，黑色实线，线宽为2
plot(output5,'k','LineWidth',2); % 绘制平滑后曲线图，黑色点划线，线宽为2
plot(output6,'k-.','LineWidth',2); % 为X轴和Y轴加标签>> xlabel('观测序号'); ylabel('Exponential method');
legend('原始散点','平滑曲线(窗宽30)','平滑曲线(窗宽100)','location','northwest');



% 三、medfilt1函数（一维中值滤波）
% 调用格式：
% y = medfilt1(x,n)
% y = medfilt1(x,n,blksz)
% y = medfilt1(x,n,blksz,dim)
% 
% 【例7.1-3】产生一列正弦波信号，加入噪声信号，然后调用medfilt1函数对加入噪声的正弦波进行滤波（平滑处理）
% 产生一个从0到2*pi的向量，长度为500
t = linspace(0,2*pi,500)';
y = 100*sin(t); % 产生正弦波信号
% 产生500行1列的服从N(0,152)分布的随机数，作为噪声信号
noise = normrnd(0,15,500,1);
y = y + noise; % 将正弦波信号加入噪声信号
figure; % 新建一个图形窗口
plot(t,y); % 绘制加噪波形图
xlabel('t'); % 为X轴加标签
ylabel('y = sin(t) + 噪声'); % 为Y轴加标签
%%中值滤波：
% 调用medfilt1对加噪正弦波信号y进行中值滤波，并绘制波形图
yy = medfilt1(y,30); % 指定窗宽为30，对y进行中值滤波
figure; % 新建一个图形窗口>> plot(t,y,'k:'); % 绘制加噪波形图
hold on % 绘制平滑后曲线图，黑色实线，线宽为3
plot(t,yy,'k','LineWidth',3);
xlabel('t'); % 为X轴加标签
ylabel('中值滤波'); % 为Y轴加标签
legend('加噪波形','平滑后波形');


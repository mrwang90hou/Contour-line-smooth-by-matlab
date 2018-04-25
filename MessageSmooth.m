%%%%%%%%%%%%matlab 信号平滑处理方法%%%%%%%%%%%%%
%https://blog.csdn.net/han____shuai/article/details/50727040
%--------------------------------------------------------------------------
%              调用smooth函数进行加噪数据的平滑处理
%--------------------------------------------------------------------------

%加载数据
data
figure;  % 新建一个图形窗口
plot(x,y);  % 绘制加噪波形图
xlabel('x');  % 为X轴加标签
ylabel('y');  % 为Y轴加标签
yy1 = smooth(y,30);  % 利用移动平均法对y进行平滑处理
figure;  % 新建一个图形窗口
plot(x,y,'b*-');  % 绘制加噪波形图
hold on;
%figure;  % 新建一个图形窗口
plot(x,yy1,'r','linewidth',3);  % 绘制平滑后波形图
xlabel('t');  % 为X轴加标签
ylabel('moving');  % 为Y轴加标签
legend('轮廓线波形','平滑后波形');
title('移动平均法对加噪信号进行平滑处理，绘制平滑波形图');



%*****************产生加噪正弦波信号，绘制加噪波形图*************************
t = linspace(0,2*pi,500)';  % 产生一个从0到2*pi的向量，长度为500
y = 100*sin(t);  % 产生正弦波信号
% 产生500行1列的服从N(0,152)分布的随机数，作为噪声信号
noise = normrnd(0,15,500,1);
y = y + noise;  % 将正弦波信号加入噪声信号
figure;  % 新建一个图形窗口
plot(t,y);  % 绘制加噪波形图
xlabel('t');  % 为X轴加标签
ylabel('y = sin(t) + 噪声');  % 为Y轴加标签
%*************利用移动平均法对加噪信号进行平滑处理，绘制平滑波形图*************
yy1 = smooth(y,30);  % 利用移动平均法对y进行平滑处理
figure;  % 新建一个图形窗口
plot(t,y,'k:');  % 绘制加噪波形图
hold on;
%figure;  % 新建一个图形窗口
plot(t,yy1,'k','linewidth',3);  % 绘制平滑后波形图
xlabel('t');  % 为X轴加标签
ylabel('moving');  % 为Y轴加标签
legend('加噪波形','平滑后波形');


%*************利用lowess方法对加噪信号进行平滑处理，绘制平滑波形图*************
yy2 = smooth(y,30,'lowess');  % 利用lowess方法对y进行平滑处理
figure;  % 新建一个图形窗口
plot(t,y,'k:');  % 绘制加噪波形图
hold on;
figure;  % 新建一个图形窗口
plot(t,yy2,'k','linewidth',3);  % 绘制平滑后波形图
xlabel('t');  % 为X轴加标签
ylabel('lowess');  % 为Y轴加标签
legend('加噪波形','平滑后波形');


%*************利用rlowess方法对加噪信号进行平滑处理，绘制平滑波形图************
yy3 = smooth(y,30,'rlowess');  % 利用rlowess方法对y进行平滑处理
figure;  % 新建一个图形窗口
plot(t,y,'k:');  % 绘制加噪波形图
hold on;
figure;  % 新建一个图形窗口
plot(t,yy3,'k','linewidth',3);  % 绘制平滑后波形图
xlabel('t');  % 为X轴加标签
ylabel('rlowess');  % 为Y轴加标签
legend('加噪波形','平滑后波形');


%*************利用loess方法对加噪信号进行平滑处理，绘制平滑波形图*************
yy4 = smooth(y,30,'loess');  % 利用loess方法对y进行平滑处理
figure;  % 新建一个图形窗口
plot(t,y,'k:');  % 绘制加噪波形图
hold on;
figure;  % 新建一个图形窗口
plot(t,yy4,'k','linewidth',3);  % 绘制平滑后波形图
xlabel('t');  % 为X轴加标签
ylabel('loess');  % 为Y轴加标签
legend('加噪波形','平滑后波形');


%*************利用sgolay方法对加噪信号进行平滑处理，绘制平滑波形图*************
yy5 = smooth(y,30,'sgolay',3);  % 利用sgolay方法对y进行平滑处理
figure;  % 新建一个图形窗口
figure;  % 新建一个图形窗口
plot(t,y,'k:');  % 绘制加噪波形图
hold on;
figure;  % 新建一个图形窗口
plot(t,yy5,'k','linewidth',3);  % 绘制平滑后波形图
xlabel('t');  % 为X轴加标签
ylabel('sgolay');  % 为Y轴加标签
legend('加噪波形','平滑后波形');
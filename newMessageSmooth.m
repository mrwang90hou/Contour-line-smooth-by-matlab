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
yy1 = smooth(y,72);  % 利用移动平均法对y进行平滑处理
figure;  % 新建一个图形窗口
plot(x,y,'b:.');  % 绘制加噪波形图
hold on;
%figure;  % 新建一个图形窗口
plot(x,yy1,'r','linewidth',1);  % 绘制平滑后波形图
xlabel('x');  % 为X轴加标签
ylabel('moving');  % 为Y轴加标签
legend('轮廓线波形','平滑后波形');
title('移动平均法对加噪信号进行平滑处理，绘制平滑波形图');

%*************利用lowess方法对加噪信号进行平滑处理，绘制平滑波形图*************
yy2 = smooth(y,72,'lowess');  % 利用lowess方法对y进行平滑处理
figure;  % 新建一个图形窗口
plot(x,y,'b:.');  % 绘制加噪波形图
hold on;
plot(x,yy2,'r','linewidth',1);  % 绘制平滑后波形图
xlabel('x');  % 为X轴加标签
ylabel('lowess');  % 为Y轴加标签
legend('加噪波形','平滑后波形');
title('lowess方法对y进行平滑处理');
%*************利用rlowess方法对加噪信号进行平滑处理，绘制平滑波形图************
yy3 = smooth(y,72,'rlowess');  % 利用rlowess方法对y进行平滑处理
figure;  % 新建一个图形窗口
plot(x,y,'b:.');  % 绘制加噪波形图
hold on;
plot(x,yy3,'r','linewidth',1);  % 绘制平滑后波形图
xlabel('x');  % 为X轴加标签
ylabel('rlowess');  % 为Y轴加标签
legend('加噪波形','平滑后波形');
title('rlowess方法平滑处理');
%*************利用loess方法对加噪信号进行平滑处理，绘制平滑波形图*************
yy4 = smooth(y,72,'loess');  % 利用loess方法对y进行平滑处理
figure;  % 新建一个图形窗口
plot(x,y,'b:.');  % 绘制加噪波形图
hold on;
plot(x,yy4,'r','linewidth',1);  % 绘制平滑后波形图
xlabel('x');  % 为X轴加标签
ylabel('loess');  % 为Y轴加标签
legend('加噪波形','平滑后波形');
title('loess方法平滑处理');

%*************利用sgolay方法对加噪信号进行平滑处理，绘制平滑波形图*************
yy5 = smooth(y,72,'sgolay',1);  % 利用sgolay方法对y进行平滑处理
figure;  % 新建一个图形窗口
plot(x,y,'b:.');  % 绘制加噪波形图
hold on;
plot(x,yy5,'r','linewidth',1);  % 绘制平滑后波形图
xlabel('x');  % 为X轴加标签
ylabel('sgolay');  % 为Y轴加标签
legend('加噪波形','平滑后波形');
title('sgolay方法平滑处理');

yy6 = medfilt1(y,72); % 指定窗宽为30，对y进行中值滤波
figure; % 新建一个图形窗口>> plot(t,y,'k:'); % 绘制加噪波形图
plot(x,y,'b:.');  % 绘制加噪波形图
hold on % 绘制平滑后曲线图，黑色实线，线宽为3
plot(x,yy6,'r','LineWidth',1);
xlabel('t'); % 为X轴加标签
ylabel('中值滤波'); % 为Y轴加标签
legend('加噪波形','平滑后波形');
% 
% xx = medfilt1(cc);
% yy = medfilt1(cc,20);
% plot(cc);hold on;plot(xx);hold on;plot(yy);
% legend('噪声数据','默认中值滤波','20阶中值滤波')
% 滤波秩序（n，这里是20）：
% Example: If n = 11, then y(k) is the median of x(k-5:k+5).
% Example: If n = 12, then y(k) is the median of x(k-6:k+5).
% figure;plot(ff);hold on;plot(yy);
% legend('移动平均滤波','中值滤波');
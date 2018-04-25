%%%%%%%%%%%%matlab 信号平滑处理方法%%%%%%%%%%%%%
%https://blog.csdn.net/han____shuai/article/details/50727040
%--------------------------------------------------------------------------
%              调用smooth函数进行加噪数据的平滑处理
%--------------------------------------------------------------------------
%           'moving'   - Moving average (default)       %移动平均
%           'lowess'   - Lowess (linear fit)            %洛斯（线性拟合）
%           'loess'    - Loess (quadratic fit)          %勒斯（二次拟合）
%           'sgolay'   - Savitzky-Golay                 %Savitzky戈利
%           'rlowess'  - Robust Lowess (linear fit)     %健壮的洛斯
%           'rloess'   - Robust Loess (quadratic fit)   %健壮的勒斯
%加载数据
data
figure;  % 新建一个图形窗口
plot(x,y);  % 绘制加噪波形图
xlabel('x');  % 为X轴加标签
ylabel('y');  % 为Y轴加标签
figure;  % 新建一个图形窗口
plot(x,y,'b:.');  % 绘制加噪波形图
yy1 = smooth(y,36);  % 利用移动平均法对y进行平滑处理
yy2 = smooth(y,36,'lowess');  % 利用lowess方法对y进行平滑处理    （洛斯（线性拟合））
yy3 = smooth(y,36,'rlowess');  % 利用rlowess方法对y进行平滑处理
yy4 = smooth(y,36,'loess');  % 利用loess方法对y进行平滑处理       (勒斯（二次拟合）)
yy5 = smooth(y,36,'sgolay',1);  % 利用sgolay方法对y进行平滑处理   (Savitzky戈利)
yy6 = medfilt1(y,36); % 指定窗宽为30，对y进行中值滤波
hold on;
plot(x,yy1,'r','linewidth',2);  % 绘制平滑后波形图
hold on;
plot(x,yy2,'g','linewidth',2);  % 绘制平滑后波形图
hold on;
plot(x,yy3,'k','linewidth',2);  % 绘制平滑后波形图
hold on;
plot(x,yy4,'c','linewidth',2);  % 绘制平滑后波形图
hold on;
plot(x,yy5,'m','linewidth',2);  % 绘制平滑后波形图
hold on;
plot(x,yy6,'y','linewidth',2);  % 绘制平滑后波形图
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
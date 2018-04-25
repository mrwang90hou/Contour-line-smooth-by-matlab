%matlab图像处理程序大集合
%1.图像反转
%MATLAB程序实现如下：
I=imread('日丰-锯齿.jpg');
J=double(I);
J=-J+(256-1);                 %图像反转线性变换
H=uint8(J);
subplot(1,2,1),imshow(I);
subplot(1,2,2),imshow(H);
%2.灰度线性变换
%MATLAB程序实现如下：
I=imread('日丰-锯齿.jpg');
subplot(2,2,1),imshow(I);
title('原始图像');
axis([50,250,50,200]);
axis on;                  %显示坐标系
I1=rgb2gray(I);
subplot(2,2,2),imshow(I1);
title('灰度图像');
axis([50,250,50,200]);
axis on;                  %显示坐标系
J=imadjust(I1,[0.1 0.5],[]); %局部拉伸，把[0.1 0.5]内的灰度拉伸为[0 1]
subplot(2,2,3),imshow(J);
title('线性变换图像[0.1 0.5]');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
K=imadjust(I1,[0.3 0.7],[]); %局部拉伸，把[0.3 0.7]内的灰度拉伸为[0 1]
subplot(2,2,4),imshow(K);
title('线性变换图像[0.3 0.7]');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系

%3.非线性变换
%MATLAB程序实现如下：
I=imread('日丰-锯齿.jpg');
I1=rgb2gray(I);
subplot(1,2,1),imshow(I1);
title('灰度图像');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
J=double(I1);
J=40*(log(J+1));
H=uint8(J);
subplot(1,2,2),imshow(H);
title('对数变换图像');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系

%4.直方图均衡化
%MATLAB程序实现如下：
I=imread('日丰-锯齿.jpg');
I=rgb2gray(I);
figure;
subplot(2,2,1);
imshow(I);
subplot(2,2,2);
imhist(I);
I1=histeq(I);
figure;
subplot(2,2,1);
imshow(I1);
subplot(2,2,2);
imhist(I1);

%5.线性平滑滤波器
%用MATLAB实现领域平均法抑制噪声程序：
I=imread('日丰-锯齿.jpg');
subplot(231)
imshow(I)
title('原始图像')
I=rgb2gray(I);
I1=imnoise(I,'salt & pepper',0.02);
subplot(232)
imshow(I1)
title('添加椒盐噪声的图像')
k1=filter2(fspecial('average',3),I1)/255;          %进行3*3模板平滑滤波
k2=filter2(fspecial('average',5),I1)/255;          %进行5*5模板平滑滤波
k3=filter2(fspecial('average',7),I1)/255;          %进行7*7模板平滑滤波
k4=filter2(fspecial('average',9),I1)/255;          %进行9*9模板平滑滤波
subplot(233),imshow(k1);title('3*3模板平滑滤波');
subplot(234),imshow(k2);title('5*5模板平滑滤波');
subplot(235),imshow(k3);title('7*7模板平滑滤波');
subplot(236),imshow(k4);title('9*9模板平滑滤波');

%6.中值滤波器
%用MATLAB实现中值滤波程序如下：
I=imread('/Users/wangning/Desktop/轮廓线平滑/日丰.jpg');
I=rgb2gray(I);
J=imnoise(I,'salt&pepper',0.02);
subplot(231),imshow(I);title('原图像');
subplot(232),imshow(J);title('添加椒盐噪声图像');
k1=medfilt2(J);            %进行3*3模板中值滤波
k2=medfilt2(J,[5,5]);      %进行5*5模板中值滤波
k3=medfilt2(J,[7,7]);      %进行7*7模板中值滤波
k4=medfilt2(J,[9,9]);      %进行9*9模板中值滤波
subplot(233),imshow(k1);title('3*3模板中值滤波');
subplot(234),imshow(k2);title('5*5模板中值滤波');
subplot(235),imshow(k3);title('7*7模板中值滤波');
subplot(236),imshow(k4);title('9*9模板中值滤波');

%7.用Sobel算子和拉普拉斯对图像锐化：
I=imread('xian.bmp');
subplot(2,2,1),imshow(I);
title('原始图像');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
I1=im2bw(I);
subplot(2,2,2),imshow(I1);
title('二值图像');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
H=fspecial('sobel');     %选择sobel算子 
J=filter2(H,I1);            %卷积运算
subplot(2,2,3),imshow(J);
title('sobel算子锐化图像');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
h=[0 1 0,1 -4 1,0 1 0];   %拉普拉斯算子
J1=conv2(I1,h,'same');            %卷积运算
subplot(2,2,4),imshow(J1);
title('拉普拉斯算子锐化图像');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系

%8.梯度算子检测边缘
%用MATLAB实现如下：
I=imread('xian.bmp');
subplot(2,3,1);
imshow(I);
title('原始图像');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
I1=im2bw(I);
subplot(2,3,2);
imshow(I1);
title('二值图像');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
I2=edge(I1,'roberts');
figure;
subplot(2,3,3);
imshow(I2);
title('roberts算子分割结果');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
I3=edge(I1,'sobel');
subplot(2,3,4);
imshow(I3);
title('sobel算子分割结果');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
I4=edge(I1,'Prewitt');
subplot(2,3,5);
imshow(I4);
title('Prewitt算子分割结果');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系

%9.LOG算子检测边缘
%用MATLAB程序实现如下：
I=imread('xian.bmp');
subplot(2,2,1);
imshow(I);
title('原始图像');
I1=rgb2gray(I);
subplot(2,2,2);
imshow(I1);
title('灰度图像');
I2=edge(I1,'log');
subplot(2,2,3);
imshow(I2);
title('log算子分割结果');

%10.Canny算子检测边缘
%用MATLAB程序实现如下：
I=imread('xian.bmp');
subplot(2,2,1);
imshow(I);
title('原始图像')
I1=rgb2gray(I);
subplot(2,2,2);
imshow(I1);
title('灰度图像');
I2=edge(I1,'canny');
subplot(2,2,3);
imshow(I2);
title('canny算子分割结果');

%11.边界跟踪（bwtraceboundary函数）
clc
clear all
I=imread('xian.bmp');
figure
imshow(I);
title('原始图像');
I1=rgb2gray(I);                %将彩色图像转化灰度图像 
threshold=graythresh(I1);        %计算将灰度图像转化为二值图像所需的门限
BW=im2bw(I1, threshold);       %将灰度图像转化为二值图像
figure
imshow(BW);
title('二值图像');
dim=size(BW);
col=round(dim(2)/2)-90;         %计算起始点列坐标
row=find(BW(:,col),1);          %计算起始点行坐标
connectivity=8;
num_points=180;
contour=bwtraceboundary(BW,[row,col],'N',connectivity,num_points);
%提取边界
figure
imshow(I1);
hold on;
plot(contour(:,2),contour(:,1), 'g','LineWidth' ,2);
title('边界跟踪图像');

%12.Hough变换
I= imread('xian.bmp');
rotI=rgb2gray(I);
subplot(2,2,1);
imshow(rotI);
title('灰度图像');
axis([50,250,50,200]);
grid on;                
axis on;
BW=edge(rotI,'prewitt');
subplot(2,2,2);
imshow(BW);
title('prewitt算子边缘检测后图像');
axis([50,250,50,200]);
grid on;                
axis on;
[H,T,R]=hough(BW);
subplot(2,2,3);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
title('霍夫变换图');
xlabel('\theta'),ylabel('\rho');
axis on , axis normal, hold on;
P=houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x=T(P(:,2));y=R(P(:,1));
plot(x,y,'s','color','white');
lines=houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
subplot(2,2,4);,imshow(rotI);
title('霍夫变换图像检测');
axis([50,250,50,200]);
grid on;                
axis on;
hold on;
max_len=0;
for k=1:length(lines)
xy=[lines(k).point1;lines(k).point2];
plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');
len=norm(lines(k).point1-lines(k).point2);
if(len>max_len)
max_len=len;
xy_long=xy;
end
end
plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');

%13.直方图阈值法
%用MATLAB实现直方图阈值法：
I=imread('xian.bmp');
I1=rgb2gray(I);
figure;
subplot(2,2,1);
imshow(I1);
title('灰度图像')
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
[m,n]=size(I1);                            %测量图像尺寸参数
GP=zeros(1,256);                           %预创建存放灰度出现概率的向量
for k=0:255
     GP(k+1)=length(find(I1==k))/(m*n);    %计算每级灰度出现的概率，将其存入GP中相应位置
end
subplot(2,2,2),bar(0:255,GP,'g')                   %绘制直方图
title('灰度直方图')
xlabel('灰度值')
ylabel('出现概率')
I2=im2bw(I,150/255);  
subplot(2,2,3),imshow(I2);
title('阈值150的分割图像')
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
I3=im2bw(I,200/255);   %
subplot(2,2,4),imshow(I3);
title('阈值200的分割图像')
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系

%4. 自动阈值法：Otsu法
%用MATLAB实现Otsu算法：
clc
clear all
I=imread('xian.bmp');
subplot(1,2,1),imshow(I);
title('原始图像')
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
level=graythresh(I);     %确定灰度阈值
BW=im2bw(I,level);
subplot(1,2,2),imshow(BW);
title('Otsu法阈值分割图像')
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系

%15.膨胀操作
I=imread('xian.bmp');          %载入图像
I1=rgb2gray(I);
subplot(1,2,1);
imshow(I1);
title('灰度图像')     
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
se=strel('disk',1);          %生成圆形结构元素
I2=imdilate(I1,se);             %用生成的结构元素对图像进行膨胀
subplot(1,2,2);
imshow(I2);
title('膨胀后图像');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系

%16.腐蚀操作
%MATLAB实现腐蚀操作
I=imread('xian.bmp');          %载入图像
I1=rgb2gray(I);
subplot(1,2,1);
imshow(I1);
title('灰度图像')     
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
se=strel('disk',1);       %生成圆形结构元素
I2=imerode(I1,se);        %用生成的结构元素对图像进行腐蚀
subplot(1,2,2);
imshow(I2);
title('腐蚀后图像');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系

%17.开启和闭合操作
%用MATLAB实现开启和闭合操作
I=imread('xian.bmp');          %载入图像
subplot(2,2,1),imshow(I);
title('原始图像');
axis([50,250,50,200]);
axis on;                  %显示坐标系 
I1=rgb2gray(I);
subplot(2,2,2),imshow(I1);
title('灰度图像');
axis([50,250,50,200]);
axis on;                  %显示坐标系                  
se=strel('disk',1);     %采用半径为1的圆作为结构元素
I2=imopen(I1,se);         %开启操作
I3=imclose(I1,se);        %闭合操作
subplot(2,2,3),imshow(I2);
title('开启运算后图像');
axis([50,250,50,200]);
axis on;                  %显示坐标系
subplot(2,2,4),imshow(I3);
title('闭合运算后图像');
axis([50,250,50,200]);
axis on;                  %显示坐标系

%18.开启和闭合组合操作
I=imread('xian.bmp');          %载入图像
subplot(3,2,1),imshow(I);
title('原始图像');
axis([50,250,50,200]);
axis on;                  %显示坐标系 
I1=rgb2gray(I);
subplot(3,2,2),imshow(I1);
title('灰度图像');
axis([50,250,50,200]);
axis on;                  %显示坐标系                  
se=strel('disk',1);    
I2=imopen(I1,se);         %开启操作
I3=imclose(I1,se);        %闭合操作
subplot(3,2,3),imshow(I2);
title('开启运算后图像');
axis([50,250,50,200]);
axis on;                  %显示坐标系
subplot(3,2,4),imshow(I3);
title('闭合运算后图像');
axis([50,250,50,200]);
axis on;                  %显示坐标系
se=strel('disk',1);
I4=imopen(I1,se);
I5=imclose(I4,se);
subplot(3,2,5),imshow(I5);        %开?闭运算图像
title('开?闭运算图像');
axis([50,250,50,200]);
axis on;                  %显示坐标系 
I6=imclose(I1,se);
I7=imopen(I6,se);
subplot(3,2,6),imshow(I7);        %闭?开运算图像 
title('闭?开运算图像');
axis([50,250,50,200]);
axis on;                  %显示坐标系   

%19.形态学边界提取
%利用MATLAB实现如下：
I=imread('xian.bmp');          %载入图像
subplot(1,3,1),imshow(I);
title('原始图像');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
I1=im2bw(I);
subplot(1,3,2),imshow(I1);
title('二值化图像');
axis([50,250,50,200]);
grid on;                  %显示网格线
axis on;                  %显示坐标系
I2=bwperim(I1);                 %获取区域的周长
subplot(1,3,3),imshow(I2);
title('边界周长的二值图像');
axis([50,250,50,200]);
grid on;
axis on;              

%20.形态学骨架提取
%利用MATLAB实现如下：
I=imread('xian.bmp');
subplot(2,2,1),imshow(I);
title('原始图像');
axis([50,250,50,200]);
axis on;                 
I1=im2bw(I);
subplot(2,2,2),imshow(I1);
title('二值图像');
axis([50,250,50,200]);
axis on;                
I2=bwmorph(I1,'skel',1);
subplot(2,2,3),imshow(I2);
title('1次骨架提取');
axis([50,250,50,200]);
axis on;                 
I3=bwmorph(I1,'skel',2);
subplot(2,2,4),imshow(I3);
title('2次骨架提取');
axis([50,250,50,200]);
axis on;               

%21.直接提取四个顶点坐标
I = imread('xian.bmp');
I = I(:,:,1);
BW=im2bw(I);
figure
imshow(~BW)
[x,y]=getpts


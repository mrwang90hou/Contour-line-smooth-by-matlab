clc
clear
data=imread('日丰-锯齿-左上.jpg');
gdata=rgb2gray(data);
BW1 = edge(gdata,'prewitt');
colormap(flipud(BW1));
figure;
%BW1 = abs(BW1-1);
imshow(BW1);
BW2 = edge(gdata,'canny');
% colormap(flipud(BW2));
figure;
%BW2 = abs(BW2-1)
imshow(BW2);
%匹配方法（相似度定义）
% 图像形态学处理     灰度形态学
% 基于图像骨架线的logo识别匹配技术
% 图像   直方图均衡化
% 像素的连通性匹配
clc,clear
data=imread('日丰.png');
figure;
imshow(data)
gdata=rgb2gray(data);
figure;
imshow(gdata)
clear all;
data=imread('/Users/wangning/Desktop/轮廓线平滑/日丰.jpg');
gdata=rgb2gray(data);
BW1 = edge(gdata,'prewitt');
imshow(BW1);
BW2 = edge(gdata,'canny');
figure;
imshow(BW2);
BW3 = edge(gdata,'sobel');
figure;
imshow(BW3);
mean3Sample = filter2(fspecial('average',3),data)/255;
mean5Sample = filter2(fspecial('average',5),data)/255;
mean7Sample = filter2(fspecial('average',7),data)/255;
gaussianSample = filter2(fspecial('gaussian'),data)/255;
%subplot(2,2,1);
figure;
imshow(data); %原始图像
%subplot(2,2,2);
figure;
imshow(mean7Sample); %采用均值进行平滑处理

newData = mean7Sample;
BW1 = edge(newData,'prewitt');
imshow(BW1);
BW2 = edge(newData,'canny');
figure;
imshow(BW2);
BW3 = edge(newData,'sobel');
figure;
imshow(BW3);
%subplot(2,2,3);
figure;
imshow(data); %原始图像
%subplot(2,2,4);
figure;
imshow(gaussianSample); %高斯滤波器进行平滑处理
%采用“原图*2-平滑图像”方法:
subSample = data.*2 - uint8(mean7Sample);
figure;
imshow(subSample);
%采用“原图+边缘处理图像”方法
addSample = data + uint8(prewittSample);
figure;
imshow(addSample);
% %采用’prewitt’算子:
% prewittSample = uint8(filter2(fspecial('prewitt'),data));
% imshow(prewittSample);
% %采用’ sobel’算子:
% figure;
% sobelSample = uint8(filter2(fspecial('sobel'),data));
% imshow(sobelSample);

clear all;
data=imread('/Users/wangning/Desktop/������ƽ��/�շ�.jpg');
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
imshow(data); %ԭʼͼ��
%subplot(2,2,2);
figure;
imshow(mean7Sample); %���þ�ֵ����ƽ������

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
imshow(data); %ԭʼͼ��
%subplot(2,2,4);
figure;
imshow(gaussianSample); %��˹�˲�������ƽ������
%���á�ԭͼ*2-ƽ��ͼ�񡱷���:
subSample = data.*2 - uint8(mean7Sample);
figure;
imshow(subSample);
%���á�ԭͼ+��Ե����ͼ�񡱷���
addSample = data + uint8(prewittSample);
figure;
imshow(addSample);
% %���á�prewitt������:
% prewittSample = uint8(filter2(fspecial('prewitt'),data));
% imshow(prewittSample);
% %���á� sobel������:
% figure;
% sobelSample = uint8(filter2(fspecial('sobel'),data));
% imshow(sobelSample);

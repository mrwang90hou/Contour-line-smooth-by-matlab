%matlabͼ�������󼯺�
%1.ͼ��ת
%MATLAB����ʵ�����£�
I=imread('�շ�-���.jpg');
J=double(I);
J=-J+(256-1);                 %ͼ��ת���Ա任
H=uint8(J);
subplot(1,2,1),imshow(I);
subplot(1,2,2),imshow(H);
%2.�Ҷ����Ա任
%MATLAB����ʵ�����£�
I=imread('�շ�-���.jpg');
subplot(2,2,1),imshow(I);
title('ԭʼͼ��');
axis([50,250,50,200]);
axis on;                  %��ʾ����ϵ
I1=rgb2gray(I);
subplot(2,2,2),imshow(I1);
title('�Ҷ�ͼ��');
axis([50,250,50,200]);
axis on;                  %��ʾ����ϵ
J=imadjust(I1,[0.1 0.5],[]); %�ֲ����죬��[0.1 0.5]�ڵĻҶ�����Ϊ[0 1]
subplot(2,2,3),imshow(J);
title('���Ա任ͼ��[0.1 0.5]');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
K=imadjust(I1,[0.3 0.7],[]); %�ֲ����죬��[0.3 0.7]�ڵĻҶ�����Ϊ[0 1]
subplot(2,2,4),imshow(K);
title('���Ա任ͼ��[0.3 0.7]');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ

%3.�����Ա任
%MATLAB����ʵ�����£�
I=imread('�շ�-���.jpg');
I1=rgb2gray(I);
subplot(1,2,1),imshow(I1);
title('�Ҷ�ͼ��');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
J=double(I1);
J=40*(log(J+1));
H=uint8(J);
subplot(1,2,2),imshow(H);
title('�����任ͼ��');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ

%4.ֱ��ͼ���⻯
%MATLAB����ʵ�����£�
I=imread('�շ�-���.jpg');
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

%5.����ƽ���˲���
%��MATLABʵ������ƽ����������������
I=imread('�շ�-���.jpg');
subplot(231)
imshow(I)
title('ԭʼͼ��')
I=rgb2gray(I);
I1=imnoise(I,'salt & pepper',0.02);
subplot(232)
imshow(I1)
title('��ӽ���������ͼ��')
k1=filter2(fspecial('average',3),I1)/255;          %����3*3ģ��ƽ���˲�
k2=filter2(fspecial('average',5),I1)/255;          %����5*5ģ��ƽ���˲�
k3=filter2(fspecial('average',7),I1)/255;          %����7*7ģ��ƽ���˲�
k4=filter2(fspecial('average',9),I1)/255;          %����9*9ģ��ƽ���˲�
subplot(233),imshow(k1);title('3*3ģ��ƽ���˲�');
subplot(234),imshow(k2);title('5*5ģ��ƽ���˲�');
subplot(235),imshow(k3);title('7*7ģ��ƽ���˲�');
subplot(236),imshow(k4);title('9*9ģ��ƽ���˲�');

%6.��ֵ�˲���
%��MATLABʵ����ֵ�˲��������£�
I=imread('/Users/wangning/Desktop/������ƽ��/�շ�.jpg');
I=rgb2gray(I);
J=imnoise(I,'salt&pepper',0.02);
subplot(231),imshow(I);title('ԭͼ��');
subplot(232),imshow(J);title('��ӽ�������ͼ��');
k1=medfilt2(J);            %����3*3ģ����ֵ�˲�
k2=medfilt2(J,[5,5]);      %����5*5ģ����ֵ�˲�
k3=medfilt2(J,[7,7]);      %����7*7ģ����ֵ�˲�
k4=medfilt2(J,[9,9]);      %����9*9ģ����ֵ�˲�
subplot(233),imshow(k1);title('3*3ģ����ֵ�˲�');
subplot(234),imshow(k2);title('5*5ģ����ֵ�˲�');
subplot(235),imshow(k3);title('7*7ģ����ֵ�˲�');
subplot(236),imshow(k4);title('9*9ģ����ֵ�˲�');

%7.��Sobel���Ӻ�������˹��ͼ���񻯣�
I=imread('xian.bmp');
subplot(2,2,1),imshow(I);
title('ԭʼͼ��');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
I1=im2bw(I);
subplot(2,2,2),imshow(I1);
title('��ֵͼ��');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
H=fspecial('sobel');     %ѡ��sobel���� 
J=filter2(H,I1);            %�������
subplot(2,2,3),imshow(J);
title('sobel������ͼ��');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
h=[0 1 0,1 -4 1,0 1 0];   %������˹����
J1=conv2(I1,h,'same');            %�������
subplot(2,2,4),imshow(J1);
title('������˹������ͼ��');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ

%8.�ݶ����Ӽ���Ե
%��MATLABʵ�����£�
I=imread('xian.bmp');
subplot(2,3,1);
imshow(I);
title('ԭʼͼ��');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
I1=im2bw(I);
subplot(2,3,2);
imshow(I1);
title('��ֵͼ��');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
I2=edge(I1,'roberts');
figure;
subplot(2,3,3);
imshow(I2);
title('roberts���ӷָ���');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
I3=edge(I1,'sobel');
subplot(2,3,4);
imshow(I3);
title('sobel���ӷָ���');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
I4=edge(I1,'Prewitt');
subplot(2,3,5);
imshow(I4);
title('Prewitt���ӷָ���');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ

%9.LOG���Ӽ���Ե
%��MATLAB����ʵ�����£�
I=imread('xian.bmp');
subplot(2,2,1);
imshow(I);
title('ԭʼͼ��');
I1=rgb2gray(I);
subplot(2,2,2);
imshow(I1);
title('�Ҷ�ͼ��');
I2=edge(I1,'log');
subplot(2,2,3);
imshow(I2);
title('log���ӷָ���');

%10.Canny���Ӽ���Ե
%��MATLAB����ʵ�����£�
I=imread('xian.bmp');
subplot(2,2,1);
imshow(I);
title('ԭʼͼ��')
I1=rgb2gray(I);
subplot(2,2,2);
imshow(I1);
title('�Ҷ�ͼ��');
I2=edge(I1,'canny');
subplot(2,2,3);
imshow(I2);
title('canny���ӷָ���');

%11.�߽���٣�bwtraceboundary������
clc
clear all
I=imread('xian.bmp');
figure
imshow(I);
title('ԭʼͼ��');
I1=rgb2gray(I);                %����ɫͼ��ת���Ҷ�ͼ�� 
threshold=graythresh(I1);        %���㽫�Ҷ�ͼ��ת��Ϊ��ֵͼ�����������
BW=im2bw(I1, threshold);       %���Ҷ�ͼ��ת��Ϊ��ֵͼ��
figure
imshow(BW);
title('��ֵͼ��');
dim=size(BW);
col=round(dim(2)/2)-90;         %������ʼ��������
row=find(BW(:,col),1);          %������ʼ��������
connectivity=8;
num_points=180;
contour=bwtraceboundary(BW,[row,col],'N',connectivity,num_points);
%��ȡ�߽�
figure
imshow(I1);
hold on;
plot(contour(:,2),contour(:,1), 'g','LineWidth' ,2);
title('�߽����ͼ��');

%12.Hough�任
I= imread('xian.bmp');
rotI=rgb2gray(I);
subplot(2,2,1);
imshow(rotI);
title('�Ҷ�ͼ��');
axis([50,250,50,200]);
grid on;                
axis on;
BW=edge(rotI,'prewitt');
subplot(2,2,2);
imshow(BW);
title('prewitt���ӱ�Ե����ͼ��');
axis([50,250,50,200]);
grid on;                
axis on;
[H,T,R]=hough(BW);
subplot(2,2,3);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
title('����任ͼ');
xlabel('\theta'),ylabel('\rho');
axis on , axis normal, hold on;
P=houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x=T(P(:,2));y=R(P(:,1));
plot(x,y,'s','color','white');
lines=houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
subplot(2,2,4);,imshow(rotI);
title('����任ͼ����');
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

%13.ֱ��ͼ��ֵ��
%��MATLABʵ��ֱ��ͼ��ֵ����
I=imread('xian.bmp');
I1=rgb2gray(I);
figure;
subplot(2,2,1);
imshow(I1);
title('�Ҷ�ͼ��')
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
[m,n]=size(I1);                            %����ͼ��ߴ����
GP=zeros(1,256);                           %Ԥ������ŻҶȳ��ָ��ʵ�����
for k=0:255
     GP(k+1)=length(find(I1==k))/(m*n);    %����ÿ���Ҷȳ��ֵĸ��ʣ��������GP����Ӧλ��
end
subplot(2,2,2),bar(0:255,GP,'g')                   %����ֱ��ͼ
title('�Ҷ�ֱ��ͼ')
xlabel('�Ҷ�ֵ')
ylabel('���ָ���')
I2=im2bw(I,150/255);  
subplot(2,2,3),imshow(I2);
title('��ֵ150�ķָ�ͼ��')
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
I3=im2bw(I,200/255);   %
subplot(2,2,4),imshow(I3);
title('��ֵ200�ķָ�ͼ��')
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ

%4. �Զ���ֵ����Otsu��
%��MATLABʵ��Otsu�㷨��
clc
clear all
I=imread('xian.bmp');
subplot(1,2,1),imshow(I);
title('ԭʼͼ��')
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
level=graythresh(I);     %ȷ���Ҷ���ֵ
BW=im2bw(I,level);
subplot(1,2,2),imshow(BW);
title('Otsu����ֵ�ָ�ͼ��')
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ

%15.���Ͳ���
I=imread('xian.bmp');          %����ͼ��
I1=rgb2gray(I);
subplot(1,2,1);
imshow(I1);
title('�Ҷ�ͼ��')     
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
se=strel('disk',1);          %����Բ�νṹԪ��
I2=imdilate(I1,se);             %�����ɵĽṹԪ�ض�ͼ���������
subplot(1,2,2);
imshow(I2);
title('���ͺ�ͼ��');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ

%16.��ʴ����
%MATLABʵ�ָ�ʴ����
I=imread('xian.bmp');          %����ͼ��
I1=rgb2gray(I);
subplot(1,2,1);
imshow(I1);
title('�Ҷ�ͼ��')     
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
se=strel('disk',1);       %����Բ�νṹԪ��
I2=imerode(I1,se);        %�����ɵĽṹԪ�ض�ͼ����и�ʴ
subplot(1,2,2);
imshow(I2);
title('��ʴ��ͼ��');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ

%17.�����ͱպϲ���
%��MATLABʵ�ֿ����ͱպϲ���
I=imread('xian.bmp');          %����ͼ��
subplot(2,2,1),imshow(I);
title('ԭʼͼ��');
axis([50,250,50,200]);
axis on;                  %��ʾ����ϵ 
I1=rgb2gray(I);
subplot(2,2,2),imshow(I1);
title('�Ҷ�ͼ��');
axis([50,250,50,200]);
axis on;                  %��ʾ����ϵ                  
se=strel('disk',1);     %���ð뾶Ϊ1��Բ��Ϊ�ṹԪ��
I2=imopen(I1,se);         %��������
I3=imclose(I1,se);        %�պϲ���
subplot(2,2,3),imshow(I2);
title('���������ͼ��');
axis([50,250,50,200]);
axis on;                  %��ʾ����ϵ
subplot(2,2,4),imshow(I3);
title('�պ������ͼ��');
axis([50,250,50,200]);
axis on;                  %��ʾ����ϵ

%18.�����ͱպ���ϲ���
I=imread('xian.bmp');          %����ͼ��
subplot(3,2,1),imshow(I);
title('ԭʼͼ��');
axis([50,250,50,200]);
axis on;                  %��ʾ����ϵ 
I1=rgb2gray(I);
subplot(3,2,2),imshow(I1);
title('�Ҷ�ͼ��');
axis([50,250,50,200]);
axis on;                  %��ʾ����ϵ                  
se=strel('disk',1);    
I2=imopen(I1,se);         %��������
I3=imclose(I1,se);        %�պϲ���
subplot(3,2,3),imshow(I2);
title('���������ͼ��');
axis([50,250,50,200]);
axis on;                  %��ʾ����ϵ
subplot(3,2,4),imshow(I3);
title('�պ������ͼ��');
axis([50,250,50,200]);
axis on;                  %��ʾ����ϵ
se=strel('disk',1);
I4=imopen(I1,se);
I5=imclose(I4,se);
subplot(3,2,5),imshow(I5);        %��?������ͼ��
title('��?������ͼ��');
axis([50,250,50,200]);
axis on;                  %��ʾ����ϵ 
I6=imclose(I1,se);
I7=imopen(I6,se);
subplot(3,2,6),imshow(I7);        %��?������ͼ�� 
title('��?������ͼ��');
axis([50,250,50,200]);
axis on;                  %��ʾ����ϵ   

%19.��̬ѧ�߽���ȡ
%����MATLABʵ�����£�
I=imread('xian.bmp');          %����ͼ��
subplot(1,3,1),imshow(I);
title('ԭʼͼ��');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
I1=im2bw(I);
subplot(1,3,2),imshow(I1);
title('��ֵ��ͼ��');
axis([50,250,50,200]);
grid on;                  %��ʾ������
axis on;                  %��ʾ����ϵ
I2=bwperim(I1);                 %��ȡ������ܳ�
subplot(1,3,3),imshow(I2);
title('�߽��ܳ��Ķ�ֵͼ��');
axis([50,250,50,200]);
grid on;
axis on;              

%20.��̬ѧ�Ǽ���ȡ
%����MATLABʵ�����£�
I=imread('xian.bmp');
subplot(2,2,1),imshow(I);
title('ԭʼͼ��');
axis([50,250,50,200]);
axis on;                 
I1=im2bw(I);
subplot(2,2,2),imshow(I1);
title('��ֵͼ��');
axis([50,250,50,200]);
axis on;                
I2=bwmorph(I1,'skel',1);
subplot(2,2,3),imshow(I2);
title('1�ιǼ���ȡ');
axis([50,250,50,200]);
axis on;                 
I3=bwmorph(I1,'skel',2);
subplot(2,2,4),imshow(I3);
title('2�ιǼ���ȡ');
axis([50,250,50,200]);
axis on;               

%21.ֱ����ȡ�ĸ���������
I = imread('xian.bmp');
I = I(:,:,1);
BW=im2bw(I);
figure
imshow(~BW)
[x,y]=getpts


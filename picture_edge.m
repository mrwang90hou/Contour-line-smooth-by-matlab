clc
clear
data=imread('�շ�-���-����.jpg');
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
%ƥ�䷽�������ƶȶ��壩
% ͼ����̬ѧ����     �Ҷ���̬ѧ
% ����ͼ��Ǽ��ߵ�logoʶ��ƥ�似��
% ͼ��   ֱ��ͼ���⻯
% ���ص���ͨ��ƥ��
clc,clear
data=imread('�շ�.png');
figure;
imshow(data)
gdata=rgb2gray(data);
figure;
imshow(gdata)
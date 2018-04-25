clc
clear
% ��1������ȡͼ��
data=imread('�շ�-���.jpg');

gdata=rgb2gray(data);
BW1 = edge(gdata,'prewitt');
% colormap(flipud(BW1));
figure;
%BW1 = abs(BW1-1);
imshow(BW1);
BW2 = edge(gdata,'canny');
% colormap(flipud(BW2));
figure;
%BW2 = abs(BW2-1)
imshow(BW2);





clc
clear
% ��1������ȡͼ��
data=imread('�շ�-���.jpg');
% ��2������ֵͼ��
% ��ͼ��ת��Ϊ�ڰ�ͼ���Ա�Ϊʹ�ñ߽������׼����bwboundaries
gdata = rgb2gray(data);
I=imcomplement(gdata)%�ڰ׶Ե�
bw = imbinarize(I);
figure;
imshow(bw)
% ��3������������
% ʹ����̬ѧ������ɾ�������ڸ���Ȥ��������ء�
% ��ɾ����������30�����ص����ж���
bw = bwareaopen(bw,10);
%��д��ñ�ļ�϶ 
se = strel('disk',2);
bw = imclose(bw,se);
%����κοն����Ա�regionprops������������
%ÿ���߽�����Χ������İٷֱ� 
%bw = imfill(bw,'holes');
figure;
imshow(bw)
%��4�����ҵ��߽�
% ֻ�������ⲿ�߽硣ѡ��'noholes'��ͨ����ֹ�����ڲ����������ٴ���bwboundaries
[B,L] = bwboundaries(bw,'noholes');%Ѱ�ұ�Ե����������  
% ��ʾ��ǩ���󲢻���ÿ���߽�
imshow(label2rgb(L, @jet, [.5 .5 .5]))%��ʾͼ��  
figure;
hold on
for k = 1:length(B)
  boundary = B{k};
  plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
% ��5����ȷ����Щ�����������
% ����ÿ�������������ܳ���ʹ����Щ������γ�һ���򵥵Ķ�����׼������ָʾ�����Բ�ȣ�metric = 4*pi*area/perimeter^2.
% �����������һ��Բֻ��һ����������С���κ�������״��һ����������̿���ͨ�������ʵ�����ֵ�����ơ�
% ����������У�ʹ��0.94����ֵ���Ա�ֻ��ҩ�轫������ΪԲ�Ρ�
% ʹ��regionprops�Ի�����ж��������Ĺ��ơ���ע�⣬���صı�ǩ������Ա����á�bwboundariesregionprops
stats = regionprops(L,'Area','Centroid');
threshold = 0.94;
% �����߽�ѭ��
for k = 1:length(B)
  % ������ǩ'k'��Ӧ�ģ�X��Y���߽�����
  boundary = B{k};
  % ��������ܳ��ļ򵥹���ֵ
  delta_sq = diff(boundary).^2;    
  perimeter = sum(sqrt(sum(delta_sq,2)));
  % ������ǩ'k'��Ӧ���������
  area = stats(k).Area;
  % ����Բ�ȶ���
  metric = 4*pi*area/perimeter^2;
  % ��ʾ���
  metric_string = sprintf('%2.2f',metric);
  % ����ֵ�Ϸ��ú�ɫԲȦ��Ƕ���
  if metric > threshold
    centroid = stats(k).Centroid;
    plot(centroid(1),centroid(2),'ko');
  end
  text(boundary(1,2)-35,boundary(1,1)+13,metric_string,'Color','y',...
       'FontSize',14,'FontWeight','bold');
end
title(['Metrics closer to 1 indicate that ',...
       'the object is approximately round']);
   
%%%%%%%%%%%%%%%%%%%%%�ֽ���%%%%%%%%%%%%%%%%%%%%%%
bw = imfill(BW1,'holes');
[B,L] = bwboundaries(bw,'noholes');


[B,L] = bwboundaries(bw,4); 
imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
boundary = B{k};
plot(boundary(:,2),boundary(:,1),'w','LineWidth',2)
end
% �ҵ�ÿ����ͨ�������
stats = regionprops(L,'Area','Centroid');
% ѭ������ÿ����ͨ��ı߽�
for k = 1:length(B)
boundary = B{k};
  % ��ȡһ���߽��ϵ����е�
end
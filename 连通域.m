clc
clear
% 第1步：读取图像
data=imread('日丰-锯齿.jpg');

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
% 第1步：读取图像
data=imread('日丰-锯齿.jpg');
% 第2步：阈值图像
% 将图像转换为黑白图像，以便为使用边界跟踪做准备。bwboundaries
gdata = rgb2gray(data);
I=imcomplement(gdata)%黑白对调
bw = imbinarize(I);
figure;
imshow(bw)
% 第3步：消除噪音
% 使用形态学函数，删除不属于感兴趣对象的像素。
% ％删除包含少于30个像素的所有对象
bw = bwareaopen(bw,10);
%填写笔帽的间隙 
se = strel('disk',2);
bw = imclose(bw,se);
%填充任何空洞，以便regionprops可以用来估计
%每个边界所包围的面积的百分比 
%bw = imfill(bw,'holes');
figure;
imshow(bw)
%第4步：找到边界
% 只集中在外部边界。选项'noholes'将通过防止搜索内部轮廓来加速处理。bwboundaries
[B,L] = bwboundaries(bw,'noholes');%寻找边缘，不包括孔  
% 显示标签矩阵并绘制每个边界
imshow(label2rgb(L, @jet, [.5 .5 .5]))%显示图像  
figure;
hold on
for k = 1:length(B)
  boundary = B{k};
  plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end
% 第5步：确定哪些对象是舍入的
% 估计每个物体的面积和周长。使用这些结果来形成一个简单的度量标准，用于指示对象的圆度：metric = 4*pi*area/perimeter^2.
% 这个度量等于一个圆只有一个，并且它小于任何其他形状的一个。鉴别过程可以通过设置适当的阈值来控制。
% 在这个例子中，使用0.94的阈值，以便只有药丸将被分类为圆形。
% 使用regionprops以获得所有对象的区域的估计。请注意，返回的标签矩阵可以被重用。bwboundariesregionprops
stats = regionprops(L,'Area','Centroid');
threshold = 0.94;
% 超过边界循环
for k = 1:length(B)
  % 获得与标签'k'对应的（X，Y）边界坐标
  boundary = B{k};
  % 计算对象周长的简单估计值
  delta_sq = diff(boundary).^2;    
  perimeter = sum(sqrt(sum(delta_sq,2)));
  % 获得与标签'k'对应的面积计算
  area = stats(k).Area;
  % 计算圆度度量
  metric = 4*pi*area/perimeter^2;
  % 显示结果
  metric_string = sprintf('%2.2f',metric);
  % 在阈值上方用黑色圆圈标记对象。
  if metric > threshold
    centroid = stats(k).Centroid;
    plot(centroid(1),centroid(2),'ko');
  end
  text(boundary(1,2)-35,boundary(1,1)+13,metric_string,'Color','y',...
       'FontSize',14,'FontWeight','bold');
end
title(['Metrics closer to 1 indicate that ',...
       'the object is approximately round']);
   
%%%%%%%%%%%%%%%%%%%%%分界线%%%%%%%%%%%%%%%%%%%%%%
bw = imfill(BW1,'holes');
[B,L] = bwboundaries(bw,'noholes');


[B,L] = bwboundaries(bw,4); 
imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B)
boundary = B{k};
plot(boundary(:,2),boundary(:,1),'w','LineWidth',2)
end
% 找到每个连通域的质心
stats = regionprops(L,'Area','Centroid');
% 循环历遍每个连通域的边界
for k = 1:length(B)
boundary = B{k};
  % 获取一条边界上的所有点
end
function [colX,rowY] = getCoordinate(data)
%getCoordinate 获取坐标的函数
gdata=rgb2gray(data);
BW = edge(gdata,'prewitt');

% figure;
% imshow(BW);

%寻找像素为1的点 row为横坐标（行数） col为纵坐标（列数）
[rowY,colX]=find(BW == 1);%获取行和列

% figure;
% grid on;
% % hold on;
% plot(colX,-rowY,'.');

end


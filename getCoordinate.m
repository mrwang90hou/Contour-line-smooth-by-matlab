function [colX,rowY] = getCoordinate(data)
%getCoordinate ��ȡ����ĺ���
gdata=rgb2gray(data);
BW = edge(gdata,'prewitt');

% figure;
% imshow(BW);

%Ѱ������Ϊ1�ĵ� rowΪ�����꣨������ colΪ�����꣨������
[rowY,colX]=find(BW == 1);%��ȡ�к���

% figure;
% grid on;
% % hold on;
% plot(colX,-rowY,'.');

end


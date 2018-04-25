close all; clear all;clc;  
SaveSize = [768 576];  
Res = 100;  
ImgSave_Name = 'F:\1.png';  
  
A = imread('12.bmp');  
B = imread('Seg.png');  
C = rgb2gray(A);  
  
h = figure(1); imshow(C,'border','tight','initialmagnification','fit'), hold on  
set(gcf,'PaperPositionMode', 'manual');  
set(gcf,'PaperUnits','inches');  
set(gcf,'PaperPosition', [0 0 SaveSize(1)/Res SaveSize(2)/Res]);  
% Contour  
B = B(:,:,1)==255;  
contour(B, 1, 'linecolor','g');  
print(gcf, ['-r',num2str(Res)], '-dpng',ImgSave_Name);  
close(h);  
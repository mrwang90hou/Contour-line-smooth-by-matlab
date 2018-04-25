% By lyqmath @ Matlab中文论坛
clc; clear all; close all;
I = imread('/Users/wangning/Desktop/轮廓线平滑/日丰.jpg');
bw = im2bw(I, graythresh(I));
B = bwboundaries(bw);
figure; imshow(bw);
hold on;
b = B{1};
plot(b(:, 2), b(:, 1), 'r-');
figure;
plot(b(:, 2), b(:, 1), 'r-');
function [ output_args ] = getJudgeArray( x,y )
%UNTITLED15 此处显示有关此函数的摘要
%   此处显示详细说明
output_args = [x,y+1;x+1,y+1;x+1,y;x+1,y-1; x,y-1;x-1,y-1;x-1,y;x-1,y+1];
end


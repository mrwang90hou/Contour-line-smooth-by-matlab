function [ output_args ] = getJudgeArray( x,y )
%UNTITLED15 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
output_args = [x,y+1;x+1,y+1;x+1,y;x+1,y-1; x,y-1;x-1,y-1;x-1,y;x-1,y+1];
end


clear,clc
edgeIm = imread('日丰-锯齿-左上.jpg');
figure;
imshow(edgeIm);
gdata=rgb2gray(edgeIm);
BW = edge(gdata,'prewitt');
%edgeIm中非零元素的坐标，即轮廓坐标
[i, j] = find(BW==1);
figure;
plot(j,-i,'.');
%轮廓点数
numPoints = size(i, 1);
curNum = 0;
%初始搜索点坐标
currentR = i(1, 1);
currentC = j(1, 1);
%初始化轮廓点坐标
points = zeros(numPoints, 2);
%开始搜索
curNum = curNum + 1;
points(curNum,:) = [currentR, currentC];
edgeIm(currentR, currentC) = 0;

while curNum ~= numPoints
    if edgeIm(currentR, currentC-1) == 1
        curNum = curNum + 1;
        currentC = currentC - 1;
        points(curNum,:) = [currentR, currentC];
        edgeIm(currentR, currentC) = 0;
    
        
        elseif edgeIm(currentR-1, currentC-1) == 1
            curNum = curNum + 1;
            currentR = currentR - 1;
            currentC = currentC - 1;
            points(curNum,:) = [currentR, currentC];
            edgeIm(currentR, currentC) = 0;
            
        elseif edgeIm(currentR-1, currentC) == 1
            curNum = curNum + 1;
            currentR = currentR - 1;
            points(curNum,:) = [currentR, currentC];
            edgeIm(currentR, currentC) = 0;
            
        elseif edgeIm(currentR-1, currentC+1) == 1
            curNum = curNum + 1;
            currentR = currentR - 1;
            currentC = currentC + 1;
            points(curNum,:) = [currentR, currentC];
            edgeIm(currentR, currentC) = 0;
            
        elseif edgeIm(currentR, currentC+1) == 1
            curNum = curNum + 1;
            currentC = currentC + 1;
            points(curNum,:) = [currentR, currentC];
            edgeIm(currentR, currentC) = 0;
            
        elseif edgeIm(currentR+1, currentC+1) == 1
            curNum = curNum + 1;
            currentR = currentR + 1;
            currentC = currentC + 1;
            points(curNum,:) = [currentR, currentC];
            edgeIm(currentR, currentC) = 0;
            
        elseif edgeIm(currentR+1, currentC) == 1
            curNum = curNum + 1;
            currentR = currentR + 1;
            points(curNum,:) = [currentR, currentC];
            edgeIm(currentR, currentC) = 0;
            
    elseif edgeIm(currentR+1, currentC-1) == 1
            curNum = curNum + 1;
            currentR = currentR + 1;
            currentC = currentC - 1;
            points(curNum,:) = [currentR, currentC];
            edgeIm(currentR, currentC) = 0;
    end
end
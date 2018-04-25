I =imread('日丰-锯齿.jpg');%读取图片  
I1 = double(I);  
[Gx,Gy]=gradient(I1);  
 G=sqrt(Gx.*Gx+Gy.*Gy)/255;%%求图像梯度  
 I2 = rgb2gray(G);  
figure,imshow(G);  
I2(I2<30/255)=0;%%%二值化  
I2(I2>=30/255)=1;  

U= findContours(I2);%轮廓提取  
[m,n] = size(U);%得到轮廓数量  
aa = ones(n,4);  
for i=1:n   
    d = U(1,i);  
    [ii,jj] = size(d{1,1});  
     jj  
    if jj<10%过小的轮廓不要  
        continue;  
    end  
%%%%%%直线拟合-start%%%%%%%%%%%%%  
aa(i,:)= fitLine(d{1,1});  
%%%%%%直线拟合-end%%%%%%%%%%%%%  
end  
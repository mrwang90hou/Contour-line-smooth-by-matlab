I =imread('�շ�-���.jpg');%��ȡͼƬ  
I1 = double(I);  
[Gx,Gy]=gradient(I1);  
 G=sqrt(Gx.*Gx+Gy.*Gy)/255;%%��ͼ���ݶ�  
 I2 = rgb2gray(G);  
figure,imshow(G);  
I2(I2<30/255)=0;%%%��ֵ��  
I2(I2>=30/255)=1;  

U= findContours(I2);%������ȡ  
[m,n] = size(U);%�õ���������  
aa = ones(n,4);  
for i=1:n   
    d = U(1,i);  
    [ii,jj] = size(d{1,1});  
     jj  
    if jj<10%��С��������Ҫ  
        continue;  
    end  
%%%%%%ֱ�����-start%%%%%%%%%%%%%  
aa(i,:)= fitLine(d{1,1});  
%%%%%%ֱ�����-end%%%%%%%%%%%%%  
end  
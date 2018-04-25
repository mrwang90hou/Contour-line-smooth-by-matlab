%http://blog.sina.com.cn/s/blog_a3d3dea80102wl8q.html
%[转载]均值滤波、中值滤波的matlab实现

%x是需要滤波的图像,n是模板大小(即n×n)  
function d=avg_filter(x,n)     
a(1:n,1:n)=1;   %a即n×n模板,元素全是1  
[height, width]=size(x);   %输入图像是hightxwidth的,且hight>n,width>n  
x1=double(x);  
x2=x1;  
for i=1:hight-n+1  
    for j=1:width-n+1  
        c=x1(i:i+(n-1),j:j+(n-1)).*a; %取出x1中从(i,j)开始的n行n列元素与模板相乘  
        s=sum(sum(c));                 %求c矩阵中各元素之和  
        x2(i+(n-1)/2,j+(n-1)/2)=s/(n*n); %将与模板运算后的各元素的均值赋给模板中心位置的元素  
    end  
end  
%未被赋值的元素取原值  
d=uint8(x2); 



%自编的中值滤波函数。x是需要滤波的图像,n是模板大小(即n×n)  
function d=mid_filter(x,n)     
[height, width]=size(x);   %输入图像是p×q的,且p>n,q>n  
x1=double(x);  
x2=x1;  
for i=1:height-n+1  
    for j=1:height-n+1  
        c=x1(i:i+(n-1),j:j+(n-1)); %取出x1中从(i,j)开始的n行n列元素,即模板(n×n的)  
        e=c(1,:);      %是c矩阵的第一行  
        for u=2:n  
            e=[e,c(u,:)];     %将c矩阵变为一个行矩阵      
        end  
        mm=median(e);      %mm是中值  
        x2(i+(n-1)/2,j+(n-1)/2)=mm;   %将模板各元素的中值赋给模板中心位置的元素  
    end  
end   
%未被赋值的元素取原值  
d=uint8(x2);  



%自编的高斯滤波函数，S是需要滤波的图象，n是均值，k是方差  
function d=gaussfilt(k,n,s)   
Img = double(s);   
n1=floor((n+1)/2);%计算图象中心   
for i=1:n   
    for j=1:n   
      b(i,j) =exp(-((i-n1)^2+(j-n1)^2)/(4*k))/(4*pi*k);   
    end   
end   
%生成高斯序列b。  
Img1=conv2(Img,b,'same'); %用生成的高斯序列卷积运算，进行高斯滤波  
d=uint8(Img1); 


%主函数
%此为程序主文件，包含主要功能单元，以及对子函数进行调用  
try  
%实验步骤一：彩色、灰度变换  
h=imread('photo.jpg'); %读入彩色图片  
c=rgb2gray(h); %把彩色图片转化成灰度图片，256级  
figure,imshow(c),title('原始图象'); %显示原始图象  
g=imnoise(c,'gaussian',0.1,0.002); %加入高斯噪声  
figure,imshow(g),title('加入高斯噪声之后的图象'); %显示加入高斯噪声之后的图象  
  
%实验步骤二：用系统预定义滤波器进行均值滤波  
n=input('请输入均值滤波器模板大小n');  
A=fspecial('average',n); %生成系统预定义的3X3滤波器  
Y=filter2(A,g)/255;           %用生成的滤波器进行滤波,并归一化  
figure,imshow(Y),title('用系统函数进行均值滤波后的结果'); %显示滤波后的图象  
  
%实验步骤三:用自己的编写的函数进行均值滤波  
Y2=avefilt(g,n);     %调用自编函数进行均值滤波，n为模板大小  
figure,imshow(Y2),title('用自己的编写的函数进行均值滤波之后的结果'); %显示滤波后的图象  
  
%实验步骤四:用Matlab系统函数进行中值滤波  
n2=input('请输入中值滤波的模板的大小n');  
Y3=medfilt2(g,[n2 n2]);   %调用系统函数进行中值滤波，n2为模板大小   
figure,imshow(Y3),title('用Matlab系统函数进行中值滤波之后的结果'); %显示滤波后的图象  
  
%实验步骤五:用自己的编写的函数进行中值滤波  
Y4=midfilt(g,n2);      %调用自己编写的函数进行中值滤波，  
figure,imshow(Y4),title('用自己编写的函数进行中值滤波之后的结果');  
  
%实验步骤六:用matlab系统函数进行高斯滤波  
n3=input('请输入高斯滤波器的均值n');  
k=input('请输入高斯滤波器的方差n');  
A2=fspecial('gaussian',k,n3);      %生成高斯序列  
Y5=filter2(A2,g)/255;              %用生成的高斯序列进行滤波  
figure,imshow(Y5),title('用Matlab函数进行高斯滤波之后的结果');    %显示滤波后的图象  
  
%实验步骤七:用自己编写的函数进行高斯滤波  
Y6=gaussfilt(n3,k,g); %调用自己编写的函数进行高斯滤波，n3为均值，k为方差  
figure,imshow(Y6),title('用自编函数进行高斯滤波之后的结果');      %显示滤波后的图象  
  
catch           %捕获异常  
    disp(lasterr);     %如果程序有异常，输出  
end  
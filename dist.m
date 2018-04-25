function distance=dist(a,b)
    x1=a(1);
    y1=a(2);
    x2=b(1);
    y2=b(2);
    distance=sqrt((x2-x1).^2+(y2-y1).^2);
%     disp('Calculate the distance between two points: ');
%     ax=input('Enter x value of point a: ');
%     ay=input('Enter y value of point a: ');
%     bx=input('Enter x value of point b: ');
%     by=input('Enter y value of point b: ');
%     result=dist1(ax,ay,bx,by);
%     fprintf('The distance between point a and b is %f\n',result);
end
I=imread('Fig3.tif');
angle=30;
J=myrotate(I,angle);
%二维选转函数
I=double(I);
[m,n]=size(I);
R=angle*pi/180;

m1=ceil(m*cos(R)+n*abs(sin(R)));
n1=ceil(n*cos(R)+m*abs(sin(R)));

J=zeros(m1,n1);
T=[cos(R),sin(R);-sin(R),cos(R)];

%判断旋转逆时针还是顺时针
if sign(R)==1
    u0=n*abs(sin(R));
    tu=[u0;0];
else
    u0=m*abs(sin(R));
    tu=[0;u0];
end
%采用向后映射插值方法
for u=1:m1
    for v=1:n1
        tem=T*([u;v]-tu);
        x=tem(1);
        y=tem(2);
        if x>=1&&x<=m&&y>=1&&y<=n
            xlow=floor(x);
            xup=ceil(x);
            ylow=floor(y);
            yup=ceil(y);
            
            t=x-xlow;
            s=y-ylow;
            
            p1=I(xlow,ylow);
            p2=I(xlow,yup);
            p3=I(xup,ylow);
            p4=I(xup,yup);
            
            J(u,v)=(1-t)*(1-s)*p1+(1-t)*s*p2+t*(1-s)*p3+t*s*p4;
        end
    end
end
J=uint16(J);
    


            
            
            
            
            
            
            
            
            
            
            
            
            
            
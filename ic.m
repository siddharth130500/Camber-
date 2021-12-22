function ic()

z1=linspace(150,550,300);
x1=zeros(1,300);
y1=zeros(1,300);
x2=zeros(1,300);
y2=zeros(1,300);
z2=zeros(1,300);
e1=zeros(1,300);
e3=zeros(1,300);
mid=zeros(1,300);
tanphi=zeros(1,300);
p1=-152.62;
q1=229.02;
r1=591.93;
u1=-9.18;
v1=229.02;
t1=456.32;
p2=-178.03;
q2=164.98;
r2=423.88;
u2=9.18;
v2=164.98;
t2=330.38;
d=347.39;
d1=424.98;
c=175.66;
l=437.76;
l1=508.77;
for i=1:300
    syms a b ;
    [a,b]=solve((a-u1)^2+(b-v1)^2+(z1(i)-t1)^2==d^2,(a-p1)^2+(b-q1)^2+(z1(i)-r1)^2==d1^2);
    x1(i)=a(2);
    y1(i)=b(2);
    syms g h j;
    [g,h,j]=solve((g-x1(i))^2+(h-y1(i))^2+(j-z1(i))^2==c^2,(g-u2)^2+(h-v2)^2+(j-t2)^2==l^2,(g-p2)^2+(h-q2)^2+(j-r2)^2==l1^2);
    x2(i)=g(1);
    y2(i)=h(1);
    z2(i)=j(1);
    camber_change=helper(165,330.2,229,456.5,584.47,204.97,567.69,379.23,z1(i));
    u=(y1(i)+y2(i))/2+98.92*cos(camber_change);
    n1=((u-y2(i))/(y2(i)-q2))*(x2(i)-p2)+x2(i);
    n3=((u-y2(i))/(y2(i)-q2))*(z2(i)-r2)+z2(i);
    m1=((u-y2(i))/(y2(i)-v2))*(x2(i)-u2)+x2(i);
    m3=((u-y2(i))/(y2(i)-v2))*(z2(i)-t2)+z2(i);
    k1=((u-y1(i))/(y1(i)-q1))*(x1(i)-p1)+x1(i);
    k3=((u-y1(i))/(y1(i)-q1))*(z1(i)-r1)+z1(i);
    b1=((u-y1(i))/(y1(i)-v1))*(x1(i)-u1)+x1(i);
    b3=((u-y1(i))/(y1(i)-v1))*(z1(i)-t1)+z1(i);
    f1=(b3-k3)/(b1-k1);
    f2=(m3-n3)/(m1-n1);
    e1(i)=(f1*k1-f2*n1+n3-k3)/(f1-f2);
    e3(i)=((k3/f1)-(n3/f2)+n1-k1)/((f2-f1)/f1*f2);
    mid(i)=(z1(i)+z2(i))/2;
    tanphi(i)=e3(i)/e1(i);
end
figure,plot(mid-292.1,e1-365.85,'.');
title('wheel travel vs horizontal IC movement');

figure,plot(mid-292.1,e3,'.');
title('wheel travel vs vertical IC movement');

figure,plot(mid-292.1,tanphi,'.');
title('wheel travel versus tan(phi)');
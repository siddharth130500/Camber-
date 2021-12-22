function steer(B,L,x,beta,p,r)
di=linspace(0,pi/4,100);
do=zeros(1,100);
beta=beta*pi/180;
for i=1:100
    do(i) = acot(B/L + cot(di(i)));
end
plot(di*180/pi,do*180/pi,'.');
hold on;
A=B/2-(p/2+r);
y=rack(B,L,x,beta,p,r,40*pi/180);
d=len(B,L,x,beta,p,r,40*pi/180);
do=zeros(1,100);
for i=1:100
    q=x*sin(di(i)+beta)-A+sqrt(y^2-(d-x*cos(di(i)+beta))^2);
    c=(y^2-d^2-x^2-(A-q)^2)/(2*x);
    k=(c*(A-q)+sqrt(c^2*(A-q)^2-((A-q)^2+d^2)*(c^2-d^2)))/((A-q)^2+d^2);
    do(i)=asin(k)+beta;
end
plot(di*180/pi,do*180/pi,'.');

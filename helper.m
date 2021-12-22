function camber_change = helper(chassislp_y,chassislp_z,chassisup_y,chassisup_z,LBJ_y,LBJ_z,UBJ_y,UBJ_z,t2)

y1=chassislp_y;
z1=chassislp_z;
y2=chassisup_y;
z2=chassisup_z;
p1=LBJ_y;
q1=LBJ_z;
p2=UBJ_y;
q2=UBJ_z;
d=175.06;
l=sqrt((p2-y2)^2+(q2-z2)^2);
l1=sqrt((p1-y1)^2+(q1-z1)^2);
    v2=sqrt(l^2-(t2-z2)^2)+y2;
    a=(v2^2-y1^2+t2^2-z1^2-d^2+l1^2)/(2*(v2-y1));
    b=(t2-z1)/(v2-y1);
    w1=(2*b*(a-v2)+2*t2+sqrt((2*b*(a-v2)+2*t2)^2-4*(1+b^2)*(t2^2+(a-v2)^2-d^2)))/(2*(1+b^2));
    w2=(2*b*(a-v2)+2*t2-sqrt((2*b*(a-v2)+2*t2)^2-4*(1+b^2)*(t2^2+(a-v2)^2-d^2)))/(2*(1+b^2));
    n1=a-b*w1;
    n2=a-b*w2;
    if n1>n2 & w1<w2
        k2=w1;
        k1=n1;
    else
        k2=w2;
        k1=n2;
    end
    e1=atan((t2-k2)/(v2-k1));
    e2=atan((q2-q1)/(p2-p1));
    camber_change=e1-e2;

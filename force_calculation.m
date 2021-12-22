function X = force_calculation()


    pc1 = [152.226, 17.34, 44.756]; 
    pc2 = [152.226, 13.547, 33.252]; 
    pc3 = [140.226, 13.547, 33.252];
    pc5 = [87.769, 32.186, 39.306];  
    pc4 = [87.81, 30.985, 34.023];  
    pc6 = [147.87, 21.809, 66.859]; 
    
    p1 = [149.211, 54.459, 34.134];   
    p2 = [149.211, 54.459, 20.055];   
    p3 = [137.211, 54.459, 20.055];   
    p5 = [134.298, 53.629, 30.873];  
    p4 = [134.338, 52.429, 25.59];   
    p6 = [141.064, 54.038, 35.078];  
    t = [143.211, 54.459, 27.095];
    
    %pc1 = [150.226 16.834 43.323]; 
    %pc2 = [150.226 13.547 33.252]; 
    %pc3 = [138.226 13.547 33.252];
    %pc5 = [87.183 30.71 41.397];  
    %pc4 = [87.115 30.454 33.647];  
    %pc6 = [117.471 23.128 63.294]; 
    
    %p1 = [149.211 51.726 343.252];   
    %p2 = [149.211 51.726 20.937];   
    %p3 = [137.211 51.726 20.937];   
    %p5 = [134.374 50.752 31.605];  
    %p4 = [134.306 50.496 23.855];   
    %p6 = [138.809 49.681 32.799];  
    %t = [143.211 51.726 27.095];
    
    fx=0;
    fy=1440;
    fz=2400;                                                                                                 
    
    vec1=-(pc1-p1)/sqrt(sum((pc1-p1).*(pc1-p1)));
    vec2=-(pc2-p2)/sqrt(sum((pc2-p2).*(pc2-p2)));
    vec3=-(pc3-p3)/sqrt(sum((pc3-p3).*(pc3-p3)));
    vec4=-(pc4-p4)/sqrt(sum((pc4-p4).*(pc4-p4)));
    vec5=-(pc5-p5)/sqrt(sum((pc5-p5).*(pc5-p5)));
    vec6=-(pc6-p6)/sqrt(sum((pc6-p6).*(pc6-p6)));
    
    %tz=fix*(pi(2)-t(2))-fiy*(pi(1)-t(1))=0
    %ty=fiz*(pi(1)-t(1))-fix*(pi(3)-t(3))=0
    %tx=fiy*(pi(3)-t(3))-fiz*(pi(2)-t(2))=0
    
    a1=vec1(1)*(p1(2)-t(2))-vec1(2)*(p1(1)-t(1));
    a2=vec2(1)*(p2(2)-t(2))-vec2(2)*(p2(1)-t(1));
    a3=vec3(1)*(p3(2)-t(2))-vec3(2)*(p3(1)-t(1));
    a4=vec4(1)*(p4(2)-t(2))-vec4(2)*(p4(1)-t(1));
    a5=vec5(1)*(p5(2)-t(2))-vec5(2)*(p5(1)-t(1));
    a6=vec6(1)*(p6(2)-t(2))-vec6(2)*(p6(1)-t(1));
    
    b1=vec1(3)*(p1(1)-t(1))-vec1(1)*(p1(3)-t(3));
    b2=vec2(3)*(p2(1)-t(1))-vec2(1)*(p2(3)-t(3));
    b3=vec3(3)*(p3(1)-t(1))-vec3(1)*(p3(3)-t(3));
    b4=vec4(3)*(p4(1)-t(1))-vec4(1)*(p4(3)-t(3));
    b5=vec5(3)*(p5(1)-t(1))-vec5(1)*(p5(3)-t(3));
    b6=vec6(3)*(p6(1)-t(1))-vec6(1)*(p6(3)-t(3));
    
    c1=vec1(2)*(p1(3)-t(3))-vec1(3)*(p1(2)-t(2));
    c2=vec2(2)*(p2(3)-t(3))-vec2(3)*(p2(2)-t(2));
    c3=vec3(2)*(p3(3)-t(3))-vec3(3)*(p3(2)-t(2));
    c4=vec4(2)*(p4(3)-t(3))-vec4(3)*(p4(2)-t(2));
    c5=vec5(2)*(p5(3)-t(3))-vec5(3)*(p5(2)-t(2));
    c6=vec6(2)*(p6(3)-t(3))-vec6(3)*(p6(2)-t(2));
    
    
    mat=[vec1(1),vec2(1),vec3(1),vec4(1),vec5(1),vec6(1);
         vec1(2),vec2(2),vec3(2),vec4(2),vec5(2),vec6(2);
         vec1(3),vec2(3),vec3(3),vec4(3),vec5(3),vec6(3);
         a1,a2,a3,a4,a5,a6;
         b1,b2,b3,b4,b5,b6;
         c1,c2,c3,c4,c5,c6;];
     X=zeros(6,1);
     fmat=[-fx;-fy;-fz;0;0;0];
    
     X=pinv(mat)*fmat;
     
     Y=zeros(6,3);
     Y(1,1)=X(1)*vec1(1);
     Y(1,2)=X(1)*vec1(2);
     Y(1,3)=X(1)*vec1(3);
     Y(2,1)=X(2)*vec2(1);
     Y(2,2)=X(2)*vec2(2);
     Y(2,3)=X(2)*vec2(3);
     Y(3,1)=X(3)*vec3(1);
     Y(3,2)=X(3)*vec3(2);
     Y(3,3)=X(3)*vec3(3);
     Y(4,1)=X(4)*vec4(1);
     Y(4,2)=X(4)*vec4(2);
     Y(4,3)=X(4)*vec4(3);
     Y(5,1)=X(5)*vec5(1);
     Y(5,2)=X(5)*vec5(2);
     Y(5,3)=X(5)*vec5(3);
     Y(6,1)=X(6)*vec6(1);
     Y(6,2)=X(6)*vec6(2);
     Y(6,3)=X(6)*vec6(3);
     disp(Y);
     
     
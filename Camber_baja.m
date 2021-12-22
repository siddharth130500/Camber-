function Camber_baja(SAI,castor)
d = linspace(-pi/4,pi/4,601);
%ubj = [2.125,57.602,29.2];
% lbj = [0.373,59.023,13.97];
a = 300;
SAI = SAI*pi/180;%atan((lbj(2)- ubj(2))/(ubj(3) - lbj(3)));
castor =castor*pi/180; %atan( (ubj(1)-lbj(1))/(ubj(3) - lbj(3)) );
rate = zeros(1,2*a+1);
cambera = zeros(1,2*a+1);
for i = 1:a
    cambera(a+i+1) = cambera(a+i) + (tan(castor)*cos(d(i+a)) + tan(SAI)*sin(d(i+a)))*(pi/(4*301))/(tan(cambera(i+a))*(tan(castor)*sin(d(i+a))-tan(SAI)*cos(d(i+a)))+1);
    rate(a+i+1) = (tan(castor)*cos(d(i+a)) + tan(SAI)*sin(d(i+a)))/(tan(cambera(i+a))*(tan(castor)*sin(d(i+a))-tan(SAI)*cos(d(i+a)))+1);
end
for i = a:-1:2
    cambera(i-1)=cambera(i) + (tan(castor)*cos(d(i)) + tan(SAI)*sin(d(i)))*(-pi/(4*301))/(tan(cambera(i))*(tan(castor)*sin(d(i))-tan(SAI)*cos(d(i)))+1);
    rate(i-1)=-(tan(castor)*cos(d(i)) + tan(SAI)*sin(d(i)))/(tan(cambera(i))*(tan(castor)*sin(d(i))-tan(SAI)*cos(d(i)))+1);
end
 plot(d*180/pi , cambera*180/pi,'.');
title('Camber vs steering angle')
hold on

% figure,plot(d*180/pi , rate*180/pi,'.');
% title('Camber change rate vs steering angle')   

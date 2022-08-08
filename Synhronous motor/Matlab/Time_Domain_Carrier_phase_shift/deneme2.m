CPS=0
theta_f1=0:0.01:2*pi;
m=1;
D1=(1+m*sin(theta_f1)+(0/6)*sawtooth(3*theta_f1+pi/2,1/2))/2;
% S1=(2/pi)*sin(pi*D1)*cos(theta_c);
S1=(2/pi)*sin(pi*D1);
theta_f2=theta_f1-2*pi/3;
D2=(1+m*sin(theta_f2)+(0/6)*sawtooth(3*theta_f2+pi/2,1/2))/2;
S2=(2/pi)*sin(pi*D2);

figure();
plot(theta_f1*180/pi,S1,'r')
hold on;
plot(theta_f1*180/pi,S2,'b')
hold on;
plot(theta_f1*180/pi,abs(S1-S2),'k')

%%
y=(S1.^2+S2.^2-0.44^2)./(2.*S1.*S2);
y(y>1)=1;
y(y<-1)=-1;
CPS=acos(y);
% CPS=mod(CPS,2*pi);
%%
figure();
plot(theta_f1*180/pi,CPS*180/pi)
%%
figure();
plot(theta_f1*180/pi,sqrt(S1.^2+S2.^2-2*S1.*S2.*cos(CPS)),'k')


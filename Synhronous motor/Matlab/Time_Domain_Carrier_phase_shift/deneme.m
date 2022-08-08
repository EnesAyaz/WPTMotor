CPS=0
theta_f1=0:0.01:2*pi;
dead_time=0.02;
m=0.9;
n=0;
D1=(1+m*sin(theta_f1)+(n/6)*sawtooth(3*theta_f1+pi/2,1/2))/2;
D1(D1<dead_time)=dead_time;
D1(D1>(1-dead_time))=1-dead_time;
% S1=(2/pi)*sin(pi*D1)*cos(theta_c);
S1=(2/pi)*sin(pi*(D1));
theta_f2=theta_f1-2*pi/3;
D2=(1+m*sin(theta_f2)+(n/6)*sawtooth(3*theta_f2+pi/2,1/2))/2;
D2(D2<dead_time)=dead_time;
D2(D2>(1-dead_time))=1-dead_time;
D2=(1+m*sin(theta_f2)+(n/6)*sawtooth(3*theta_f2+pi/2,1/2))/2;
S2=(2/pi)*sin(pi*(D2));

% figure();
% plot(theta_f1*180/pi,S1,'r')
% hold on;
% plot(theta_f1*180/pi,S2,'b')
% hold on;
plot(theta_f1*180/pi,abs(S1-S2),'k')
hold on;
plot(theta_f1*180/pi,abs(S1+S2),'k')
patch([theta_f1*180/pi fliplr(theta_f1*180/pi)], [abs(S1-S2) fliplr(abs(S1+S2))], 'm')
%%
lim_y=0.44;
lim_y=0.44;
y=(S1.^2+S2.^2-lim_y^2)./(2.*S1.*S2);
y(y>1)=1;
y(y<-1)=-1;
CPS=acos(y);
% CPS=mod(CPS,2*pi);
%%
figure();
plot(theta_f1*180/pi,CPS*180/pi)
%%
S_updated=sqrt(S1.^2+S2.^2-2*S1.*S2.*cos(CPS));
figure();
plot(theta_f1*180/pi,S_updated,'k');
hold on;
ylim([0 0.6])
mean(S_updated)

% theta_f1
% 
% a0=(1/pi)*integral(S_updated,theta_f1,-pi,pi) 
% n=1;
% a1=(1/pi)*integral(S_updated*cos(n*theta_f1),theta_f1,-pi,pi) 
% b1=(1/pi)*integral(S_updated*sin(n*theta_f1),theta_f1,-pi,pi)    
 




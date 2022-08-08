figure1=figure(1);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% figure2=figure(2);
% hold on;
% axes2 = axes('Parent',figure2);
% hold(axes2,'on');
mx="0";
m=1;

theta_f1=0:0.01:2*pi;
dead_time=0.0;
% m=0;
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

theta_f3=theta_f1+2*pi/3;
D3=(1+m*sin(theta_f3)+(n/6)*sawtooth(3*theta_f3+pi/2,1/2))/2;
D3(D3<dead_time)=dead_time;
D3(D3>(1-dead_time))=1-dead_time;
D3=(1+m*sin(theta_f3)+(n/6)*sawtooth(3*theta_f3+pi/2,1/2))/2;
S3=(2/pi)*sin(pi*(D3));

% figure();
% plot(theta_f1*180/pi,S1,'r')
% hold on;
% plot(theta_f1*180/pi,S2,'b')
% hold on;
% plot(theta_f1*180/pi,S3,'b')
% hold on;
% plot(theta_f1*180/pi,abs(S1-S2),'k')
% hold on;
% plot(theta_f1*180/pi,abs(S3-S2),'k')


lim_y=0.45;
y=(S1.^2+4*S2.^2-lim_y^2)./(4.*S1.*S2);
y(y>1)=1;
y(y<-1)=-1;
CPS1=acos(y);
% CPS=mod(CPS,2*pi);
S_updated=sqrt(S1.^2+S2.^2-2*S1.*S2.*cos(CPS1));

alpha=atan(S2.*sin(CPS1)./(S1+S2.*cos(CPS1)));


% lim_y=0.35;
y=(S3.^2+S_updated.^2-lim_y^2)./(2.*S3.*S_updated);
y(y>1)=1;
y(y<-1)=-1;
CPS2=acos(y);

CPS2_real= CPS2-alpha;
S_updated_2=sqrt(S3.^2+S2.^2-2*S3.*S2.*cos(CPS2_real));

S_updated_real=sqrt(S3.^2+S_updated.^2-2*S3.*S_updated.*cos(CPS2));

figure(1);
plot(theta_f1*180/pi,CPS1*180/pi,'r')
hold on;

hold on;
plot(theta_f1*180/pi,CPS2*180/pi,'b')
hold on;
plot(theta_f1*180/pi,CPS2_real*180/pi,'k')
hold on;

figure(2);
% plot(theta_f1*180/pi,S_updated,'r')
% hold on;
% plot(theta_f1*180/pi,S_updated_2,'b')
% hold on;
plot(theta_f1*180/pi,S_updated_real,'k')
hold on;



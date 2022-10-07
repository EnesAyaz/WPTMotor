CPS=0
theta_f1=0:0.01:2*pi;
dead_time=0.02;
m=0.6;
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
plot(theta_f1*180/pi,abs(S1-S2),'k')
hold on;
plot(theta_f1*180/pi,abs(S1+S2),'k')
patch([theta_f1*180/pi fliplr(theta_f1*180/pi)], [abs(S1-S2) fliplr(abs(S1+S2))], 'm')
%%
% lim_y=0.43;
lim_y=0.44;
y=(S1.^2+S2.^2-lim_y^2)./(2.*S1.*S2);
% y=(S3.^2+S2.^2-lim_y^2)./(2.*S3.*S2);
y(y>1)=1;
y(y<-1)=-1;
CPS=acos(y);
% CPS=mod(CPS,2*pi);
%%
figure();
plot(theta_f1*180/pi,CPS*180/pi)
%%
S_updated=sqrt(S1.^2+S2.^2-2*S1.*S2.*cos(pi-CPS));
% S_updated=sqrt(S3.^2+S2.^2-2*S3.*S2.*cos(CPS));
figure();
plot(theta_f1*180/pi,S_updated,'k');
hold on;
% ylim([0 0.6])
mean(S_updated)

% theta_f1
% 
% a0=(1/pi)*integral(S_updated,theta_f1,-pi,pi) 
% n=1;
% a1=(1/pi)*integral(S_updated*cos(n*theta_f1),theta_f1,-pi,pi) 
% b1=(1/pi)*integral(S_updated*sin(n*theta_f1),theta_f1,-pi,pi)    
 
%%
figure1=figure('Position',[0 0 800 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

yyaxis right 

plot(theta_f1*180/pi,CPS*180/pi,'b')
ylim([0 180])

set(axes1,'YTick',[0 60 120 180], ...
    'YTickLabel',{'0','60','120','180'}, ...
    'FontName','TimesNewRoman','FontSize',14,'YColor',[0 0 1], ...
     'FontName','TimesNewRoman','FontSize',14);
 
 
ylabel({'$\phi_A$-$\phi_B$ ($^o$)'},'interpreter','latex','FontName','Times New Roman',...
    'FontSize',18);

 

yyaxis left

plot(theta_f1*180/pi,S_updated,'r');
ylim([0 0.5])

xlim([0 360])

set(axes1,'XTick',[0 120 240 359], ...
    'XTickLabel',{'0','120','240','360'}, ...
    'YTick',[0 0.1 0.2 0.3 0.4 0.5], ...
    'YTickLabel',{'0','0.1','0.2','0.3','0.4','0.5'},'YColor',[1 0 0], ...
    'FontName','TimesNewRoman','FontSize',14);


ylabel({'$\hat {S_{AB}}_{f_s}$'},'interpreter','latex','FontName','Times New Roman',...
    'FontSize',18);

% Create xlabel
xlabel('Fundamental Phase ($^o$)','interpreter','latex','FontName','Times New Roman',...
    'FontSize',15);


figure1=figure(1);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% figure2=figure(2);
% hold on;
% axes2 = axes('Parent',figure2);
% hold(axes2,'on');
mx="0";
for m=0:0.8:1
CPS=0
theta_f1=0:0.01:2*pi;
dead_time=0.02;
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


lim_y=0.43;
y=(S1.^2+S2.^2-lim_y^2)./(2.*S1.*S2);
y(y>1)=1;
y(y<-1)=-1;
CPS1=acos(y);
% CPS=mod(CPS,2*pi);
S_updated=sqrt(S1.^2+S2.^2-2*S1.*S2.*cos(CPS1));

alpha=atan(S2.*sin(CPS1)./(S1+S2.*cos(CPS1)));


lim_y=0.43;
lim_y=0.43;
y=(S3.^2+S_updated.^2-lim_y^2)./(2.*S3.*S_updated);
y(y>1)=1;
y(y<-1)=-1;
CPS2=acos(y);

CPS2_real= CPS2-alpha;

figure(1);
plot(theta_f1*180/pi,CPS1*180/pi)
hold on;

% figure(2);
% plot(theta_f1*180/pi,S_updated)
% hold on;

% hold on;
% plot(theta_f1*180/pi,CPS2*180/pi,'b')
% hold on;
% plot(theta_f1*180/pi,CPS2_real*180/pi,'k')
% hold on;
mx=[mx, strcat("ma=",string(m))];

end

mx=mx(2:end);

box(axes1,'on');
hold(axes1,'off');
% grid on;
% Set the remaining axes properties
% set(axes1,'XTick',0:60:360,'XTickLabel',{'0','\pi/3','2\pi/3','\pi','4\pi/3','5\pi/3','2\pi'}, ...
%     'FontName','TimesNewRoman','FontSize',16);
set(axes1,'XTick',0:60:360, ...
    'FontName','TimesNewRoman','FontSize',14);
set(axes1,'YTick',0:45:180,'YTickLabel',{'0','45','90','135','180'}, ...
    'FontName','TimesNewRoman','FontSize',14);
set(axes1,'defaultAxesTickLabelInterpreter','latex'); 
ylim([-20 200])
xlim([0 360])

legend1 = legend(axes1,'show',mx,'FontName','TimesNewRoman','FontSize',10);
set(legend1,...
    'Location','Best',...
    'EdgeColor','none',...
    'Color','white');
ylabel('Carrier Phase Shift ($^o$)','FontName','TimesNewRoman','FontSize',20)
xlabel('Phase of Reference-A ($^o$)','FontName','TimesNewRoman','FontSize',16)

% box(axes2,'on');
% hold(axes2,'off');
% % grid on;
% % Set the remaining axes properties
% % set(axes1,'XTick',0:60:360,'XTickLabel',{'0','\pi/3','2\pi/3','\pi','4\pi/3','5\pi/3','2\pi'}, ...
% %     'FontName','TimesNewRoman','FontSize',16);
% set(axes2,'XTick',0:60:360, ...
%     'FontName','TimesNewRoman','FontSize',14);
% set(axes2,'YTick',0:0.2:1, ...
%     'FontName','TimesNewRoman','FontSize',14);
% set(axes2,'defaultAxesTickLabelInterpreter','latex'); 
% ylim([-20 200])
% xlim([0 360])
% 
% legend2 = legend(axes2,'show',mx,'FontName','TimesNewRoman','FontSize',10);
% set(legend2,...
%     'Location','Best',...
%     'EdgeColor','none',...
%     'Color','white');
% ylabel('The magnitude of the Switching Frequency','FontName','TimesNewRoman','FontSize',20)
% xlabel('Phase of Reference-A ($^o$)','FontName','TimesNewRoman','FontSize',16)


%%
S_updated=sqrt(S1.^2+S2.^2-2*S1.*S2.*cos(CPS1));
figure();
plot(theta_f1*180/pi,S_updated,'r');
hold on;
S_updated2=sqrt(S3.^2+S2.^2-2*S3.*S2.*cos(CPS2_real));
plot(theta_f1*180/pi,S_updated2,'b');
hold on;

S_updated_real=sqrt(S3.^2+S_updated.^2-2*S3.*S_updated.*cos(CPS2));
plot(theta_f1*180/pi,S_updated_real,'k');
hold on;
ylim([0 1])
mean(S_updated_real)

% theta_f1
% 
% a0=(1/pi)*integral(S_updated,theta_f1,-pi,pi) 
% n=1;
% a1=(1/pi)*integral(S_updated*cos(n*theta_f1),theta_f1,-pi,pi) 
% b1=(1/pi)*integral(S_updated*sin(n*theta_f1),theta_f1,-pi,pi)    
 




   




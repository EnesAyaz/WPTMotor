%%
Vdc=100;
m=1; % carrier
n=2; % fundamental
ma=0:0.1:1;
mag_fsw=2*m*besselj(0,ma*pi/2)/pi;
mag_side=abs(2.*besselj(n,m*ma*pi/2)/(m*pi));
% mag_side=2.*besselj(n,m*ma*pi/2)/(m*pi);
mag_fund=sqrt(3).*ma/2;
mag_fsw_carrier=[];
mag_side1_carrier=[];
mag_fund_carrier=[];
mag_side2_carrier=[];
theta_carrier=[];
for theta=0:1:360
    theta_carrier=[theta_carrier,theta];
    mag_fund_carrier=[ mag_fund_carrier ;mag_fund];
    mag_fsw_carrier= [mag_fsw_carrier ; mag_fsw*sqrt(2)*sqrt(1-cosd(theta))];
    mag_side1_carrier= [mag_side1_carrier ; mag_side*sqrt(2)*sqrt(1-cosd(theta-120))] ;
    mag_side2_carrier= [mag_side2_carrier ; mag_side*sqrt(2)*sqrt(1-cosd(theta+120))] ;
end

[X,Y] = meshgrid(ma,theta_carrier);
mag= sqrt(mag_fsw_carrier.^2+mag_side1_carrier.^2+mag_side2_carrier.^2);
%%
figure1=figure();
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% [c1,h1]=contourf(X,Y,mag_fsw_carrier/sqrt(2),'LevelStep',0.1);
% [c1,h1]=contourf(X,Y,mag_fund_carrier/sqrt(2),'LevelStep',0.1);
% [c1,h1]=contourf(X,Y,mag_side1_carrier/sqrt(2),'LevelStep',0.1);
% [c1,h1]=contourf(X,Y,mag_side2_carrier/sqrt(2),'LevelStep',0.1);
[c1,h1]=contourf(X,Y,mag/sqrt(2),'LevelStep',0.1);
clabel(c1,h1);
colormap()
caxis([0 1])
ylabel('Carrier Phase ($^o$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
xlabel('Modulation Index ($ma$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
% title('Voltage for ($f_s$)' ...
%     ,'interpreter','Latex','FontName', ...
%     'Times New Roman','FontSize',15)


box(axes1,'on');
axis(axes1,'tight');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'BoxStyle','full','Colormap',...
    [0.55 0.55 0.55;0.60 0.60 0.6;0.65 0.65 0.65; 0.70 0.70 0.70; 0.75 0.75 0.75; 0.80 0.80 0.80 ;
    0.85 0.85 0.85; 0.90 0.90 0.90; 0.95 0.95 0.95 ;1 1 1],...
    'Layer','top','YTick',[0 60 120 180 240 300 359],'YTickLabel',...
    {'0','60','120','180','240','300','360'});
% Create colorbar
colorbar(axes1,'Ticks',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1],...
    'TickLabels',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});

%%
a=size(mag);

carrier_phase1=[];
val=0.334;

for j=1:a(2)

x=mag(:,j)/sqrt(2);
% plot(x)



for i=1:length(x)
if abs((x(i)-val))<0.01
    x(i)=1;
else 
    x(i)=0;
end

end

% plot(x)
indx1=find(x==1);
carrier_phase1=[carrier_phase1, indx1(1)];
end
%%
% A_DC=[0.3  0.3 0.3]
A_Low1=[0 0 1.2  2.88 5.25 8.2 11.9 16.26 20.94 24.6 26.1]
A_Low2=[0 0 0 0 1 2.45 4.8 8.1 12.8 19.3 27.8]

i=4;
f=500;
w_fsw=2*pi*f;
w_fl=2*pi*(f-100);
w_fh=2*pi*(f+100);
theta=0:0.1:2*pi;
Ts=1e-5;
time=0:Ts:0.0200;
ma1=ma(i);
CPS=carrier_phase1(i)*pi/180;
m=1; % carrier
n=2; % fundamental
mag_fsw=2*m*besselj(0,ma1*pi/2)/pi;
mag_side=abs(2.*besselj(n,m*ma1*pi/2)/(m*pi));

A_fsw= mag_fsw*sin(w_fsw*time);
B_fsw=mag_fsw*sin(w_fsw*time-CPS);


A_fl= mag_side*sin(w_fl*time);
B_fl=mag_side*sin(w_fl*time-2*pi/3-CPS);

A_fh= mag_side*sin(w_fh*time);
B_fh=mag_side*sin(w_fh*time+2*pi/3-CPS);
   
   
% 
% plot(time,A_fsw)
% hold on;
% plot(time,B_fsw)
% hold on;
% plot(time,A_fl)
% hold on;
% plot(time,B_fl)
% hold on;
% plot(time,A_fh)
% hold on;
% plot(time,B_fh)
% hold on;


rectified=abs(A_fsw-B_fsw+A_fl-B_fl+A_fh-B_fh);

% figure();
% plot(time,rectified);
% mean(rectified)


Y = fft(rectified);
L=length(Y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
Fs=1/Ts;
f = Fs*(0:(L/2))/L;

P1=P1/0.3;

P1(P1<0.01)=0;
f2=[];
P2=[];

for i=1:length(P1)
   if (P1(i)~=0)
       P2=[P2 P1(i)];
       f2=[f2 f(i)];
   end
       
end

stem(f2,100*P2) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 2000])

%%

% A_High=[0.2 0.2]

%%
A_Low1=[0 0 1.2  2.88 5.25 8.2 11.9 16.26 20.94 24.6 26.1];
A_Low2=[0 0 0 0 1 2.45 4.8 8.1 12.8 19.3 27.8];

figure1 = figure('Position', [0 0 800 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');


plot(ma,A_Low1,'LineWidth',1,'Color',[0.5 0 0],'LineStyle','-','Marker','x', 'MarkerSize',15, ...
    'MarkerEdgeColor',[0.5 0 0],'MarkerFaceColor',[0.5 0 0] );



plot(ma,A_Low2,'LineWidth',1,'Color',[0 0 0.5],'LineStyle','-','Marker','x', 'MarkerSize',15, ...
    'MarkerEdgeColor',[0 0 0.5],'MarkerFaceColor',[0 0 0.5] );

ylim(axes1,[0 100]);



box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',15,'GridColor',[0 0 0],'GridAlpha',0.5,'GridLineStyle','--');

xlabel('Modulation Index','FontName','Times New Roman','FontSize',18);
ylabel({'Normalized Current ','Harmonic Distribution (%)'},'FontName','Times New Roman','FontSize',18);
legend({'Double-fundamental frequency','Quad-fundamental frequency'},'Interpreter','Latex', 'FontName',...
    'Times New Roman', 'FontSize',15)




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
[c1,h1]=contourf(X,Y,mag/sqrt(2),'LevelStep',0.01);
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
val=0.29;

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
carrier_phase1=[carrier_phase1, indx1(1)]
end
%%
% A_DC=[0.3  0.3 0.3]
A_Low1=[0 0 1.2  2.88 5.25 8.2 11.9 16.26 20.94 24.6 26.1];
A_Low2=[0 0 0 0 1 2.45 4.8 8.1 12.8 19.3 27.8];
H_fsw =[0.477 0.47];
H_fh =[0 0];
H_fh =[0 0];

i=11;
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
B_fl=mag_side*sin(w_fl*time+2*pi/3-CPS);

A_fh= mag_side*sin(w_fh*time);
B_fh=mag_side*sin(w_fh*time-2*pi/3-CPS);
   
%%
mag_side
mag_fsw
carrier_phase1
%%
% plot(time,A_fsw-B_fsw)
% hold on;
% plot(time,A_fl-B_fl)
% hold on;
% plot(time,A_fh-B_fh)
% hold on;

x=[max(A_fsw-B_fsw) max(A_fl-B_fl) max(A_fh-B_fh)]
% x1=[];
x1=[x1;x];

%%
H=[ 0.4770         0         0; ...
    0.4740    0.0039    0.0024; ...
    0.4752    0.0154    0.0095; ...
    0.4702    0.0344    0.0209; ...
    0.4680    0.0605    0.0357; ...
    0.4583    0.0929    0.0535; ...
    0.4409    0.1309    0.0734; ...
    0.4232    0.1736    0.0934; ...
    0.3966    0.2198    0.1132; ...
    0.3507    0.2683    0.1362; ...
    0.2914    0.3179    0.1637; ]


mag_fsw=2*m*besselj(0,ma*pi/2)/pi;
mag_side=abs(2.*besselj(n,m*ma*pi/2)/(m*pi));

mag= sqrt(H(:,1).*H(:,1)+ H(:,2).*H(:,2)+H(:,3).*H(:,3));
mag=0.334*ones(size(mag_side));
%%
figure1 = figure('Position', [0 0 800 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(ma,mag,'LineWidth',1,'Color',[0.5 0 0],'LineStyle','-','Marker','x', 'MarkerSize',15, ...
    'MarkerEdgeColor',[0.5 0 0],'MarkerFaceColor',[0.5 0 0] );

% plot(ma,H(:,1),'LineWidth',1,'Color',[0 0.5 0],'LineStyle','-','Marker','x', 'MarkerSize',15, ...
%     'MarkerEdgeColor',[0 0.5 0],'MarkerFaceColor',[0 0.5 0] );

plot(ma,2*mag_side*sqrt(3)/sqrt(2),'LineWidth',1,'Color',[0 0 0.5],'LineStyle','-','Marker','x', 'MarkerSize',15, ...
    'MarkerEdgeColor',[0 0 0.5],'MarkerFaceColor',[0 0 0.5] );

hold on;

% plot(ma,mag_side*sqrt(3),'LineWidth',1,'Color',[0 0.5 0],'LineStyle','--','Marker','o', 'MarkerSize',10, ...
%     'MarkerEdgeColor',[0 0.5 0],'MarkerFaceColor','none' );

% plot(ma,mag_side*sqrt(3),'LineWidth',1,'Color',[0 0 0.5],'LineStyle','--','Marker','o', 'MarkerSize',12, ...
%     'MarkerEdgeColor',[0 0 0.5],'MarkerFaceColor','none' );


ylim(axes1,[0 1]);

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',15,'GridColor',[0 0 0],'GridAlpha',0.5,'GridLineStyle','--');

xlabel('$m_a$','Interpreter','Latex', 'FontName','Times New Roman', 'FontSize',25)
ylabel('$\frac{V_{l-n}}{V_{DC}}$', ...
    'Interpreter','Latex', 'FontName','Times New Roman', 'FontSize',30)
legend({'With Carrier Phase Shift','Without Carrier Phase Shift'},'Interpreter','Latex', 'FontName',...
    'Times New Roman', 'FontSize',15)


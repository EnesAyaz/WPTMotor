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
val=0.295;

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
Vout=2*[7.52 7.67 7.54 7.56 7.68 7.56 7.67 7.71 7.8 7.86 7.93];

figure1 = figure('Position', [0 0 800 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
yyaxis(axes1,'left');
set(axes1,'YColor',[0.5 0 0]);
plot(ma,carrier_phase1,'LineWidth',1,'Color',[0.5 0 0],'LineStyle','-','Marker','x', 'MarkerSize',15, ...
    'MarkerEdgeColor',[0.5 0 0],'MarkerFaceColor',[0.5 0 0] );
ylabel('Carrier Phase Shift (^o)','FontName','Times New Roman','FontSize',18);
ylim(axes1,[0 100]);

yyaxis(axes1,'right');
set(axes1,'YColor',[0 0 0.5],'YTick',[0 4 8 12 16 20]);
plot(ma,Vout,'LineWidth',1,'Color',[0 0 0.5],'LineStyle','-','Marker','x', 'MarkerSize',15, ...
    'MarkerEdgeColor',[0 0 0.5],'MarkerFaceColor',[0 0 0.5] );
ylabel('Output Voltage (V)','FontName','Times New Roman','FontSize',18);
ylim(axes1,[0 20]);


yline(15,'Color',[0 0.5 0],'LineWidth',1.5,'LineStyle','-')

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',15,'GridColor',[0 0 0],'GridAlpha',0.5,'GridLineStyle','--');

xlabel('Modulation Index','FontName','Times New Roman','FontSize',18);

% Create textarrow
annotation(figure1,'textarrow',[0.8725 0.8725],[0.83 0.76],...
    'Color',[0 0.5 0],...
    'TextColor',[0 0.5 0],...
    'String',{'15V'},...
    'FontSize',15,...
    'FontName','Times New Roman');

%%
Frequency=[85 86 85.5 85.25 86 85.5 87 88 89 90 90.75];
figure1 = figure('Position', [0 0 800 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(ma,Frequency,'LineWidth',1,'Color',[0 0 0],'LineStyle','-','Marker','x', 'MarkerSize',15, ...
    'MarkerEdgeColor',[0 0 0],'MarkerFaceColor',[0 0 0] );
ylabel('Frequency (kHz)','FontName','Times New Roman','FontSize',18);
ylim(axes1,[65 100]);

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',15,'GridColor',[0 0 0],'GridAlpha',0.2,'GridLineStyle','--', ...
    'YTick',[65 70 75 80 85 90 95 100 ]);

xlabel('Modulation Index','FontName','Times New Roman','FontSize',18);





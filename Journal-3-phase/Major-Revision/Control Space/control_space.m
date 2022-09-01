%%
Vdc=100;
m=1; % carrier
n=2; % fundamental
ma=0:0.01:1;
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
val=0.285;

for j=1:a(2)

x=mag(:,j)/sqrt(2);
plot(x)



for i=1:length(x)
if abs((x(i)-val))<0.01
    x(i)=1;
else 
    x(i)=0;
end

end

plot(x)
indx1=find(x==1)
carrier_phase1=[carrier_phase1, indx1(1)];
end

plot(ma,carrier_phase1)
%%

a=size(mag);

carrier_phase2=[];
val=0.45;

for j=1:a(2)

x=mag(:,j)/sqrt(2);
plot(x)



for i=1:length(x)
if abs((x(i)-val))<0.01
    x(i)=1;
else 
    x(i)=0;
end

end

plot(x)
indx1=find(x==1)
carrier_phase2=[carrier_phase2, indx1(1)];
end

plot(carrier_phase2)


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


hold on;
plot(ma,carrier_phase1,'r','LineWidth',2)
plot(ma,carrier_phase2,'r','LineWidth',2)
patch([ma fliplr(ma)], [carrier_phase1 fliplr(carrier_phase2)], 'r','FaceAlpha',0.1)



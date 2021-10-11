%%
Vdc=48;
m=1; % carrier
n=2; % fundamental
ma=0:0.01:1;
mag_fsw=2*m*besselj(0,ma*pi/2)/pi;
mag_side=abs(2.*besselj(n,m*ma*pi/2)/(m*pi));
mag_fsw_carrier=[];
mag_side1_carrier=[];
mag_side2_carrier=[];
theta_carrier=[];
for theta=0:1:180
    theta_carrier=[theta_carrier,theta];
    mag_fsw_carrier= [mag_fsw_carrier ; mag_fsw*sqrt(2)*sqrt(1-cosd(theta))];
    mag_side1_carrier= [mag_side1_carrier ; mag_side*sqrt(2)*sqrt(1-cosd(theta-120))] ;
    mag_side2_carrier= [mag_side2_carrier ; mag_side*sqrt(2)*sqrt(1-cosd(theta+120))] ;
end

[X,Y] = meshgrid(ma,theta_carrier);
mag= sqrt(mag_fsw_carrier.^2+mag_side1_carrier.^2+mag_side2_carrier.^2);

%%
figure();
contourf(X,Y,Vdc*mag_fsw_carrier/sqrt(2),'LevelStep',10)
colormap(jet)
h=colorbar();
set(h,'Ticks',[0:10:300])
ylabel('Carrier Phase ($^o$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
xlabel('Modulation Index (ma)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
title('Voltage for ($f_s$)' ...
    ,'interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)

%%

figure();
contourf(X,Y,Vdc*mag_side1_carrier/sqrt(2))
colormap(jet)
h=colorbar();
set(h,'Ticks',[0:10:300])
ylabel('Carrier Phase ($^o$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
xlabel('Modulation Index (ma)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
title('Voltage for ($f_s-2f_o$)' ...
    ,'interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)

%% 
figure();
contourf(X,Y,Vdc*mag_side2_carrier/sqrt(2))
colormap(jet)
h=colorbar();
set(h,'Ticks',[0:10:300])
ylabel('Carrier Phase ($^o$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
xlabel('Modulation Index (ma)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
title('Voltage for ($f_s-2f_o$)' ...
    ,'interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
%%
figure();
contourf(X,Y,Vdc*mag/sqrt(2),'LevelStep',2)
colormap(jet)
h=colorbar();
set(h,'Ticks',[0:5:100])
ylabel('Carrier Phase ($^o$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
xlabel('Modulation Index (ma)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
title({'A Equivalent Single Frequency  Voltage for','($f_s$) and ($f_s\pm2f_o$)'} ...
    ,'interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
%%
for N=35:1:45
 plot(ma,mag(N,:)*200/sqrt(2))
 hold on
 
end
N=35:1:45;
str = string(N);
legend(str)
xlabel('modulation index( $m_a$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
ylabel('Voltage( $V_{rms}$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
title('Voltage for various carrier phases')
%%
plot(ma,a1)
hold on;

% a=2*besselj(0,1*ma*pi/2)/pi;
% figure();

a=abs(2.*besselj(n,m*ma*pi/2)/(m*pi));
plot(ma,abs(a))
hold on;

%%
plot(ma,100*mag_fsw_carrier(41,:)/sqrt(2));
hold on; 
plot(ma,100*mag_side1_carrier(41,:)/sqrt(2));
hold on;
plot(ma,100*mag_side2_carrier(41,:)/sqrt(2));
hold on;
plot(ma,100*ma/2*sqrt(3));

legend('$f_s$','$f_s-2fo$','$f_s+2f_o$','$f_o$','interpreter','Latex','location','best')
ylabel('Voltage(V)','interpreter','Latex','FontSize',15)
xlabel('modulation index (ma)','interpreter','Latex','FontSize',15)



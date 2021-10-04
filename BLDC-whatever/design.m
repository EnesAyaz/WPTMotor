clear all;
clc; 
% The code is used for 1p-1s design series-series WPT
% Input and power, Output power and load, Quality factor of seconder side
%% FILL INFORMATION BELOW
Vin=15; %V  (rms) 
P_o=15; %W   
Qs=2; % unitless
f=100e3; %Hz
w=2*pi*f; %rad/sec
k=0.80; % chosen coupling factor
Vout=12; %V (rms)
kc= (1/Qs)*sqrt(1-1/(4*Qs^2));
R_L=(Vout^2)/P_o; %% single module R_L
Ip_rms= P_o/Vin; % primary current assuming eff=1
Is_rms=(P_o/Vout);
M=Is_rms*R_L/(w*Ip_rms); %calculated mutual inductance 
Ls=Qs*R_L/w;    % secondary coil inductance
Lp=M^2/(k^2*Ls);  %primary inductance
Cp=1/(w^2*Lp);  %primary compansation
Cs=1/(w^2*Ls);  %secondary compansation

%%
rp=0.03; % ohm
rs= 0.03; % ohm 
Lp_p=Lp-M; % Henry as actually Lp-m Lp is 120u
Ls_p=Ls-M; % Henry as actually Ls-m Ls is 120u
f=logspace(4.6,5.4,200);
w=2*pi*f;
% R_L=2
%%
Z1= 1i.*w*Ls_p +R_L- 1i./(w*Cs);
Z1= 1i.*w*Ls_p +R_L;
Z2=1i.*w*M;
Z3= 1i.*w*Lp_p+rp+rs-1i./(w*Cp);
Z12= ((Z1.*Z2)./(Z1+Z2));
Z123=Z12+Z3;
%%
V1= (Z12./Z123)*Vin; 
V_load= (R_L./(1i*w*Ls_p+R_L-1i./(w*Cs))).*V1;
Vo_angle= angle(V_load)*180/pi;
Vo_mag= abs(V_load);
Iin=Vin./Z123;
Iin_angle= angle(Iin)*180/pi;
Iin_mag= abs(Iin);
%%
% hold on;
% plot(f,Iin_angle,'Linewidth',2);
% xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
% set(gca, 'XScale', 'log')
% grid on;
% set(gca,'FontSize',10);
%%
% figure;
hold on;
yyaxis left
plot(f,Vo_mag,'Linewidth',2);
hold on; 
yyaxis right
plot(f,Iin_angle,'Linewidth',2);
xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
set(gca, 'XScale', 'log')
grid on;
set(gca,'FontSize',10);

%%
% figure;
% hold on;
% yyaxis left
% plot(f,Vo_mag/R_L,'Linewidth',2);
% hold on; 
% yyaxis right
% plot(f,Iin_mag,'Linewidth',2);
% xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
% set(gca, 'XScale', 'log')
% grid on;
% set(gca,'FontSize',10);
% %%
% 
% Vcp=Iin./(1i*w*Cp);
% figure;
% hold on;
% plot(f,abs(Vcp),'Linewidth',2);
% hold on; 
% xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
% set(gca, 'XScale', 'log')
% grid on;
% set(gca,'FontSize',10);
% 
% 
Lp*1e6
Ls*1e6
M*1e6
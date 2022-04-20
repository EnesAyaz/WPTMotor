clear all;
clc; 
% The code is used for 1p-1s design series-series WPT
% Input and power, Output power and load, Quality factor of seconder side
% The design is made for constant voltage point
%% FILL INFORMATION BELOW
Vdc=400; % V (dc)
G_inv=0.45;
Vin=G_inv*Vdc; %V  (rms) 
P_o=225; %W   
Qs=2; % unitless
fh=50e3; %Hz
% f=80e3; %Hz
k=0.6; % chosen coupling factor
% k=0.25; % chosen coupling factor
kc= (1/Qs)*sqrt(1-1/(4*Qs^2));
wh=2*pi*fh; %rad/sec
% Calculation Series-compensated paralel DC BUS
R_L= 0.81; %% single module R_L
Vout=13.5; %V (rms)

Ip_rms= P_o/Vin; % primary current assuming eff=1
Is_rms=(P_o/Vout);
Ls=Qs*R_L/wh;    % secondary coil inductance
G=Vout/Vin;
Lp=Ls/(G^2);
M=k*sqrt(Lp*Ls);
w= wh*sqrt(1-k);
Cp=1/(w^2*Lp);  %primary compansation
Cs=1/(w^2*Ls);  %secondary compansation
%% Load changes
%% Analytical model 

%
%   
%    |-- rp----Cp----Lp'(Lp-M)---|---Ls'(Ls-M)--Cs-|
%    |                           |                 |      
%    |                           |                 |
% --|V_in|--                  --Lm--            --RLoad--
%    |                           |                 | 
%    |                           |                 |
%    |---------------------------|-------rs--------|
%
%
%  Create T-model of coupled inductor at steady state
%  Sinosoidal response 
% at above circuit is represented and parameter name
% is given. I give a name Lp' as Lp_p and Ls' as Ls_p. 

%%
rp=0.03; % ohm
rs= 0.03; % ohm 
Lp_p=Lp-M; % Henry as actually Lp-m Lp is 120u
Ls_p=Ls-M; % Henry as actually Ls-m Ls is 120u
f=logspace(4.4,5,200);
wh=2*pi*f;
%%
Z1= 1i.*wh*Ls_p +R_L- 1i./(wh*Cs);
Z2=1i.*wh*M;
Z3= 1i.*wh*Lp_p+rp+rs-1i./(wh*Cp);
Z12= ((Z1.*Z2)./(Z1+Z2));
Z123=Z12+Z3;
%%
V1= (Z12./Z123)*Vin; 
V_load= (R_L./(1i*wh*Ls_p+R_L-1i./(wh*Cs))).*V1;
Vo_angle= angle(V_load)*180/pi;
Vo_mag= abs(V_load);
Iin=Vin./Z123;
Iin_angle= angle(Iin)*180/pi;
Iin_mag= abs(Iin);
%%
figure;
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
figure;
hold on;
yyaxis left
plot(f,Vo_mag/R_L,'Linewidth',2);
hold on; 
yyaxis right
plot(f,Iin_mag,'Linewidth',2);
xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
set(gca, 'XScale', 'log')
grid on;
set(gca,'FontSize',10);
%%

Vcp=Iin./(1i*wh*Cp);
figure;
hold on;
plot(f,abs(Vcp),'Linewidth',2);
hold on; 
xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
set(gca, 'XScale', 'log')
grid on;
set(gca,'FontSize',10);

%%

Lp*1e6
Ls*1e6
Cp*1e6
Cs*1e6
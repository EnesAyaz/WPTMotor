%%  Motor parameters
motor_voltage= 70; % V
motor_frequency= 17; % Hz
phase_current= 10; % A
Field_current= 7; % A;

%%
clc;
k=0.53;
Vdc=100; % V (dc)
G_inv=0.44/sqrt(2);
Vin=G_inv*Vdc; %V  (rms) 
f=65e3; %Hz
w=2*pi*f; %rad/sec
% Calculation Series-compensated paralel DC BUS
R_L= 1.2; %% single module R_L
Vout=7; %V (rms)
I=Vout/R_L
% Vout=200; %V (rms)

Vrx=Vout*2*sqrt(2)/pi; %V (rms)
Rrx=R_L*8/pi/pi;
n=Vin/Vrx;

LpdivideLs=(n/k)^2;
%%
Q=6;
Ls=Q*Rrx/w;
Lp=LpdivideLs*Ls;
Lr=(1-k^2)*Lp;
Cr=1/(w^2*Lr);
M=k*sqrt(Lp*Ls);
%%

Lp=1500e-6;
Ls=8e-6;
M=50e-6;
Cr=5.8e-9;



%% Analytical model 

%
%   
%    |-- rp----Cp----Lp'(Lp-M)---|---Ls'(Ls-M)-----|
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
for k=0.8:0.1:1.2
Lp_p=Lp-M; % Henry as actually Lp-m Lp is 120u
Ls_p=Ls-M; % Henry as actually Ls-m Ls is 120u
R_L=Rrx;
Cp=Cr*k;
f=40e3:0.1e3:80e3;
wh=2*pi*f;
%%
Z1= 1i.*wh*Ls_p +R_L;
Z2=1i.*wh*M;
Z3= 1i.*wh*Lp_p-1i./(wh*Cp);
Z12= ((Z1.*Z2)./(Z1+Z2));
Z123=Z12+Z3;
%%
V1= (Z12./Z123)*Vin; 
V_load= (R_L./(1i*wh*Ls_p+R_L)).*V1;
Vo_angle= angle(V_load)*180/pi;
Vo_mag= abs(V_load);
Iin=Vin./Z123;
Iin_angle= angle(Iin)*180/pi;
Iin_mag= abs(Iin);
%%
plot(f/1e3/60,Vo_mag/max(Vo_mag))

hold on;

end


xlim([0.8 1.2])
ylim([0 1])




%%
for k=0.95:0.02:1.05
Lp_p=Lp-M*k; % Henry as actually Lp-m Lp is 120u
Ls_p=Ls-M*k; % Henry as actually Ls-m Ls is 120u
R_L=Rrx;
Cp=Cr;
f=40e3:0.1e3:80e3;
wh=2*pi*f;
%%
Z1= 1i.*wh*Ls_p +R_L;
Z2=1i.*wh*M;
Z3= 1i.*wh*Lp_p-1i./(wh*Cp);
Z12= ((Z1.*Z2)./(Z1+Z2));
Z123=Z12+Z3;
%%
V1= (Z12./Z123)*Vin; 
V_load= (R_L./(1i*wh*Ls_p+R_L)).*V1;
Vo_angle= angle(V_load)*180/pi;
Vo_mag= abs(V_load);
Iin=Vin./Z123;
Iin_angle= angle(Iin)*180/pi;
Iin_mag= abs(Iin);
%%
plot(f/1e3/60,Vo_mag)

hold on;

end



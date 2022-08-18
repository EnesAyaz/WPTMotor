%%  Motor parameters
motor_voltage= 70; % V
motor_frequency= 17; % Hz
phase_current= 10; % A
Field_current= 7; % A;

%%
clc;
k=0.485;
Vdc=100; % V (dc)
G_inv=0.40;
Vin=G_inv*Vdc; %V  (rms) 
f=60e3; %Hz
w=2*pi*f; %rad/sec
% Calculation Series-compensated paralel DC BUS
R_L= 1.2; %% single module R_L
Vout=6; %V (rms)
% Vout=15; %V (rms)

Vrx=Vout*2*sqrt(2)/pi; %V (rms)
Rrx=R_L*8/pi/pi;
n=Vin/Vrx;

LpdivideLs=(n/k)^2;
Q=2.5;
Ls=Q*Rrx/w;
Lp=LpdivideLs*Ls;
Lr=(1-k^2)*Lp;
Cr=1/(w^2*Lr);
M=k*sqrt(Lp*Ls);
Cr*1e9
[Lp*1e6, Ls*1e6 ,M*1e6]
[Vrx,Rrx,n]
% Lr=(1-k^2)*Lp;
% 
% Cr=1/(w^2*Lr);

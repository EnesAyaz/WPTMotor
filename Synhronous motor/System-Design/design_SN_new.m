%%  Motor parameters
motor_voltage= 70; % V
motor_frequency= 17; % Hz
phase_current= 10; % A
Field_current= 7; % A;

%%
clc;
k=0.49;
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
Q=3.1;
Ls=Q*Rrx/w;
Lp=LpdivideLs*Ls;
Lr=(1-k^2)*Lp;
Cr=1/(w^2*Lr);
M=k*sqrt(Lp*Ls);
Cr*1e9
Lp*1e6
Ls*1e6
M*1e6
% [Lp*1e6, Ls*1e6 ,M*1e6];
% [Vrx,Rrx,n]
% Lr=(1-k^2)*Lp;
% 
% Cr=1/(w^2*Lr);

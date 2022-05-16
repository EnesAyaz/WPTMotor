clc;
k=0.7;
Vdc=300; % V (dc)
G_inv=0.45;
Vin=G_inv*Vdc; %V  (rms) 
f=50e3; %Hz
w=2*pi*f; %rad/sec
% Calculation Series-compensated paralel DC BUS
R_L= 0.81; %% single module R_L
Vout=13.5; %V (rms)

n=Vin/Vout;

LpdivideLs=(n/k)^2;

Q=2.5;
Ls=Q*R_L/w;
Lp=LpdivideLs*Ls;

Lr=(1-k^2)*Lp;

Cr=1/(w^2*Lr);

M=k*sqrt(Lp*Ls);

Lp*1e6
Ls*1e6
Cr*1e9
% M*1e6


% Lr=(1-k^2)*Lp;
% 
% Cr=1/(w^2*Lr);

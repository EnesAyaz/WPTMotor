%%  Motor parameters
motor_voltage= 70; % V
motor_frequency= 17; % Hz
phase_current= 10; % A
Field_current= 7; % A;

%%
for Q=0.5:0.5:2
L=[];
L2=[];
f1=[];
for f=50e3:1e3:100e3
clc;
k=0.7;
Vdc=100; % V (dc)
G_inv=0.45;
Vin=G_inv*Vdc; %V  (rms) 
% f=80e3; %Hz
w=2*pi*f; %rad/sec
% Calculation Series-compensated paralel DC BUS
R_L= 1.2; %% single module R_L
Vout=8.4; %V (rms)
% Vout=15; %V (rms)

Vrx=Vout*2*sqrt(2)/pi; %V (rms)
Rrx=R_L*8/pi/pi;

n=Vin/Vrx;

LpdivideLs=(n/k)^2;
% Q=2.5;
Ls=Q*Rrx/w;
Lp=LpdivideLs*Ls;
Lr=(1-k^2)*Lp;
Cr=1/(w^2*Lr);
M=k*sqrt(Lp*Ls);
Lp*1e6
Ls*1e6
Cr*1e9
M*1e6

L=[L Lp*1e6];
L2=[L2, Ls*1e6];
f1=[f1 f];

end
% Lr=(1-k^2)*Lp;
% 
% Cr=1/(w^2*Lr);
figure(1);
yyaxis left
plot(f1/1e3,L)
hold on;
yyaxis right
plot(f1/1e3,L2)

end

%%
for Q=0.5:0.5:5
L=[];
f1=[];
for f=50e3:1e3:100e3
R_L= 1.2; %% single module R_L
Rrx=R_L*8/pi/pi;
w=2*pi*f;
Ls=Q*Rrx/w;

L=[L Ls*1e6];
f1=[f1 f];

end
% Lr=(1-k^2)*Lp;
% 
% Cr=1/(w^2*Lr);
figure(1);

plot(f1/1e3,L,'k')
hold on;

end






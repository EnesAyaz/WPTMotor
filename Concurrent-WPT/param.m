%% Simulation parameters
ma=0.9;
m=1; % carrier
n=2; % fundamental
mb=2.*besselj(n,m*ma*pi/2)/(m*pi);
mb=besselj(n,m*ma*pi/2)/(m*pi);
fout=50;
fsw=5e3;
fsw_l=fsw-2*fout;
fsw_h=fsw+2*fout;
L1=((fsw_l/fout))*((fsw_h/fout))*fsw;
SampleTime=1/L1
controlLoopTime= 6e-06;
Tfinal=1/fout;
phasePWM=180; % degree
phaseFout=0; % rad


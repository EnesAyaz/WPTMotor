
%% Simulation parameters
Tfinal=100/40e3;
SampleTime=1e-8;
%%
fr=65e3;
wr=fr*2*pi;
%%
fsw=80e3;
SampleTime=(1/fsw)/360;
phasePWM=180;

%% DC BUS
Vdc=100;
C_DC=1e-6;

%% PARASITICs
LSource= 1e-6;
RSource= 0.1;
LCAHA= 1e-7;
LHACB= 1e-7;
LCBHB= 1e-7;
COUT=100e-6;
ESRA=1e-7;
ESRB=1e-7;
%% LOAD 
Rload=10;
% LLoad=500e-6;
LLoad=1e-3;

%% WPT
Lp=205e-6;
Ls=51e-6;
M=41e-6;
RL=8;
Cs=115e-9;
Cp=28.5e-9;


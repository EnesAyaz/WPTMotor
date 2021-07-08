%% Motor Parameters
f_motor=50;
fsw_motor=80e3;
ma=0.6;
%% Simulation parameters
fsw=80e3;
SampleTime=(1/fsw)/360;
SampleTime=1e-8;
Tfinal=0.08;
phasePWM=180;
%% DC SUPPLY
VDC=50;
LSource= 1e-9;
RSource= 0.001;

%% Full-Bridge Parameters
C_DCA=1e-6;
C_DCB=1e-6;
C_DCC=1e-6;
ESRA=1e-7;
ESRB=1e-7;
ESRC=1e-7;
%% Parasitics
RA_parasitic=1e-3;
LA_parasitic=1e-8;
RB_parasitic=1e-3;
LB_parasitic=1e-8;
RC_parasitic=1e-3;
LC_parasitic=1e-8;
RAB_parasitic=1e-3;
LAB_parasitic=1e-8;
RBC_parasitic=1e-3;
LBC_parasitic=1e-8;
RA_mid_parasitic=1e-3;
LA_mid_parasitic=1e-8;
RB_mid_parasitic=1e-3;
LB_mid_parasitic=1e-8;
RC_mid_parasitic=1e-3;
LC_mid_parasitic=1e-8;
%% MOTOR 
Rmotor=13;
Lmotor=30e-3;
Kf=0.1157;
J=0.001;
Bm=0;
Tf=1;
w0=0;
%%  Load Torque

%% WPT
fr=80e3;
wr=fr*2*pi;
Lp=205e-6;
Ls=50e-6;
M=40e-6;
% Lp=2.2813e-04;
% Ls=6.6315e-05;
% M=1.8450e-05;
RL=8.33*1.2337;
RL=13;
Cs=120e-9;
% Cp=28.5e-9;
Cp=28e-9;


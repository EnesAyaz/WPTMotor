%% Motor Parameters
f_motor=50;
fsw_motor=10e3;
ma=0.9;
%% Simulation parameters
fsw=80e3;
SampleTime=(1/fsw)/360;
SampleTime=1e-8;
Tfinal=0.2;
phasePWM=180;
%% DC SUPPLY
VDC=200;
LSource= 1e-6;
RSource= 0.1;

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
Rmotor=2;
Lmotor=1e-3;
Kf=0.1157;
J=0.001;
Bm=0;
Tf=1;
w0=0;
%%  Load Torque

%% WPT
fr=80e3;
wr=fr*2*pi;
% Lp=205e-6;
Lp=2.2813e-04;
Ls=6.6315e-05;
M=1.8450e-05;
RL=8.33*1.2337;
Cs=5.9683e-08;
% Cp=28.5e-9;
Cp=1.7349e-08;


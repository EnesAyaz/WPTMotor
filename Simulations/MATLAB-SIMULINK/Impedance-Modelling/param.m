%% Simulation parameters
fsw=90e3;
SampleTime=(1/fsw)/360;
Tfinal=0.6;
phasePWM=180;

%% MOTOR 
Rmotor=2;
Lmotor=1e-3;
%% WPT
fr=65e3;
wr=fr*2*pi;
Lp=205e-6;
Ls=51e-6;
M=41e-6;
RL=8.44;
Cs=115e-9;
Cp=28.5e-9;

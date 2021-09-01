clear all;
clc;
%% FILL INFORMATION BELOW
Vin=60; %V  (rms)
Vout=60; %V (rms)
P_o=120; %W   
Qs=4; % unitless
f=80e3; %Hz
res_w=2*pi*f; %rad/sec
k=0.2; % chosen coupling factor
%% Calculation
R_load=Vout^2/(P_o);
Ls=Qs*R_load/res_w;    % secondary coil inductance
Is_rms= Vout/(R_load); %secondary current
Ip_rms= P_o*1.15/Vin; % primary current assuming eff=1
M=Is_rms*R_load/(res_w*Ip_rms); %calculated mutual inductance
k_c=(2/Qs)*sqrt(1-1/(Qs*Qs))/sqrt(2); %critical coupling factor
Lp=M^2/(k^2*Ls);    %primary inductance
Cp=1/(res_w^2*Lp);  %primary compansation
Cs=1/(res_w^2*Ls);  %secondary compansation
Lp=10^6*Lp;
Ls=10^6*Ls;
M=10^6*M;
%%
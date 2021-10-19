clear ;
clc;
tic;
%% Time array
ma = 0.90;
fout = 100; % Hz
fsw = 1e3; % Hz
Tstep = 1/(fsw*(fsw-2*fout)*(fsw+2*fout)); % s
Tstep=Tstep/2;
Ts = Tstep; % s
Tfinal =2/fout ; % s
time_array = 0:Tstep:Tfinal-Tstep;
NumberofSteps = numel(time_array);
%Generate switching signals
The_c=0;
The_f=-pi/6;
phaseP=The_f+0;
phaseN=The_f-pi;
VrefP = ma*cos(2*pi*fout*time_array+phaseP);
VrefN = ma*cos(2*pi*fout*time_array+phaseN);
Vtriang = zeros(1, NumberofSteps);
for k = 1:Tfinal*fsw
   Triang_temp = triang(1/(Ts*fsw));
   Vtriang((length(Triang_temp)*(k-1)+1:k/(Tstep*fsw))) = (Triang_temp*2)-1;
end

carrierPhP=0;
carrierPhN=0;
carP= round(carrierPhP/(fsw*Ts)/360);
if carP==0
    carP=1;
end
carN= round(carrierPhN/(fsw*Ts)/360);
if carN==0
    carN=1;
end

VcarrierP = [ Vtriang(carP:end), zeros(1,carP-1)];
VcarrierN = [ Vtriang(carN:end), zeros(1,carN-1)];

SP = double(VrefP > VcarrierP);
SN = double(VrefN > VcarrierN);
%%
%% Time array
fsw_l = fsw-2*fout; % Hz
Tstep_l = Tstep; % s
Ts_l = Tstep_l; % s
Tfinal_l =2/fout ; % s
time_array_l = 0:Tstep_l:Tfinal_l-Tstep_l;
NumberofSteps_l = numel(time_array_l);
%Generate switching signals
The_c_l=-2*fout;
Vref_l = 0;

Vtriang = zeros(1, NumberofSteps_l);
for k = 1:Tfinal_l*fsw_l
   Triang_temp = triang(1/(Ts_l*fsw_l));
   Vtriang((length(Triang_temp)*(k-1)+1:k/(Tstep_l*fsw_l))) = (Triang_temp*2)-1;
end

carrierPh_l=0;
car_l= round(carrierPh_l/(fsw_l*Ts_l)/360);
if car_l==0
    car_l=1;
end

Vcarrier_l = [ Vtriang(car_l:end), zeros(1,car_l-1)];

S_l = double(Vref_l > Vcarrier_l);

%%
%% Time array
fsw_h = fsw+2*fout; % Hz
Tstep_h = Tstep; % s
Ts_h = Tstep_h; % s
Tfinal_h =2/fout ; % s
time_array_h = 0:Tstep_h:Tfinal_h-Tstep_h;
NumberofSteps_h = numel(time_array_h);
%Generate switching signals
The_c_h=2*fout;
Vref_h = 0;

Vtriang_h = zeros(1, NumberofSteps_h);
for k = 1:Tfinal_h*fsw_h
   Triang_temp = triang(1/(Ts_h*fsw_h));
   Vtriang_h((length(Triang_temp)*(k-1)+1:k/(Tstep_h*fsw_h))) = (Triang_temp*2)-1;
end

carrierPh_h=0;
car_l= round(carrierPh_h/(fsw_h*Ts_h)/360);
if car_l==0
    car_l=1;
end

Vcarrier_h = [ Vtriang_h(car_l:end), zeros(1,car_l-1)];
S_h = double(Vref_h > Vcarrier_h);

%%
figure();
subplot(3,1,1)
plot(S_l)
hold on;
subplot(3,1,2)
plot(S_h)
subplot(3,1,3)
plot(SP)

%%


%% Mathematical
VphaP = ma*cos(2*pi*fout*time_array+phaseP)/2;
VphaN = ma*cos(2*pi*fout*time_array+phaseN)/2;
carrierPhP=carrierPhP*pi/180;
carrierPhN=carrierPhN*pi/180;
m=1; % carrier
n=2; % fundamental
mag_fsw=2*m*besselj(0,ma*pi/2)/pi;
Vfsw_P=(2*m*besselj(0,ma*pi/2)/pi)*cos(2*pi*fsw*time_array+carrierPhP);
Vfsw_N=(2*m*besselj(0,ma*pi/2)/pi)*cos(2*pi*fsw*time_array+carrierPhN);
%
VfswSL_P=2.*besselj(n,m*ma*pi/2)/(m*pi)*cos(2*pi*(fsw-2*fout)*time_array+carrierPhP-2*phaseP);
VfswSL_N=2.*besselj(n,m*ma*pi/2)/(m*pi)*cos(2*pi*(fsw-2*fout)*time_array+carrierPhN-2*phaseN);
%
VfswSH_P=2.*besselj(n,m*ma*pi/2)/(m*pi)*cos(2*pi*(fsw+2*fout)*time_array+carrierPhP+2*phaseP);
VfswSH_N=2.*besselj(n,m*ma*pi/2)/(m*pi)*cos(2*pi*(fsw+2*fout)*time_array+carrierPhN+2*phaseN);

%%

figure();
minus=2.5;
hold on;
plot(time_array,VphaP+minus,'color',[0.5 0 0.5],'LineWidth',2)
plot(time_array,VphaP+minus,'--','color',[0 0 1],'LineWidth',2)
minus=3.5;
plot(time_array,SP+minus,'color',[1 0 0],'LineWidth',2)
minus=5;
plot(time_array,SN+minus,'color',[0 0 1],'LineWidth',2)


%%

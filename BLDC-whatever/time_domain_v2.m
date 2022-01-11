clear ;
clc;
tic;
%% Time array
ma = 0.90;
fout = 50; % Hz
fsw = 800; % Hz
Tstep = (1/fsw)/200; % s
Ts = Tstep; % s
Tfinal =2/fout ; % s
time_array = 0:Tstep:Tfinal-Tstep;
NumberofSteps = numel(time_array);
%Generate switching signals
The_c=0;
The_f=-pi/3;
phaseA=The_f+0;
phaseB=The_f-2*pi/3;
phaseC=The_f+2*pi/3;
VrefA = ma*cos(2*pi*fout*time_array+phaseA);
VrefB = ma*cos(2*pi*fout*time_array+phaseB);
VrefC = ma*cos(2*pi*fout*time_array+phaseC);
Vtriang = zeros(1, NumberofSteps);
for k = 1:Tfinal*fsw
   Triang_temp = triang(1/(Ts*fsw));
   Vtriang((length(Triang_temp)*(k-1)+1:k/(Tstep*fsw))) = (Triang_temp*2)-1;
end
%%
carrierPhA=0;
carrierPhB=90;
carrierPhC=0;
carA= round(carrierPhA/(fsw*Ts)/360);
if carA==0
    carA=1;
end
carB= round(carrierPhB/(fsw*Ts)/360);
if carB==0
    carB=1;
end
carC= round(carrierPhC/(fsw*Ts)/360);
if carC==0
    carC=1;
end

%%
VcarrierA = [ Vtriang(carA:end), zeros(1,carA-1)];
VcarrierB = [ Vtriang(carB:end), zeros(1,carB-1)];
VcarrierC = [ Vtriang(carC:end), zeros(1,carC-1)];

%%
SA = double(VrefA > VcarrierA);
SB = double(VrefB > VcarrierB);
SC = double(VrefC > VcarrierC);

VphaA = ma*cos(2*pi*fout*time_array+phaseA)/2;
VphaB = ma*cos(2*pi*fout*time_array+phaseB)/2;
VphaC = ma*cos(2*pi*fout*time_array+phaseC)/2;

%%
carrierPhA=carrierPhA*pi/180;
carrierPhB=carrierPhB*pi/180;
carrierPhC=carrierPhC*pi/180;
m=1; % carrier
n=2; % fundamental
mag_fsw=2*m*besselj(0,ma*pi/2)/pi;
Vfsw_A=(2*m*besselj(0,ma*pi/2)/pi)*cos(2*pi*fsw*time_array+carrierPhA);
Vfsw_B=(2*m*besselj(0,ma*pi/2)/pi)*cos(2*pi*fsw*time_array+carrierPhB);
Vfsw_C=(2*m*besselj(0,ma*pi/2)/pi)*cos(2*pi*fsw*time_array+carrierPhC);
%
VfswSL_A=2.*besselj(n,m*ma*pi/2)/(m*pi)*cos(2*pi*(fsw-2*fout)*time_array+carrierPhA-2*phaseA);
VfswSL_B=2.*besselj(n,m*ma*pi/2)/(m*pi)*cos(2*pi*(fsw-2*fout)*time_array+carrierPhB-2*phaseB);
VfswSL_C=2.*besselj(n,m*ma*pi/2)/(m*pi)*cos(2*pi*(fsw-2*fout)*time_array+carrierPhB-2*phaseC);
%
VfswSH_A=2.*besselj(n,m*ma*pi/2)/(m*pi)*cos(2*pi*(fsw+2*fout)*time_array+carrierPhA+2*phaseA);
VfswSH_B=2.*besselj(n,m*ma*pi/2)/(m*pi)*cos(2*pi*(fsw+2*fout)*time_array+carrierPhB+2*phaseB);
VfswSH_C=2.*besselj(n,m*ma*pi/2)/(m*pi)*cos(2*pi*(fsw+2*fout)*time_array+carrierPhB+2*phaseC);

%%


figure();
minus=2.5;
plot(time_array,VcarrierA+minus,'color',[0.5 0 0.5],'LineWidth',0.5)
hold on;
plot(time_array,VphaA+minus,'color',[0.5 0 0.5],'LineWidth',2)
hold on;
minus=2.5;
% plot(time_array,VcarrierB+minus,'color',[0 0.5 0],'LineWidth',0.5)
plot(time_array,VcarrierB+minus,'--','color',[0 0.5 0],'LineWidth',0.5)
plot(time_array,VcarrierB+minus,'color',[0 0.5 0],'LineWidth',1)
hold on;
plot(time_array,VphaB+minus,'color',[0 0.5 0],'LineWidth',2)
hold on;
plot(time_array,SA-SB,'color','k','LineWidth',1)
hold on;
yline(0,'LineWidth',0.5)
minus=-2;
plot(time_array,(VphaA-VphaB)+minus,'color','r','LineWidth',1)
hold on;
yline(minus,'LineWidth',0.5)
minus=-4;
plot(time_array,(Vfsw_A-Vfsw_B+VfswSL_A-VfswSL_B+VfswSH_A-VfswSH_B)+minus,'color','b','LineWidth',1);
yline(minus,'LineWidth',0.5)
set(gca,'xtick',[])
grid on;
grid minor;
set(gca,'ytick',[])

%%
figure1 = figure;
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% Create plot
% plot(time_array,VcarrierA,'color',[0.5 0 0.5],'LineWidth',0.5)
plot(time_array,VcarrierB,'color',[0 0.5 0],'LineWidth',0.5)
box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTickLabel','','YTickLabel','');
hold on;
%%
figure1 = figure;
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% Create plot
% plot(time_array,VrefA,'color',[0.5 0 0.5],'LineWidth',0.5)
plot(time_array,VrefB,'color',[0 0.5 0],'LineWidth',0.5)
% plot(time_array,VrefC,'color',[0 0 0],'LineWidth',0.5)
box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTickLabel','','YTickLabel','');
hold on;
%%
figure1 = figure;
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% Create plot
% plot(time_array,SA-SB,'color',[0 0 0.5],'LineWidth',0.5)
% plot(time_array,SB-SC,'color',[0.5 0 0],'LineWidth',0.5)
% plot(time_array,SC-SA,'color',[0.5 0 0.5],'LineWidth',0.5)
% plot(time_array,(Vfsw_A-Vfsw_B+VfswSL_A-VfswSL_B+VfswSH_A-VfswSH_B),'color',[0 0 0.5],'LineWidth',0.5)
% plot(time_array,(VrefA+Vfsw_A-Vfsw_B+VfswSL_A-VfswSL_B+VfswSH_A-VfswSH_B),'color',[0.5 0 0.5],'LineWidth',0.5)
plot(time_array,VrefB-(Vfsw_A-Vfsw_B+VfswSL_A-VfswSL_B+VfswSH_A-VfswSH_B),'color',[0 0.5 0],'LineWidth',0.5)
% plot(time_array,(VrefA+Vfsw_A-Vfsw_B+VfswSL_A-VfswSL_B+VfswSH_A-VfswSH_B),'color',[0.5 0 0.5],'LineWidth',0.5)

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTickLabel','','YTickLabel','');
hold on;

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
The_f=-pi/6;
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
figure();
minus=0;
plot(time_array,(Vfsw_A-Vfsw_B)+minus,'color',[0.5 0 0],'LineWidth',2);
hold on;
minus=-0.75;
plot(time_array,(VfswSL_A-VfswSL_B)+minus,'color',[0 0 0.5],'LineWidth',2);
hold on;
minus=-1.5;
plot(time_array,(VfswSH_A-VfswSH_B)+minus,'color',[0 0.5 0],'LineWidth',2);
hold on;
set(gca,'xtick',[])
grid on;
grid minor;
set(gca,'ytick',[])
%%
% figure();
% minus=5;
% plot(time_array,VcarrierA+5,time_array,VphaA+minus,'color','k','LineWidth',0.5)
% hold on;
% minus=2.5;
% plot(time_array,VcarrierB+2.5,time_array,VphaB+minus,'color','k','LineWidth',0.5)
% hold on; 
% plot(time_array,SA-SB,'color','k','LineWidth',0.5)
% hold on;
% yline(0,'LineWidth',0.5)
% minus=-2;
% plot(time_array,(VphaA-VphaB)+minus,'color','r','LineWidth',0.5)
% hold on;
% yline(minus,'LineWidth',0.5)
% minus=-3.5;
% % plot(time_array,(Vfsw_A-Vfsw_B+VfswSL_A-VfswSL_B+VfswSH_A-VfswSH_B)+minus,'color','b','LineWidth',0.5);
% plot(time_array,(Vfsw_A-Vfsw_B)+minus,'color','b','LineWidth',0.5);
% hold on;
% yline(minus,'LineWidth',0.5)
% minus=-5;
% plot(time_array,(VfswSL_A-VfswSL_B)+minus,'color','m','LineWidth',0.5);
% hold on;
% yline(minus,'LineWidth',0.5)
% minus=-6;
% plot(time_array,(VfswSH_A-VfswSH_B)+minus,'color','g','LineWidth',0.5);
% hold on;
% yline(minus,'LineWidth',0.5)
% set(gca,'xtick',[])
% grid on;
% grid minor;
% set(gca,'ytick',[])
%%
% figure();
% plot(time_array,SA+2.4,time_array,VphaA+3,'color','k','LineWidth',0.4)
% hold on;
% plot(time_array,SB+1.2,time_array,VphaB+1.7,'color','k','LineWidth',0.4)
% hold on; 
% plot(time_array,SA-SB,'color','k','LineWidth',0.4)
% hold on;
% minus=min(SA-SB)-max(VphaA-VphaB);
% plot(time_array,(VphaA-VphaB)+minus*1.1,'color','k','LineWidth',1)
% hold on;
% minus=min((VphaA-VphaB)+minus)-max(Vfsw_A-Vfsw_B);
% plot(time_array,(Vfsw_A-Vfsw_B)+minus*1.1,'color','k','LineWidth',1);
% hold on;
% minus=min((Vfsw_A-Vfsw_B)+minus*1.1)-max(VfswSL_A-VfswSL_B);
% plot(time_array,(VfswSL_A-VfswSL_B)+minus*1.1,'color','k','LineWidth',1);
% hold on;
% minus=min((VfswSL_A-VfswSL_B)+minus*1.1)-max(VfswSH_A-VfswSH_B);
% plot(time_array,(VfswSH_A-VfswSH_B)+minus*1.1,'color','k','LineWidth',1);
% hold on;
% set(gca,'xtick',[])
% grid on;
% grid minor;
% set(gca,'ytick',[])
% ylim([-6 4])

%%


%%
% N=1;
% subplot(5,1,1)
% plot(time_array,SA-SB,'color','k','LineWidth',0.4)
% ylim([-N N])
% subplot(5,1,2)
% plot(time_array,VphaA-VphaB,'color','k','LineWidth',2)
% ylim([-N N])
% subplot(5,1,3)
% plot(time_array,Vfsw_A-Vfsw_B,'color','k','LineWidth',2);
% ylim([-N N])
% subplot(5,1,4)
% plot(time_array,VfswSL_A-VfswSL_B,'color','k','LineWidth',1);
% ylim([-N N])
% subplot(5,1,5)
% plot(time_array,VfswSH_A-VfswSH_B,'color','k','LineWidth',1);
% ylim([-N N])
% hold on;
% set(gca,'xtick',[])
% set(gca,'ytick',[])
%%
% plot(time_array,SA-SB,'color','k','LineWidth',0.4)
% hold on;
% plot(time_array,VphaA-VphaB,'--','color','k','LineWidth',2)
% hold on; 
% plot(time_array,Vfsw_A-Vfsw_B,'--','color','k','LineWidth',2);
% hold on;
% plot(time_array,VfswSL_A-VfswSL_B,'color','r','LineWidth',1);
% hold on;
% plot(time_array,VfswSH_A-VfswSH_B,'color','b','LineWidth',1);
% hold on;
% set(gca,'xtick',[])
% set(gca,'ytick',[])
% ylim([-1.2 1.2])
%%
% figure();
% plot(time_array,SA,'color','k','LineWidth',0.4)
% ylim([-1.2 1.2])
% hold on;
% plot(time_array,VrefA,'color','m','LineWidth',2)
% hold on; 
%%

% figure();
% plot(time_array,VcarrierA,'color','r','LineWidth',0.4)
% ylim([-1.2 1.2])
% hold on;
% plot(time_array,VcarrierB,'color','g','LineWidth',0.4)
% ylim([-1.2 1.2])
% hold on;
% plot(time_array,VcarrierC,'color','b','LineWidth',0.4)
% ylim([-1.2 1.2])
% hold on
% plot(time_array,VrefA,'-','color','r','LineWidth',2)
% hold on; 
% plot(time_array,VrefB,'-','color','g','LineWidth',2)
% hold on; 
% plot(time_array,VrefC,'-','color','b','LineWidth',2)
% hold on; 
% set(gca,'xtick',[])
% set(gca,'ytick',[])
% xlim([7/8/fout 15/8/fout])

%% 
% figure();
% plot(time_array,Vfsw_A-Vfsw_B+VfswSH_A-VfswSH_B+VfswSL_A-VfswSL_B,'color','b','LineWidth',0.8);
% hold on;
% set(gca,'xtick',[])
% set(gca,'ytick',[])
% %% 
% figure();
% plot(time_array,Vfsw_A-Vfsw_B+VfswSH_A-VfswSH_B,'color','b','LineWidth',0.8);
% hold on;


%%
% plot(time_array,SA)
% y=zeros(1,length(SA));
% 
% for j=1:length(SA)
% if SA(j)==1
%     SAp(j)=0;
% else 
%     SAp(j)=1; 
% end
% end
%%
% x2 = [time_array, fliplr(time_array)];
% inBetween = [SA, fliplr(y)];
% inBetween2 = [SAp, fliplr(y)];
% %%
% fill(x2, inBetween, 'r');
% hold on;
% fill(x2, inBetween2, 'k');
% hold on;
% 
% %%
% 
% plot(time_array,VphaA-VphaB,'color','r','LineWidth',2)
% hold on; 
% plot(time_array,Vfsw_A-Vfsw_B+VfswSL_A-VfswSL_B+VfswSH_A-VfswSH_B,'color','b','LineWidth',2);
% hold on;
% 
% set(gca,'xtick',[])
% set(gca,'ytick',[])
% ylim([-1.2 1.2])

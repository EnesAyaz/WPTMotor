figure;
fx=[];
MagX=[];
PhaseX=[];
mx=[];
%%
for ma=0:0.1:1
fundamental_freq=300;
switching_frequency=40e3;
phase_fund=0;
phase_carrier=0;
phase_fund1=phase_fund*pi/180;
phase_carrier1=phase_carrier*pi/180;
[f, Mag, Phase]=SwitchingFunction(ma,fundamental_freq,switching_frequency,phase_fund1,phase_carrier1,1,3);

f=f(3:end);
Mag=Mag(3:end);
Phase=Phase(3:end);

x=num2str(phase_fund);
y=num2str(phase_carrier);
z= num2str(ma);
tit=strcat('Fundamental Phase:  ',x,', Carrier Phase:  ',y,  ', Modulation Index:',z);

subplot(2,1,1)
stem(f/1000,Mag,'color','b','lineStyle','-','LineWidth',2);
hold on;
yline(0.1,'color','k','LineStyle','--','LineWidth',1)
yline(0.2,'color','k','LineStyle','--','LineWidth',1)
yline(0.3,'color','k','LineStyle','--','LineWidth',1)
yline(0.4,'color','k','LineStyle','--','LineWidth',1)
yline(0.5,'color','k','LineStyle','--','LineWidth',1)
yline(0.6,'color','k','LineStyle','--','LineWidth',1)
yline(0.7,'color','k','LineStyle','--','LineWidth',1)
yline(0.8,'color','k','LineStyle','--','LineWidth',1)
yline(0.9,'color','k','LineStyle','--','LineWidth',1)
yline(1,'color','k','LineStyle','--','LineWidth',1)
yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7  0.8 0.9 1])
% ylim([0 0.6])
xticks([ ...
(switching_frequency-3*fundamental_freq)/1000  ...
(switching_frequency-2*fundamental_freq)/1000  ...
(switching_frequency-fundamental_freq)/1000    ...
switching_frequency/1000                       ...
(switching_frequency+fundamental_freq)/1000  ...
(switching_frequency+2*fundamental_freq)/1000  ...
(switching_frequency+3*fundamental_freq)/1000  ...
]) 
xticklabels({'fs-3fo','fs-2fo','fs-fo','fs','fs+fo','fs+2fo','fs+3fo'})
title(tit);

subplot(2,1,2)
stem(f/1000,Phase*180/pi,'color','r','lineStyle','-','LineWidth',2)
hold on;
yline(60,'color','k','LineStyle','--','LineWidth',1)
yline(120,'color','k','LineStyle','--','LineWidth',1)
yline(180,'color','k','LineStyle','--','LineWidth',1)
yline(240,'color','k','LineStyle','--','LineWidth',1)
yline(300,'color','k','LineStyle','--','LineWidth',1)
yline(360,'color','k','LineStyle','--','LineWidth',1)
xticks([ ...
(switching_frequency-3*fundamental_freq)/1000  ...
(switching_frequency-2*fundamental_freq)/1000  ...
(switching_frequency-fundamental_freq)/1000    ...
switching_frequency/1000                       ...
(switching_frequency+fundamental_freq)/1000  ...
(switching_frequency+2*fundamental_freq)/1000  ...
(switching_frequency+3*fundamental_freq)/1000  ...
]) 
xticklabels({'fs-3fo','fs-2fo','fs-fo','fs','fs+fo','fs+2fo','fs+3fo'})
yticks([0 60 120 180 240 300 360])

title(tit);

fx=[fx; f];
MagX=[MagX; Mag ];
PhaseX=[PhaseX; Phase];

end

%%
m=0:0.1:1;
m=m';
m=[m,m,m,m,m,m,m];

contourf(m,fx/1000,MagX)
xlabel('Modulation Index');
ylabel('Frequency(kHz)');
% set(gca,'ColorScale','log')
colormap(jet)
colorbar
title(strcat('Fundamental Phase:  ',x,', Carrier Phase:  ',y))

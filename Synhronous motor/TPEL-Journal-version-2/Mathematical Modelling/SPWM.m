clear ;
clc;
tic;
%% Time array
ma = 0.6;
fout = 50; % Hz
fsw = 1000; % Hz
Tstep = (1/fsw)/800; % s
Ts = Tstep; % s
Tfinal =1/fout ; % s
time_array = 0:Tstep:Tfinal-Tstep;
NumberofSteps = numel(time_array);
%Generate switching signals
The_c=0;
The_f=-pi/2;
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

carrierPhA=0;
carrierPhB=0;
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

VcarrierA = [ Vtriang(carA:end), zeros(1,carA-1)];
VcarrierB = [ Vtriang(carB:end), zeros(1,carB-1)];
VcarrierC = [ Vtriang(carC:end), zeros(1,carC-1)];


SA = double(VrefA > VcarrierA);
SB = double(VrefB > VcarrierB);
SC = double(VrefC > VcarrierC);

%%
figure1=figure();
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(time_array,VrefA,'Linewidth',3,'Color',[0.5 0 0])
hold on;
plot(time_array,VrefB,'Linewidth',3,'Color',[0 0.5 0])
hold on;
plot(time_array,VrefC,'Linewidth',3,'Color',[0 0 0.5])

hold on;
cf=plot(time_array,VcarrierA,'Linewidth',1,'Color',[0.2 0.2 0.2],'LineStyle','-')
cf.Color= [cf.Color 1]


box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTick',[0 Tfinal/2 Tfinal],'XTickLabel',{'0','180','360'},'FontName','TimesNewRoman','FontSize',20);
set(axes1,'YTick',[-1 -ma 0 ma 1],'YTickLabel',{'-1','-m_a','0','m_a','1'},'FontName','TimesNewRoman','FontSize',20);


legend1 = legend(axes1,'show',{'$Ref_A$','$Ref_B$','$Ref_C$','Carrier'},'FontName','TimesNewRoman','FontSize',16);
set(legend1,...
    'Location','Best',...
    'EdgeColor','none',...
    'Color','white','interpreter','Latex');

xlabel('Fundamental Phase ($^o$)', 'interpreter','latex','FontName','Times New Roman',...
    'FontSize',20)
% ylabel('Normalized References','interpreter','latex','FontName','Times New Roman',...
%     'FontSize',20)

% figure();
% plot(time_array,SA+1.5,'Linewidth',1,'Color','r')
% hold on;
% plot(time_array,SB,'Linewidth',1,'Color','b')
% hold on;
% plot(time_array,SC-1.5,'Linewidth',1,'Color','m')
%%

figure1=figure();
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(time_array,SA+1.5,'Linewidth',1,'Color',[0.5 0 0])
hold on;
plot(time_array,SB,'Linewidth',1,'Color',[0 0.5  0])
hold on;
plot(time_array,SC-1.5,'Linewidth',1,'Color',[0 0 0.5])

ylim([-2 3])

% xticklabels({'Ts','','Ts'})

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTick',[0 Tfinal/2 Tfinal],'XTickLabel',{'0','180','360'},'FontName','TimesNewRoman','FontSize',20);
set(axes1,'YTick',[-1.5 -0.5 0 1 1.5 2.5],'YTickLabel',{'L','H','L','H','L','H'},'FontName','TimesNewRoman','FontSize',20);


legend1 = legend(axes1,'show',{'$S_A$','$S_B$','$S_C$'},'FontName','TimesNewRoman','FontSize',16);
set(legend1,...
    'Location','Best',...
    'EdgeColor','none',...
    'Color','white','interpreter','Latex');

xlabel('Fundamental Phase ($^o$)', 'interpreter','latex','FontName','Times New Roman',...
    'FontSize',20)
ylabel('PWM Signals','interpreter','latex','FontName','Times New Roman',...
    'FontSize',20)

%%
figure1=figure();
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(time_array,VrefA,'Linewidth',3,'Color',[0.5 0 0])
hold on;
plot(time_array,VrefB,'Linewidth',3,'Color',[0 0.5 0])
hold on;
plot(time_array,VrefC,'Linewidth',3,'Color',[0 0 0.5],'LineStyle','--')

hold on;
plot(time_array,VcarrierA,'Linewidth',2,'Color',[0.2 0.2 0.2])

Tfinalx=0.005
% Tfinalx=0.01;
xlimH= Tfinalx+1/fsw;
xlim([Tfinalx xlimH])
ylim([-1 1])

% xticklabels({'Ts','','Ts'})

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTick',[Tfinalx xlimH],'XTickLabel',{'0','Ts'},'FontName','TimesNewRoman','FontSize',20);
set(axes1,'YTick',[-1 0 1]);


legend1 = legend(axes1,'show',{'$Ref_A$','$Ref_B$','$Ref_C$','Carrier'},'FontName','TimesNewRoman','FontSize',20);
set(legend1,...
    'Position',[0.704191336922702 0.57341270550849 0.196428568288684 0.251190469094685],...
    'EdgeColor','none',...
    'Color','none','interpreter','Latex');

figure1=figure();
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(time_array,SA+1.5,'Linewidth',3,'Color',[0.5 0 0])
hold on;
plot(time_array,SB,'Linewidth',3,'Color',[0 0.5 0])
hold on;
plot(time_array,SC-1.5,'Linewidth',3,'Color',[0 0 0.5])

xlimH= Tfinalx+1/fsw;
xlim([Tfinalx xlimH])
ylim([-2 3])

% xticklabels({'Ts','','Ts'})

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTick',[Tfinalx xlimH],'XTickLabel',{'0','Ts'},'FontName','TimesNewRoman','FontSize',20);
set(axes1,'YTick',[-1.5 -0.5 0 1 1.5 2.5],'YTickLabel',{'L','H','L','H','L','H'},'FontName','TimesNewRoman','FontSize',20);



legend1 = legend(axes1,'show',{'$S_A$','$S_B$','$S_C$'},'FontName','TimesNewRoman','FontSize',20);
set(legend1,...
    'Location','Best',...
    'EdgeColor','none',...
    'Color','none','interpreter','Latex');


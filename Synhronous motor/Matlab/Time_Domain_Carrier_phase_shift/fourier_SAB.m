clear ;
clc;
tic;
%% Time array
ma = 0.6;
fout = 50; % Hz
fsw = 100000; % Hz
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

plot(time_array,SA+1.5,'Linewidth',3,'Color','r')
hold on;
plot(time_array,SB,'Linewidth',3,'Color','b')
hold on;
% plot(time_array,SC-2,'Linewidth',3,'Color','m')


Tfinalx=0.00675;
Tfinalx=0.01;
xlimH= Tfinalx+1/fsw;
xlim([Tfinalx xlimH])
ylim([-0.5 3])

hold on; 
plot(time_array,2+(sin(2*pi*fsw*time_array)/2),'Linewidth',2,'Color','r','LineStyle','--')
hold on;
plot(time_array,0.5+(sin(2*pi*fsw*time_array)/2),'Linewidth',2,'Color','b','LineStyle','--')

% xticklabels({'Ts','','Ts'})

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTick',[Tfinalx xlimH],'XTickLabel',{'0','Ts'},'FontName','TimesNewRoman','FontSize',20);
set(axes1,'YTick',[ 0 1 1.5 2.5],'YTickLabel',{'L','H','L','H'},'FontName','TimesNewRoman','FontSize',16);



legend1 = legend(axes1,'show',{'S_A','S_B'},'FontName','TimesNewRoman','FontSize',16);
set(legend1,...
    'Location','Best',...
    'EdgeColor','none',...
    'Color','none');


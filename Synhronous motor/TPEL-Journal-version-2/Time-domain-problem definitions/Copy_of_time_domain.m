clear ;
clc;
tic;
%% Time array
VAB=[];
sinx_tt=[];
time_t=[];
VrefP_t=[];
VrefN_t=[];

rms_sinxt= [];

phase_shift=[46 48 53.4 62 74 ];

phase_shift=[59 62 69 86 150 ];

phase_shift=[41 43 48 53 50 ];
% phase_shift=[0 0 0 0 0];
j=0;
for ma=0:0.25:1
  j=j+1;
fout = 100; % Hz
fsw = 10e3; % Hz
% Tstep = 1/(fsw*(fsw-2*fout)*(fsw+2*fout)); % s
% Tstep=Tstep/2;
Tstep =1e-7; % s
Ts = Tstep; % s
Tfinal =1/fout ; % s
time_array = 0:Tstep:Tfinal-Tstep;
NumberofSteps = numel(time_array);
%Generate switching signals
The_c=0;
The_f=4*pi/3;
phaseP=The_f+0;
phaseN=The_f-2*pi/3;
VrefP = ma*cos(2*pi*fout*time_array+phaseP);
VrefN = ma*cos(2*pi*fout*time_array+phaseN);
Vtriang = zeros(1, NumberofSteps);
for k = 1:Tfinal*fsw
   Triang_temp = triang(1/(Ts*fsw));
   Vtriang((length(Triang_temp)*(k-1)+1:k/(Tstep*fsw))) = (Triang_temp*2)-1;
end

carrierPhP=0;
carrierPhN=phase_shift(j);
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

plot(time_array,SP-SN)


T=Tstep;
Fs=1/T;
L=length(time_array);

Y = fft(SP-SN);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

P3 = angle(Y/L);
P4 = P3(1:L/2+1);


f = Fs*(0:(L/2))/L;

f=5*round(f/5);


Pmag=[];
Pangle=[];
Pcomplex=[];
f_ma=[];

for  i=-10*fout:fout:fout*10
   f_ma=[f_ma, f(f==fsw+i)];
   Pmag = [Pmag  P1(f==fsw+i)];
   Pangle = [Pangle P4(f==fsw+i)];
%    Pcomplex=[Pcomplex P6(f==160000+i)]; 
end


figure1 = figure('Position',[0 0 500 200]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

sinx_t=zeros(size(time_array));
for i=1:length(Pmag)
sinx=Pmag(i)*cos(2*pi*f_ma(i)*time_array+Pangle(i));
% sinx=Pcomplex(i)*cos(2*pi*f_ma(i)*time);
sinx_t=sinx_t+sinx;
end
plot(time_array*1000,sinx_t,'Color',[0 0 0.5],'LineWidth',0.1);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Color','white','FontName','Times New Roman','FontSize',12,...
    'GridAlpha',0.3,'GridColor',[0 0 0],'XGrid','on','YGrid','on');

% text(1:length(P1),P1,num2str(P1'),'vert','bottom','horiz','center'); 

ylabel('Voltage (V)','Interpreter','Latex','FontSize',14)
xlabel('Time (ms)','Interpreter','Latex','FontSize',14)
% xlim([0 25])
% ylim([-0.5 0.5])



VAB=[VAB,SP-SN];
sinx_tt=[sinx_tt,sinx_t];

VrefP_t=[VrefP_t VrefP];
VrefN_t=[VrefN_t VrefN];

rms_sinxt= [ rms_sinxt rms(sinx_t) ]
end
close all;
%%
time_t=0:Tstep:Tstep*(length(VAB)-1);
%%
figure1 = figure('Position',[0 0 600 350]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');


plot(time_t,VAB,'Color',[0.5 0 0],'LineWidth',1);
hold on; 
plot(time_t,sinx_tt,'Color',[0 0 0.5],'LineWidth',1);


hold(axes1,'off');
% Set the remaining axes properties
% set(axes1,'Color','white','FontName','Times New Roman','FontSize',12,...
%     'GridAlpha',0.3,'GridColor',[0 0 0],'XGrid','on','YGrid','on');
% set(axes1,'Color','white','FontName','Times New Roman','FontSize',15,...
%     'GridAlpha',0,'GridColor',[0 0 0],'XGrid','on','YGrid','on');

set(axes1,'FontName','Times New Roman','FontSize',15,'GridAlpha',0,...
    'GridColor',[0 0 0],'XGrid','on','XTickLabel',...
    {'0','2\pi','4\pi','6\pi','8\pi','10\pi'},'YGrid','on','YTick',...
    [-1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1]);
% text(1:length(P1),P1,num2str(P1'),'vert','bottom','horiz','center'); 

ylabel('$U_i$/$U_i^f$ (p.u)','FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex');

% Create xlabel
xlabel({'Fundamental Phase (radian)'},'FontSize',16,...
    'FontName','Times New Roman',...
    'Interpreter','latex');
ylim([-1 1])


%%

plot(time_t,sinx_tt,'Color',[0 0 0.5],'LineWidth',1);
hold on;
plot(time_t,abs(VrefP_t),'Color',[0 0 0.5],'LineWidth',1);
hold on;

plot(time_t,abs(VrefN_t),'Color',[0 0 0.5],'LineWidth',1);


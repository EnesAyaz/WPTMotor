clear all;
clc; 

%% FILL INFORMATION BELOW
Vin=40.8; %V  (rms) 
P_o=50; %W   
Qs=2.5; % unitless
f=65e3; %Hz
w=2*pi*f; %rad/sec
k=0.4; % chosen coupling factor
kc= (1/Qs)*sqrt(1-1/(4*Qs^2));
Vout= 20.4;
R_L=(Vout^2)/P_o; %% single module R_L

Qs=10; % unitless
Lpa=[];
Lsa=[];
Qsa=[];
k=0.9; % chosen coupling factor
for Qs=1:0.5:10
Ip_rms= P_o/Vin; % primary current assuming eff=1
Is_rms=(P_o/Vout);
M=Is_rms*R_L/(w*Ip_rms); %calculated mutual inductance 
Ls=Qs*R_L/w;    % secondary coil inductance
Lp=M^2/(k^2*Ls);  %primary inductance
Cp=1/(w^2*Lp);  %primary compansation
Cs=1/(w^2*Ls);  %secondary compansation
Qsa=[Qsa Qs];
Lpa=[Lpa Lp];
Lsa=[Lsa Ls];
end

semilogy(Qsa,Lpa*1e6,'LineWidth',2)
hold on;
% Create ylabel
ylabel({'Inductance($ \mu H$)'},'FontSize',14,'FontName','Times New Roman',...
    'Interpreter','latex');

% Create xlabel
xlabel({'Frequency($kHz$)'},'FontSize',14,'FontName','Times New Roman',...
    'Interpreter','latex');

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[35000 120000]);
% box(axes1,'on');
% grid(axes1,'on');
% hold(axes1,'off');
% Set the remaining axes properties
% set(axes1,'XTickLabel',{'40','50','60','70','80','90','100','110','120'});
% Create legend
% legend1 = legend(axes1,'show');
% set(legend1,...
%     'Position',[0.708702742833329 0.615221386800334 0.12218487235285 0.275689223057645],...
%     'FontName','Times New Roman',...
%     'EdgeColor','none','Color','none');







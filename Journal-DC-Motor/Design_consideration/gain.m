clear all;
clc; 
% The code is used for 1p-1s design series-series WPT
% Input and power, Output power and load, Quality factor of seconder side
figure2 = figure;
% Create axes
axes1 = axes('Parent',figure2);
hold(axes1,'on');
%% FILL INFORMATION BELOW
Vin=40.8; %V  (rms) 
P_o=50; %W   
Qs=2.5; % unitless
f=65e3; %Hz
% f=80e3; %Hz
w=2*pi*f; %rad/sec
k=0.40; % chosen coupling factor
% k=0.25; % chosen coupling factor
kc= (1/Qs)*sqrt(1-1/(4*Qs^2));
% Calculation Series-compensated paralel DC BUS
Vout= 20.4;
R_L=(Vout^2)/P_o; %% single module R_L
% R_L=8.33; %% single module R_L
% Vout=sqrt(P_o*R_L); %% single module R_

Ip_rms= P_o/Vin; % primary current assuming eff=1
Is_rms=(P_o/Vout);
M=Is_rms*R_L/(w*Ip_rms); %calculated mutual inductance 
Ls=Qs*R_L/w;    % secondary coil inductance
Lp=M^2/(k^2*Ls);  %primary inductance
Cp=1/(w^2*Lp);  %primary compansation
Cs=1/(w^2*Ls);  %secondary compansation
% Analytical model 
[Lp,Ls,M]*1e6
%
%   
%    |-- rp----Cp----Lp'(Lp-M)---|---Ls'(Ls-M)--Cs-|
%    |                           |                 |      
%    |                           |                 |
% --|V_in|--                  --Lm--            --RLoad--
%    |                           |                 | 
%    |                           |                 |
%    |---------------------------|-------rs--------|
%
%
%  Create T-model of coupled inductor at steady state
%  Sinosoidal response 
% at above circuit is represented and parameter name
% is given. I give a name Lp' as Lp_p and Ls' as Ls_p. 

%
rp=0.03; % ohm
rs= 0.03; % ohm 
Lp_p=Lp-M; % Henry as actually Lp-m Lp is 120u
Ls_p=Ls-M; % Henry as actually Ls-m Ls is 120u
% f=logspace(4.5,5.1,200);
f=40e3:1e3:120e3;
w=2*pi*f;
%
Z1= 1i.*w*Ls_p +R_L- 1i./(w*Cs);
Z2=1i.*w*M;
Z3= 1i.*w*Lp_p+rp+rs-1i./(w*Cp);
Z12= ((Z1.*Z2)./(Z1+Z2));
Z123=Z12+Z3;
%
V1= (Z12./Z123)*Vin; 
V_load= (R_L./(1i*w*Ls_p+R_L-1i./(w*Cs))).*V1;
Vo_angle= angle(V_load)*180/pi;
Vo_mag= abs(V_load);
Iin=Vin./Z123;
Iin_angle= angle(Iin)*180/pi;
Iin_mag= abs(Iin);
%
% figure;
plot(f,Vo_mag/Vin,'Linewidth',2);
hold on; 

% plot(f,Iin_angle,'Linewidth',2);
% xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
% set(gca, 'XScale', 'log')
% grid on;
% set(gca,'FontSize',10);
%%
% Create ylabel
ylabel({'Output Voltage (V)'},'FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex');

% Create xlabel
xlabel({'Frequency(kHz)'},'FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex');



% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[35000 120000]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTickLabel',{'40','50','60','70','80','90','100','110','120'});
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.708702742833329 0.615221386800334 0.12218487235285 0.275689223057645],...
    'FontName','Times New Roman',...
    'EdgeColor','none');
%
% Create textarrow
annotation(figure2,'textarrow',[0.699798899639536 0.698370328210965],...
    [0.639874686716792 0.912255639097746]);

% Create textbox
annotation(figure2,'textbox',...
    [0.570819768544867 0.771804511278198 0.103285714285714 0.0590476190476191],...
    'String',{'Decreasing','Transmitter','Inductance'},...
    'Interpreter','latex',...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textarrow
annotation(figure2,'textarrow',[0.802545057863782 0.801116486435211],...
    [0.633233082706768 0.905614035087722]);

% Create textbox
annotation(figure2,'textbox',...
    [0.79477252893189 0.759473684210529 0.103285714285715 0.0590476190476191],...
    'String',{'Inreasing','Coupling'},...
    'Interpreter','latex',...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textarrow
annotation(figure2,'textarrow',[0.723771580345286 0.689243027888446],...
    [0.488721804511278 0.445488721804511]);

% Create textbox
annotation(figure2,'textbox',...
    [0.721067349649022 0.461541353383461 0.103285714285714 0.0590476190476188],...
    'String',{'k=0.40'},...
    'Interpreter','latex',...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');


%% Analytical model with motor 

%
%   
%    |--------------|---rp----Cp----Lp'(Lp-M)---|---Ls'(Ls-M)--Cs-|
%    |              |                           |                 |      
%    |          --Lmotor--                      |                 |
% --|V_in|--        |                         --Lm--            --RLoad--
%    |              |                           |                 | 
%    |          --Rmotor--                      |                 |
%    |--------------|---------------------------|-------rs--------|
%
%
%  Create T-model of coupled inductor at steady state
%  Sinosoidal response 
% at above circuit is represented and parameter name
% is given. I give a name Lp' as Lp_p and Ls' as Ls_p. 

% Frequency Space 
% f=logspace(0,6,10000);
f=linspace(0.5e5,0.9e5,10000);
w=2*pi*f;
% Parameters
rp=0; % ohm
rs= 0; % ohm 
Lp=205e-6;
Ls=51e-6;
M=41e-6;
Cs=115e-9;
Cp=28.5e-9;
Lp_p=Lp-M;
Ls_p=Ls-M;
Vin=1;

RLk=[12:5:90];

figure1=figure('Position', [0 0 500 300]);
axes1 = axes('Parent',figure1);

for i =1:length(RLk)
RL=RLk(i);
% Impedance 
Z1= 1i.*w*Ls_p +(RL+rs)- 1i./(w*Cs); %% secondary side
Z2=1i.*w*M; % mutual inductance 
Z3= 1i.*w*Lp_p+rp-1i./(w*Cp); % primary side 
Z12= ((Z1.*Z2)./(Z1+Z2)); %% reflected secondary impedance to primary
Z123=Z12+Z3; %% total impedance 

Ip=Vin./Z123;
Vout=Vin.*(Z12./Z123).*(RL./Z1);
% x = 1  Ip else 
% choose="Ip";
% choose="Vout";
choose ="Vout";
if choose=="Ip"
    X_mag= abs(Ip);
    X_angle=angle(Ip)*180/pi;
elseif choose=="Vout"
    X_mag= abs(Vout);
    X_angle=angle(Vout)*180/pi;
elseif  choose=="Z"
    X_mag= abs(Z1234);
    X_angle=angle(Z1234)*180/pi;
else
    X_mag= abs(Z1234);
    X_angle=angle(Z1234)*180/pi;
end


hold on;
plot(f/1000,X_mag,'Linewidth',1);
set(gca,'YScale','log')
grid on;
% set(gca,'FontSize',30);
set(axes1,'FontName','Times New Roman','FontSize',8,'YMinorTick','on',...
    'YScale','log','YTick',[0.3,0.4,0.5,0.6,0.7,0.8,0.9,1,2,3,4,5]);
xlabel('Frequency (Hz)','Interpreter','Latex','FontName','Times New Roman','FontSize',12)
ylabel('AC-AC Gain($\frac{V_{out}}{V_{in}}$)','Interpreter','Latex','FontName','Times New Roman','FontSize',12)
end
% B=arrayfun(@num2str,RLk,'un',0)
% legend(B)

% Create arrow
annotation(figure1,'arrow',[0.298 0.384],...
    [0.515666666666668 0.860000000000001]);

% Create textbox
annotation(figure1,'textbox',[0.734 0.66 0.154 0.173333333333335],...
    'String',{'Operation Region'},...
    'Interpreter','latex',...
    'FontSize',12,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textarrow
annotation(figure1,'textarrow',[0.832000000000001 0.810000000000001],...
    [0.453333333333334 0.326666666666667],'String',{'CV'},'Interpreter','latex',...
    'FontSize',12,...
    'FontName','Times New Roman');

% Create rectangle
annotation(figure1,'rectangle',...
    [0.712000000000006 0.173333333333336 0.190000000000001 0.689999999999999],...
    'LineWidth',1,...
    'LineStyle','--');

% Create textbox
annotation(figure1,'textbox',...
    [0.188 0.633333333333337 0.192 0.150000000000002],...
    'String',{'Increasing $R_L$'},...
    'Interpreter','latex',...
    'FontSize',12,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');




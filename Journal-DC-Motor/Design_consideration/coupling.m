Vin=100; %V  (rms) 
P_o=300; %W   
Qs=2.5; % unitless
f=65e3; %Hz
% f=80e3; %Hz
w=2*pi*f; %rad/sec
k=0.4; % chosen coupling factor
% k=0.25; % chosen coupling factor
Vout=50; %V (rms)
kc= (1/Qs)*sqrt(1-1/(4*Qs^2));
% Calculation Series-compensated paralel DC BUS
R_L=(Vout^2)/P_o; %% single module R_L

Ip_rms= P_o/Vin; % primary current assuming eff=1
Is_rms=(P_o/Vout);
M=Is_rms*R_L/(w*Ip_rms); %calculated mutual inductance 
Ls=Qs*R_L/w;    % secondary coil inductance
Lp=M^2/(k^2*Ls);  %primary inductance
Cp=1/(w^2*Lp);  %primary compansation
Cs=1/(w^2*Ls);  %secondary compansation
%%
k=0.15:0.01:0.40;
Lp=M^2./(k.^2*Ls);  %primary inductance


figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(k,Lp*1e6,'LineWidth',3)


% Create ylabel
ylabel({'Inductance($\mu H$)'},'FontName','Times New Roman',...
    'Interpreter','latex');

% Create xlabel
xlabel({'Coupling'},'FontName','Times New Roman','Interpreter','latex');

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',16);

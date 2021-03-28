%% FILL INFORMATION BELOW
Vin=100; %V  (rms) 
P_o=300; %W   
Qs=2.5; % unitless
f=65e3; %Hz
% f=80e3; %Hz
w=2*pi*f; %rad/sec
% k=0.25; % chosen coupling factor
k=0.40; % chosen coupling factor
Vout=50; %V (rms)
kc= (1/Qs)*sqrt(1-1/(4*Qs^2));
% Calculation Series-compensated paralel DC BUS
RL=(Vout^2)/P_o; %% single module R_L
Ip_rms= P_o/Vin; % primary current assuming eff=1
Is_rms=(P_o/Vout);
M=Is_rms*RL/(w*Ip_rms); %calculated mutual inductance 
Ls=Qs*RL/w;    % secondary coil inductance
Lp=M^2/(k^2*Ls);  %primary inductance
Cp=1/(w^2*Lp);  %primary compansation
Cs=1/(w^2*Ls);  %secondary compansation

Lp_p=Lp-M;
Ls_p=Ls-M;
RL=8.55;

rp=0; % ohm
rs= 0; % ohm 




%%

%% Analytical model with motor    
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

Gain=[];
Dx=[];
for D=0:0.005:1
Dx=[Dx D];
k=1;
Vin=4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
Vin=abs(Vin);
% Vin=1
% f=logspace(4,6,10000);
% f=logspace(4.6,5.2,10000);
f=linspace(45e3,105e3,10000);
% f=logspace(0,6,10000);
w=2*pi*f;
% Parameters

Rmotor=2;
Lmotor=1e-3;
% Impedance 
Z1= 1i.*w*Ls_p +(RL+rs)- 1i./(w*Cs); %% secondary side
Z2=1i.*w*M; % mutual inductance 
Z3= 1i.*w*Lp_p+rp-1i./(w*Cp); % primary side 
Z12= ((Z1.*Z2)./(Z1+Z2)); %% reflected secondary impedance to primary
Z123=Z12+Z3; %% total impedance 
Z4= 1i.*w*Lmotor +(Rmotor); % motor impedance
Z1234=((Z123.*Z4)./(Z123+Z4)); %

% Ip=Vin./Z123;
Vout=Vin.*(Z12./Z123).*(RL./Z1);
Gain=[Gain;abs(Vout)];

end 

%%

% D=0.5:0.005:0.90;
D=Dx;
[x,y] = meshgrid(f/1000,D);
% mesh(y,x,Gain)

figure1=figure();
set(gcf, 'Position', [ 100 100 600 300])
set(gcf, 'Position', [ 100 100 300 300])
colormap(jet);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% Create contour
contour(y,x,5000*Gain.*Gain/RL,'LineWidth',3)

% set(gca,'YScale','log')
% Create labels and 
ylabel({'Frequency(kHz)'},'FontName','Times New Roman',...
    'Interpreter','latex','FontSize',12);
xlabel({'Duty Cycle'},'FontName','Times New Roman',...
    'Interpreter','latex','FontSize',12);
% title('Voltage Gain','FontSize',20);
%
box(axes1,'on');
axis(axes1,'tight');
hold(axes1,'off');
% Set the remaining axes properties
% set(axes1,'BoxStyle','full','Layer','top','YMinorTick','on','YScale','log');
set(axes1,'BoxStyle','full','Layer','top','YMinorTick','off');
% Create colorbar
colorbar(axes1);


% Create textbox
% annotation(figure1,'textbox',...
%      [0.781000000000001 0.925333333333333 0.163 0.0800000000000003],...
%     'String',{'IPT Power'},...
%     'Interpreter','latex',...
%     'FontName','Times New Roman','FontSize',9,...
%     'FitBoxToText','off',...
%     'EdgeColor','none');

annotation(figure1,'textbox',...
     [0.674666666666667 0.92 0.328000000000001 0.0800000000000004],...
    'String',{'IPT Power'},...
    'Interpreter','latex',...
    'FontName','Times New Roman','FontSize',9,...
    'FitBoxToText','off',...
    'EdgeColor','none');

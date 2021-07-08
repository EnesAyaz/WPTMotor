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
for D=0:0.05:1
k=1;
Vin=4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
Vin=abs(Vin);
% Vin=1
% f=logspace(4,6,10000);
% f=logspace(4.6,5.2,10000);
f=50e3:1e3:100e3;
% f=logspace(0,6,10000);
w=2*pi*f;
% Parameters
rp=0.3; % ohm
rs= 0.3; % ohm 
Lp=205e-6;
Ls=51e-6;
M=41e-6;
RL=8.44;
Cs=115e-9;
Cp=28.5e-9;
Lp_p=Lp-M;
Ls_p=Ls-M;
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

%% only motor 
D=0.5:0.05:0.90;
Speed=[0 54 111 170 240 306 369 433 490];
Output_Voltage=[0 8.7 18.7 29.1 39.1 49.5 60.2 70.7 81];
Output_Current=[0 0.04 0.07 0.24 0.65 0.87 1.04 1.26 1.45];
Input_Voltage=100*ones(1,length(D));
Input_Current=[0 0.18 0.36 0.60 0.88 1.26 1.68 2.16 2.72];

figure();
set(gcf,'Position',  [100, 100, 600, 600]);
plot(D,Speed,...
    'LineWidth',3,'Color','r');
hold on;
% plot(D,Input_Current,...
%     'LineWidth',3,'Color','r');

%%
D=0.5:0.05:0.90;
Frequency=[103 103 102 101 99 97 93 89 80];
Motor_Speed=[0 57 118 182 250 320 396 440 520];
Rx_current=[1.023 1.011 1.024 1.013 1 1.04 1.01 1.03];

%%

% D=0.5:0.005:0.90;
D=0:0.05:1;
[x,y] = meshgrid(f/1000,D);
% mesh(y,x,Gain)

figure1=figure();
set(gcf,'Position',  [100, 100, 500, 400]);
colormap(jet);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% Create contour
contour(y,x,Gain,'LineWidth',4)
set(axes1,'XlimMode','manual','xlim',[0.5 1])

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
set(axes1,'BoxStyle','full','Layer','top','YMinorTick','on');
% Create colorbar
colorbar(axes1);
% D=0.5:0.05:0.90;
% hold on;
% plot(D,Frequency,'LineStyle','None','Marker','p','MarkerSize',10, ...
%     'LineWidth',2,'Color','k');

%%


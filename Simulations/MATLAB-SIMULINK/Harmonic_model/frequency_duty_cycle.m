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
for D=0:0.005:1
k=1;
Vin=4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
Vin=abs(Vin);
% Vin=1
% f=logspace(4,6,10000);
f=logspace(4.6,5.2,10000);
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

%%

% D=0.5:0.005:0.90;
D=0:0.005:1;
[x,y] = meshgrid(f/1000,D);
% mesh(y,x,Gain)

figure1=figure();
colormap(jet);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% Create contour
contour(y,x,Gain,'LineWidth',4)

set(gca,'YScale','log')
% Create labels and 
ylabel('Frequency(kHz)','FontSize',20);
xlabel('Duty Cycle','FontSize',20)
title('Voltage Gain','FontSize',20);
%
box(axes1,'on');
axis(axes1,'tight');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'BoxStyle','full','Layer','top','YMinorTick','on','YScale','log');
% Create colorbar
colorbar(axes1);

%%
 
% figure();
% plot(f,abs(Vout),'r','LineWidth',2);
% hold on;
% xlabel('Frequency(Hz)','FontSize',20)
% ylabel('Voltage Gain','FontSize',20)
% set(gca,'XScale','log')
% %%
% figure();
% k=1;
% D=0:0.005:1;
% Vout=4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
% plot(D,abs(Vout),'r','LineWidth',2);
% hold on;
% xlabel('Frequency(Hz)','FontSize',20)
% ylabel('Voltage Gain','FontSize',20)
% % set(gca,'XScale','log')
% 
% %%
% D=0.5:0.005:0.8;
% Co=(2*D-1);

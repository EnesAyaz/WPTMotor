clear all;
clc; 
figure2 = figure;
set(gcf,'Position',[100 100 600 400])
axes1 = axes('Parent',figure2);
hold(axes1,'on');
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

k=0.4; % chosen coupling factor
Qs=5; % unitless

Ip_rms= P_o/Vin; % primary current assuming eff=1
Is_rms=(P_o/Vout);
M=Is_rms*R_L/(w*Ip_rms); %calculated mutual inductance 
Ls=Qs*R_L/w;    % secondary coil inductance
Lp=M^2/(k^2*Ls);  %primary inductance
Cp=1/(w^2*Lp);  %primary compansation
Cs=1/(w^2*Ls);  %secondary compansation
[Lp,Ls,M]*1e6

Lp_p=Lp-M; % Henry as actually Lp-m Lp is 120u
Ls_p=Ls-M; % Henry as actually Ls-m Ls is 120u
f=40e3:1e3:120e3;
w=2*pi*f;
Z1= 1i.*w*Ls_p +R_L- 1i./(w*Cs);
Z2=1i.*w*M;
Z3= 1i.*w*Lp_p-1i./(w*Cp);
Z12= ((Z1.*Z2)./(Z1+Z2));
Z123=Z12+Z3;
V1= (Z12./Z123)*Vin; 
V_load= (R_L./(1i*w*Ls_p+R_L-1i./(w*Cs))).*V1;
Vo_angle= angle(V_load)*180/pi;
Vo_mag= abs(V_load);
Iin=Vin./Z123;
Iin_angle= angle(Iin)*180/pi;
Iin_mag= abs(Iin);


hold on; 
plot(f,Vo_mag/Vin,'Linewidth',2);


% Create ylabel
ylabel({'Output Voltage (V)'},'FontSize',14,'FontName','Times New Roman',...
    'Interpreter','latex');

% Create xlabel
xlabel({'Frequency(kHz)'},'FontSize',14,'FontName','Times New Roman',...
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
    'EdgeColor','none','Color','none');







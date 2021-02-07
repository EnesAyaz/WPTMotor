%% Analytical model without motor 

%
%   
%    |-- rp----Cp----Lp'(Lp-M)---|---Ls'(Ls-M)--Cs-|
%    |                           |                 |      
%    |                           |                 |
% --|V_in|--                  --Lm--             --RL--
%    |                           |                 | 
%    |                           |                 |
%    |---------------------------|-------rs--------|
%
%
%  Create T-model of coupled inductor at steady state
%  Sinosoidal response 
% at above circuit is represented and parameter name
% is given. I give a name Lp' as Lp_p and Ls' as Ls_p. 

% Frequency Space 
f=logspace(0,6,10000);
w=2*pi*f;

% Parameters
rp=0.3; % ohm
rs= 0.3; % ohm 
Lp=205e-6;
Ls=51e-6;
M=41e-6;
RL=8.44;
RL=8.44;
Cs=115e-9;
Cp=28.5e-9;
Lp_p=Lp-M;
Ls_p=Ls-M;
Vin=1;
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
choose ="Z";
if choose=="Ip"
    X_mag= abs(Ip);
    X_angle=angle(Ip)*180/pi;
elseif choose=="Vout"
    X_mag= abs(Vout);
    X_angle=angle(Vout)*180/pi;
elseif  choose=="Z"
    X_mag= abs(Z123);
    X_angle=angle(Z123)*180/pi;
else
    X_mag= abs(Z123);
    X_angle=angle(Z123)*180/pi;
end

% figure;
% hold on;
% yyaxis left
% plot(f,X_mag,'Linewidth',2);
% hold on; 
% set(gca, 'XScale', 'log','YScale','log')
% yyaxis right
% plot(f,X_angle,'Linewidth',2);
% xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
% grid on;
% set(gca,'FontSize',10);
% 
% hold on;
% plot(f,X_mag,'Color',[0.70,0.70,0.95],'Linewidth',4);
% set(gca, 'XScale', 'log','YScale','log')
% xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
% ylabel('Impedance(\Omega)','Interpreter','Tex','FontSize',14,'FontWeight','Bold')
% grid on;
% set(gca,'FontSize',10);

hold on;
plot(f,X_mag,'Color',[0.70,0.70,0.95],'Linewidth',4);
set(gca, 'XScale', 'log','YScale','log')
xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
ylabel('Normalized Current(A/V)','Interpreter','Tex','FontSize',14,'FontWeight','Bold')
grid on;
set(gca,'FontSize',10);

%% Analytical model with motor 

%
%   
%    |--------------|
%    |              |                                                  
%    |          --Lmotor--                     
% --|V_in|--        |                         
%    |              |                          
%    |          --Rmotor--                     
%    |--------------|
%
%
%  Create T-model of coupled inductor at steady state
%  Sinosoidal response 
% at above circuit is represented and parameter name
% is given. I give a name Lp' as Lp_p and Ls' as Ls_p. 

% Frequency Space 
f=logspace(0,6,10000);
w=2*pi*f;
% Parameters
Rmotor=2;
Lmotor=1e-3;
Vin=1;
% Impedance 

Z4= 1i.*w*Lmotor +(Rmotor); % motor impedance
Ip=Vin./Z4;
% Vout=(Z12./Z123).*(RL./Z1);
% x = 1  Ip else 
% choose="Ip";
% choose="Vout";
choose ="Z";
if choose=="Ip"
    X_mag= abs(Ip);
    X_angle=angle(Ip)*180/pi;
elseif choose=="Vout"
    X_mag= abs(Vout);
    X_angle=angle(Vout)*180/pi;
elseif  choose=="Z"
    X_mag= abs(Z4);
    X_angle=angle(Z4)*180/pi;
else
    X_mag= abs(Z4);
    X_angle=angle(Z4)*180/pi;
end

% figure;
% hold on;
% yyaxis left
% plot(f,X_mag,'Linewidth',2);
% set(gca, 'XScale', 'log','YScale','log')
% hold on; 
% yyaxis right
% plot(f,X_angle,'Linewidth',2);
% xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
% set(gca, 'XScale', 'log')
% grid on;
% set(gca,'FontSize',10);


% hold on;
% plot(f,X_mag,'Color',[0.97,0.60,0.60],'Linewidth',4);
% set(gca, 'XScale', 'log','YScale','log')
% xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
% grid on;
% set(gca,'FontSize',10);


% hold on;
% plot(f,X_mag,'Color',[0.97,0.60,0.60],'Linewidth',4);
% set(gca, 'XScale', 'log','YScale','log')
% xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
% ylabel('Normalized Current(A/V)','Interpreter','Tex','FontSize',14,'FontWeight','Bold')
% grid on;
% set(gca,'FontSize',10);

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
f=logspace(0,6,10000);
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
Vin=1;
% Impedance 
Z1= 1i.*w*Ls_p +(RL+rs)- 1i./(w*Cs); %% secondary side
Z2=1i.*w*M; % mutual inductance 
Z3= 1i.*w*Lp_p+rp-1i./(w*Cp); % primary side 
Z12= ((Z1.*Z2)./(Z1+Z2)); %% reflected secondary impedance to primary
Z123=Z12+Z3; %% total impedance 
Z4= 1i.*w*Lmotor +(Rmotor); % motor impedance
Z1234=((Z123.*Z4)./(Z123+Z4)); %

Ip=Vin./Z123;
Vout=Vin.*(Z12./Z123).*(RL./Z1);
% x = 1  Ip else 
% choose="Ip";
% choose="Vout";
choose ="Z";
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

% figure;
% hold on;
% yyaxis left
% plot(f,X_mag,'Linewidth',2);
% set(gca, 'XScale', 'log','YScale','log')
% hold on; 
% yyaxis right
% plot(f,X_angle,'Linewidth',2);
% xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
% set(gca, 'XScale', 'log')
% grid on;
% set(gca,'FontSize',10);

% 
% hold on;
% plot(f,X_mag,'-.k','Linewidth',4);
% set(gca, 'XScale', 'log','YScale','log')
% xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
% grid on;
% set(gca,'FontSize',30);
% 
% legend('WPT','Motor','WPT-Motor','FontSize',20)



% hold on;
% plot(f,X_mag,'-.k','Linewidth',4);
% set(gca, 'XScale', 'log','YScale','log')
% xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
% grid on;
% set(gca,'FontSize',30);
% 
% legend('Motor','WPT-Motor','FontSize',20)



hold on;
plot(f,X_mag,'-.k','Linewidth',4);
set(gca, 'XScale', 'log','YScale','log')
xlabel('Frequency (Hz)','FontSize',14,'FontWeight','Bold')
grid on;
set(gca,'FontSize',30);

legend('WPT','WPT-Motor','FontSize',20)

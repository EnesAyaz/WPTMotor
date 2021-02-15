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
%%
figure1 = figure;

axes1 = axes('Parent',figure1);
hold(axes1,'on');

% plot(f,abs(Z4),'Linewidth',2);

% Create loglog
loglog(f,abs(Z4),'LineWidth',2);

% Create xline
xline(32000,'Parent',axes1,'LineStyle','--','LineWidth',2);

% Create ylabel
ylabel({'Impedance ($\Omega$)'},'FontWeight','bold','FontSize',16,...
    'FontName','Times New Roman',...
    'Interpreter','latex');

% Create xlabel
xlabel({'Frequency (Hz)'},'FontWeight','bold','FontSize',16,...
    'FontName','Times New Roman',...
    'Interpreter','latex');

box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XMinorTick','on','XScale','log','YMinorTick','on','YScale','log');
% Create textarrow
annotation(figure1,'textarrow',[0.751428571428571 0.717142857142857],...
    [0.557142857142857 0.581904761904762],'String',{'32kHz'},'FontSize',12,...
    'FontName','Times New Roman');

% Create textbox
annotation(figure1,'textbox',...
    [0.403857142857143 0.823809523809525 0.349 0.0438095238095242],...
    'String',{'increasing current ripple'},...
    'FontSize',12,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textarrow
annotation(figure1,'textarrow',[0.832857142857143 0.357142857142857],...
    [0.810476190476191 0.808571428571429],'LineWidth',1);



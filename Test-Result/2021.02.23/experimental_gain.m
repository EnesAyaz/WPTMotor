load('experimental_gain_duty.mat');
Gain_D=experiment_gain;
load('experimental_gain_frequency.mat');
Gain_F=experiment_gain;

%%
Gain=[];
for i=1:length(duty)
Vout=Gain_D(i)*Gain_F;
Gain=[Gain,abs(Vout)];
end
Gain=Gain';

[x,y] = meshgrid(frequency,duty);

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
%%
D=0.5:0.05:0.90;
Frequency=[103 103 102 101 99 97 93 89 80];
Motor_Speed=[0 57 118 182 250 320 396 440 520];
Rx_current=[1.023 1.011 1.024 1.013 1 1.04 1.01 1.03];

hold on;
plot(D,Frequency,'LineStyle','None','Marker','p','MarkerSize',10, ...
    'LineWidth',2,'Color','k');



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

figure();
set(gca,'FontName','Times New Roman','FontSize',15)
set(gcf,'Position',  [100, 100, 600, 600]);
yyaxis left;
plot(D,Motor_Speed,'LineStyle','None','Marker','p',...
    'LineWidth',3,'Color','r');
hold on;
plot(D,Speed,'LineStyle','-', ...
    'LineWidth',2,'Color','r');
set(gca,'ycolor','r') 
yyaxis right;

%%
hold on;
plot(D,Frequency,'LineStyle','None','Marker','p','MarkerSize',10, ...
    'LineWidth',2,'Color','k');
set(gca,'ycolor','k')








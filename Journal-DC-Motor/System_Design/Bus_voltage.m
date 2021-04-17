figure();
Bus=100:1:320;
Tx=ones(size(Bus));
power=Bus/100;
R=50./Bus;

plot(Bus,power,'r','LineWidth',2);
hold on;
plot(Bus,Tx,'g','LineWidth',2);
hold on;
plot(Bus,R*2,'b','LineWidth',2);

% ylabel({'Normalized Value'},'FontSize',14,'FontName','Times New Roman',...
%     'Interpreter','latex');

% Create xlabel
xlabel({'Bus Voltage(V)'},'FontSize',14,'FontName','Times New Roman',...
    'Interpreter','latex');
xlim([100 320])
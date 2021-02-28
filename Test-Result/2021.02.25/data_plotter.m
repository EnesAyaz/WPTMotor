% load('D:\GoogleDrive\WPT-MOTOR\Test-Result\2021.02.25\d0.6_f80_load1\data.mat');
% load('D:\GoogleDrive\WPT-MOTOR\Test-Result\2021.02.25\d0.6_f80_load2\data.mat');
load('D:\GoogleDrive\WPT-MOTOR\Test-Result\2021.02.25\d0.6_f86_load1\data.mat');
% load('D:\GoogleDrive\WPT-MOTOR\Test-Result\2021.02.25\d0.6_f86_load2\data.mat');
% load('D:\GoogleDrive\WPT-MOTOR\Test-Result\2021.02.25\d0.75_f77_load1\data.mat');
% load('D:\GoogleDrive\WPT-MOTOR\Test-Result\2021.02.25\d0.75_f77_load2\data.mat');
%%
figure();
ts=motor_envelope.time(2)-motor_envelope.time(1);
time=0:ts:ts*(length(motor_envelope.data)-1);
set(gcf, 'Position',  [100, 100, 600, 300])
plot(time*1000,-motor_envelope.data,...
    'LineWidth',0.5,'Color','r');
ylim([0 6])
set(gca,'FontSize',12)
xlabel('Time(ms)','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
ylabel('Current(A)','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
title('Motor Current','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
grid on;
saveas(gcf,'motor_envelope.emf');
%%

figure();
ts=Tx_envelope.time(2)-Tx_envelope.time(1);
time=0:ts:ts*(length(Tx_envelope.data)-1);
set(gcf, 'Position',  [100, 100, 300, 150])
plot(time*1000,Tx_envelope.data,...
    'LineWidth',0.5,'Color','r');
ylim([-6 6])
set(gca,'FontSize',12)
xlabel('Time(ms)','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
ylabel('Current(A)','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
title('Transmitter Current','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
grid on;
saveas(gcf,'Tx_envelope.emf')
%%

figure();
ts=Rx_envelope.time(2)-Rx_envelope.time(1);
time=0:ts:ts*(length(Rx_envelope.data)-1);
set(gcf, 'Position',  [100, 100, 300, 150])
plot(time*1000,Rx_envelope.data,...
    'LineWidth',0.5,'Color','r');
ylim([-6 6])
set(gca,'FontSize',12)
xlabel('Time(ms)','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
ylabel('Current(A)','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
title('Receiver Current','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
grid on;
saveas(gcf,'Rx_envelope.emf')
%%
figure();
ts=Tx_zoom.time(2)-Tx_zoom.time(1);
time=0:ts:ts*(length(Tx_zoom.data)-1);
set(gcf, 'Position',  [100, 100, 300, 150])
plot(time*1e6,Tx_zoom.data,...
    'LineWidth',1,'Color','r');
xlim([0 50])
ylim([-6 6])
set(gca,'FontSize',12)
xlabel('Time($\mu$s)','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
ylabel('Current(A)','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
title('Transmitter Current','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
grid on;
saveas(gcf,'Tx_zoom.emf')

%%

figure();
ts=Rx_zoom.time(2)-Rx_zoom.time(1);
time=0:ts:ts*(length(Rx_zoom.data)-1);
set(gcf, 'Position',  [100, 100, 300, 150])
plot(time*1e6,Rx_zoom.data,...
    'LineWidth',1,'Color','r');
xlim([0 50])
ylim([-6 6])
set(gca,'FontSize',12)
xlabel('Time($\mu$s)','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
ylabel('Current(A)','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
title('Receiver Current','Interpreter','Latex','FontName','Times New Roman',...
    'FontSize',16);
grid on;
saveas(gcf,'Rx_zoom.emf')

%%
% figure();
% subplot(3,1,1)
% plot(motor_envelope.time,motor_envelope.data,...
%     'LineWidth',3,'Color','r');
% ylim([0 5])
% set(gca, 'XTick',[]);
% subplot(3,1,2)
% plot(Tx_envelope.time,Tx_envelope.data, ...
%     'LineWidth',1,'Color','g');
% ylim([-4 4])
% set(gca, 'XTick',[]);
% subplot(3,1,3)
% plot(Rx_envelope.time,Rx_envelope.data, ...
%     'LineWidth',1,'Color','b');
% ylim([-3 3])

%
% figure();
% plot(motor_envelope.time,motor_envelope.data,...
%     'LineWidth',3,'Color','r');
% ylim([0 6])
% 
% 
% figure();
% subplot(2,2,1)
% plot(Tx_envelope.time,Tx_envelope.data, ...
%     'LineWidth',1,'Color','r');
% ylim([-4 4])
% 
% subplot(2,2,2)
% plot(Tx_zoom.time,Tx_zoom.data, ...
%     'LineWidth',1,'Color','b');
% ylim([-4 4])
% 
% subplot(2,2,3)
% plot(Rx_envelope.time,Rx_envelope.data, ...
%     'LineWidth',1,'Color','r');
% ylim([-3 3])
% 
% subplot(2,2,4)
% plot(Rx_zoom.time,Rx_zoom.data, ...
%     'LineWidth',1,'Color','b');
% ylim([-3 3])



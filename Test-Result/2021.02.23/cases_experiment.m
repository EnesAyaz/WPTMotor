x=1:5;
xtick= {'A','B','C','D','E'};
Freq=[98 80 80 98 110];
duty=[0.7 0.9 0.9 0.7 0.7];
Tx=[1.724 1.28 1.31 1.724 1.211];
Rx=[1.066 1.037 1.044 1.08 0.67];
Im=[2.05 3.12 4.58 2.7 2.64];
N=[243 501 480 250 242];


figure();
set(gca,'FontName','Times New Roman','FontSize',12)
set(gcf,'Position',  [100, 100, 500, 300]);
yyaxis left;
plot(x,Freq,'LineStyle','none','Marker','p','MarkerSize',5,...
    'LineWidth',3,'Color','r');
set(gca,'ycolor','r') 
ylim([0 120]);
ylabel('Frequency(kHz)','Interpreter','Latex','FontName','Times New Roman','FontSize',14)

yyaxis right;
hold on;
plot(x,duty,'LineStyle','none','Marker','s','MarkerSize',8, ...
    'LineWidth',2,'Color','b');
set(gca,'ycolor','b') 
ylim([0 1]);
ylabel('Duty Cycle','Interpreter','Latex','FontName','Times New Roman','FontSize',14)

xticks([1 2 3 4 5])
xticklabels(xtick)
xlabel('Case','Interpreter','Latex','FontName','Times New Roman','FontSize',14)
grid on

%%


figure();
set(gca,'FontName','Times New Roman','FontSize',12)
set(gcf,'Position',  [100, 100, 500, 300]);
yyaxis left;
plot(x,Rx,'LineStyle','-','Marker','p','MarkerSize',5,...
    'LineWidth',3,'Color','r');
hold on;
plot(x,Im,'LineStyle','-','Marker','o','MarkerSize',5,...
    'LineWidth',3,'Color','r');
set(gca,'ycolor','r') 

ylabel('Current(A)','Interpreter','Latex','FontName','Times New Roman','FontSize',14)

yyaxis right;
hold on;
plot(x,N,'LineStyle','-','Marker','s','MarkerSize',8, ...
    'LineWidth',2,'Color','b');
set(gca,'ycolor','b') 
ylabel('Motor Speed','Interpreter','Latex','FontName','Times New Roman','FontSize',14)
ylim([0 600])
xticks([1 2 3 4 5])
xticklabels(xtick)
xlabel('Case','Interpreter','Latex','FontName','Times New Roman','FontSize',14)
grid on
%%
figure();
set(gca,'FontName','Times New Roman','FontSize',12)
set(gcf,'Position',  [100, 100, 500, 500]);
subplot(3,1,1)
plot(x,Rx.*Rx*8.44,'LineStyle','-','Marker','p','MarkerSize',5,...
    'LineWidth',3,'Color','r');
ylabel('Power(W)','Interpreter','Latex','FontName','Times New Roman','FontSize',14)
xticks([1 2 3 4 5])
xticklabels(xtick)
ylim([0 20])
xlabel('Case','Interpreter','Latex','FontName','Times New Roman','FontSize',14)
grid on


subplot(3,1,2)
plot(x,Im,'LineStyle','-','Marker','o','MarkerSize',5,...
    'LineWidth',3,'Color','r');
ylabel('Current(A)','Interpreter','Latex','FontName','Times New Roman','FontSize',14)
ylim([0 6])
xticks([1 2 3 4 5])
xticklabels(xtick)
xlabel('Case','Interpreter','Latex','FontName','Times New Roman','FontSize',14)
grid on


subplot(3,1,3)
plot(x,N,'LineStyle','-','Marker','s','MarkerSize',8, ...
    'LineWidth',2,'Color','b');
ylabel('Motor Speed','Interpreter','Latex','FontName','Times New Roman','FontSize',14)
ylim([0 600])

xticks([1 2 3 4 5])
xticklabels(xtick)
xlabel('Case','Interpreter','Latex','FontName','Times New Roman','FontSize',14)
grid on

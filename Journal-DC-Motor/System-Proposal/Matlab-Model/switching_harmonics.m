D=0:0.005:1;
Co=(2*D-1);
figure1 = figure;
set(gcf,'position',[100 100 600 300])

k=1;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,Co,'LineWidth',2)
hold on;
plot(D,abs(Ck),'LineWidth',2)
hold on;

k=2;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,abs(Ck),'LineWidth',2)
hold on;

k=3;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,abs(Ck),'LineWidth',2)
hold on;

k=4;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,abs(Ck),'LineWidth',2)
hold on;
%%
ylabel({'Gain ($\frac{Vin}{Vdc}$)'},'FontSize',12,...
    'FontName','Times New Roman',...
    'Interpreter','latex');

xlabel('Duty Cycle','FontSize',12,'FontName','Times New Roman',...
    'Interpreter','latex');
%%
set(gca,'FontName','Times New Roman','FontSize',12);
%%
legend1=legend('DC','1st','2nd','3rd','4th');
set(legend1,...
    'Location','southeast',...
    'Interpreter','latex',...
    'FontSize',9,'FontName','Times New Roman',...
    'EdgeColor','none', 'Color','none');
% grid on;

D=0:0.005:1;
Co=(2*D-1);
figure1 = figure;

k=1;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,Co,'LineWidth',3)
hold on;
plot(D,abs(Ck),'LineWidth',3)
hold on;

k=2;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,abs(Ck),'LineWidth',3)
hold on;

k=3;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,abs(Ck),'LineWidth',3)
hold on;

k=4;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,abs(Ck),'LineWidth',3)
hold on;
%%
ylabel({'Normalized ','Output Voltage'},'FontSize',20,...
    'FontName','Times New Roman',...
    'Interpreter','latex');

xlabel('Duty Cycle','FontSize',20,'FontName','Times New Roman',...
    'Interpreter','latex');
%%
set(gca,'FontName','Times New Roman','FontSize',16);
%%
legend1=legend('DC','1st','2nd','3rd','4th');
set(legend1,...
    'Position',[0.745086986883233 0.196995957203963 0.123516501061622 0.243785856330828],...
    'Interpreter','latex',...
    'FontSize',12,...
    'EdgeColor','none');
grid on;

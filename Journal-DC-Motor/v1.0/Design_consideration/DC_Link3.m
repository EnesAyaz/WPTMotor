Itx=1.7;
Im=7;
fourier_motor=[];
fourier_tx_r=[];
fourier_tx_l=[];
Dx=[];
for D=0.1:0.01:0.9
Dx=[Dx D];
fourier_series_motor=[];
fourier_series_tx_r=[];
fourier_series_tx_l=[];
for k=1:1:6
    Sm=2*(sin(k*pi*D)./(k*pi))*(D-0.5)*Im*2;
%     Sm=2*(sin(k*pi*D)./(k*pi))*5;
    Stx_r=2*(sin(k*pi*D)./(k*pi))*Itx/2;
    Stx_l=2*(sin(k*pi*D)./(k*pi))*Itx/2;
    fourier_series_motor=[fourier_series_motor,Sm]; 
    fourier_series_tx_r=[fourier_series_tx_r,Stx_r]; 
    fourier_series_tx_l=[fourier_series_tx_l,Stx_l]; 
end
    fourier_motor=[fourier_motor;fourier_series_motor];
    fourier_tx_r=[fourier_tx_r; fourier_series_tx_r];
    fourier_tx_l=[fourier_tx_l; fourier_series_tx_l];
end


fourier_tx=[zeros(length(Dx),1),zeros(length(Dx),1),fourier_tx_r]+ ...
      [fourier_tx_l,zeros(length(Dx),1),zeros(length(Dx),1)];
fourier_tx=fourier_tx;
fourier_tx(:,2)=fourier_tx(:,2)+(Dx*Itx-(1-Dx)*Itx)';
%%
figure1 = figure;
set(gcf,'Position',[10 10 300 300])
axes1 = axes('Parent',figure1);
hold(axes1,'on');
for k=2:1:5
hold on;
plot(Dx,abs(fourier_tx(:,k))/sqrt(2),'LineWidth',2)
end
ylabel({'Capacitor Current ($A_{RMS}$)'},'FontSize',10,...
    'FontName','Times New Roman',...
    'Interpreter','latex');

xlabel('Duty Cycle','FontSize',11,'FontName','Times New Roman',...
    'Interpreter','latex');
set(gca,'FontName','Times New Roman','FontSize',11);
legend1=legend('$1^{st}$','$2^{nd}$','$3^{rd}$','$4^{th}$');
set(legend1,...
    'Location','best',...
    'Interpreter','latex',...
    'FontSize',10,...
    'EdgeColor','none','Color','none');
set(axes1,'FontName','Times New Roman','FontSize',11,'XTick',...
    [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9]);
xlim([0.1 0.9])
ylim([0 2.5])
%%
figure1 = figure;
set(gcf,'Position',[10 10 300 300])
axes1 = axes('Parent',figure1);
hold(axes1,'on');

for k=1:1:4
hold on;
plot(Dx,abs(fourier_motor(:,k))/sqrt(2),'LineWidth',2)
end
ylabel({'Capacitor Current ($A_{RMS}$)'},'FontSize',11,...
    'FontName','Times New Roman',...
    'Interpreter','latex');

xlabel('Duty Cycle','FontSize',11,'FontName','Times New Roman',...
    'Interpreter','latex');
set(gca,'FontName','Times New Roman','FontSize',11);
legend1=legend('$1^{st}$','$2^{nd}$','$3^{rd}$','$4^{th}$');
set(legend1,...
    'Location','best',...
    'Interpreter','latex',...
    'FontSize',10,...
    'EdgeColor','none','Color','none');

set(axes1,'FontName','Times New Roman','FontSize',11,'XTick',...
    [0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9]);

xlim([0.1 0.9])
ylim([0 2.5])


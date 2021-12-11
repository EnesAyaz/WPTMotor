modulation=0:0.1:1;

Itx_wOutControl=[590 586 578 565 557 542 531 529 534 550 586.9];

phase_wOutControl=[40 40 40 40 40 40 40 40 40 40 40];

phase_withControl=[41 41.2 41.8 42.7 44 45.7 47.5 49 50 51 46];

Itx_withControl=[603 602 602 604 603 602 602 599 597 596 597];


%%

figure1 = figure;
figure1.Position = [0 0 400 200];
axes1 = axes('Parent',figure1);
hold(axes1,'on');

yyaxis left;
plot(modulation,Itx_wOutControl/603,'-','Color',[1 0 0.5],'LineWidth',1,'Marker','o');
hold on;
plot(modulation,Itx_withControl/603,'-','Color',[1 0 0.5],'LineWidth',1,'Marker','x')
ylim([0 1.05])
set(axes1,'YColor',[1 0 0.5]);

ylabel('Normalized Power ','Interpreter','Latex','FontName','Times New Roman','FontSize',12)

yyaxis right;
plot(modulation,phase_wOutControl,'-','Color',[0.5 0 1],'LineWidth',1,'Marker','o')
hold on;
plot(modulation,phase_withControl,'-','Color',[0.5 0 1],'LineWidth',1,'Marker','x')
ylim([0 95]);


set(axes1,'YColor',[0.5 0 1],'YTick',[0 15 30 45 60 75 90],'YTickLabel',...
    {'0','15','30','45','60','75','90'});

ylabel('Carrier Phase Shift ($^o$)','Interpreter','Latex','FontName','Times New Roman','FontSize',12)

box(axes1,'on');
hold(axes1,'off');
grid off;
xlabel('Modulation indices','Interpreter','Latex','FontName','Times New Roman','FontSize',12)

legend('IPT Power with CPS','IPT Power with VPS','CPS','VPS', 'Position', ...
   [0.480416669006149 0.213194482922554 0.372499992698431 0.30749999165535],...
    'EdgeColor','none',...
    'Color','none')



modulation=0:0.1:1;

Itx_wOutControl=[590 586 578 565 557 542 531 529 534 550 586.9];

phase_wOutControl=[40 40 40 40 40 40 40 40 40 40 40];

phase_withControl=[41 41.2 41.8 42.7 44 45.7 47.5 49 50 51 46];

Itx_withControl=[603 602 602 604 603 602 602 599 597 596 597];

%%
figure1 = figure;
figure1.Position = [0 0 600 200];
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(modulation,Itx_wOutControl/603,'-','Color',[1 0 0],'LineWidth',1,'Marker','o','MarkerSize',6);
hold on;
plot(modulation,Itx_withControl/603,'-','Color',[0 0 1],'LineWidth',1,'Marker','x','MarkerSize',10)
ylabel('Normalized Power ','Interpreter','Latex','FontName','Times New Roman','FontSize',12)
ylim([0 1.05])
% 
% set(axes1,'YColor',[0.5 0 1],'YTick',[0 15 30 45 60 75 90],'YTickLabel',...
%     {'0','15','30','45','60','75','90'});

set(axes1,'Xtick',0:0.1:1,'XtickLabel',[""],'GridAlpha',1,'GridColor',[0 0 0])
box(axes1,'on');
hold(axes1,'off');
grid on;
% xlabel('Modulation indices','Interpreter','Latex','FontName','Times New Roman','FontSize',12)
legend('Constant Carrier Phase Shift','Variable Carrier Phase Shift','Interpreter','Latex','FontSize',12,...
    'FontName','Times New Roman','Location','Best','EdgeColor','none',...
    'Color','none')


%%

figure1 = figure;
figure1.Position = [0 0 600 200];
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(modulation,phase_wOutControl,'-','Color',[1 0 0],'LineWidth',1,'Marker','o','MarkerSize',6);
hold on;
plot(modulation,phase_withControl,'-','Color',[0 0 1],'LineWidth',1,'Marker','x','MarkerSize',10)
ylabel('Carrier Phase Shift','Interpreter','Latex','FontName','Times New Roman','FontSize',12)
ylim([0 90])
% 
% set(axes1,'YColor',[0.5 0 1],'YTick',[0 15 30 45 60 75 90],'YTickLabel',...
%     {'0','15','30','45','60','75','90'});

set(axes1,'Xtick',0:0.1:1,'GridAlpha',1,'GridColor',[0 0 0],'YTick',[0 15 30 45 60 75 90])
box(axes1,'on');
hold(axes1,'off');
grid on;
xlabel('Modulation indices','Interpreter','Latex','FontName','Times New Roman','FontSize',12)


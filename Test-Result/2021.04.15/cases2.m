x=1:6;
xtick= {'A','B','C','D','E','F','G'};
Freq=[95 90 90 95 90 90 97.5];
duty=[0.6 0.75 0.75 0.6 0.6 0.6 0.5];
Im=[2.09 2.38 3.25 1.82 1.84 1.48 0];
T=Im*0.1157;
VRx=[20 20.1 20.1 20 26.9 26.9 21.2];

%%
IPT_Power=VRx.*VRx/8;
Motor_Power=duty.*Im*100;
i=1;
y = [Motor_Power(1),IPT_Power(1); Motor_Power(2),IPT_Power(2); ...
    Motor_Power(3),IPT_Power(3); Motor_Power(4),IPT_Power(4);...
    Motor_Power(5),IPT_Power(5);Motor_Power(6),IPT_Power(6); Motor_Power(7),IPT_Power(7)];
y=round(y)
% y= [102  42;...
%   235   42;...
%   354  42;...
%   140   42;...
%   140  72;...
%   103   72];
figure1 = figure;
axes1 = axes('Parent',figure1);
hold(axes1,'on')

% bar1=bar(y,'stacked');

bar1=bar(y);
xtips1 = bar1(1).XEndPoints;
ytips1 = bar1(1).YEndPoints;
labels1 = string(bar1(1).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
xtips2 = bar1(2).XEndPoints;
ytips2 = bar1(2).YEndPoints;
labels2 = string(bar1(2).YData);
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')

set(bar1(1),'DisplayName','Motor Power');
set(bar1(2),'DisplayName','IPT Power');
bar1(1).FaceColor = [1 0 0];
bar1(2).FaceColor = [0 0 1];
ylim([0 500])
% Create xlabel
xlabel('Cases','FontSize',16,'Interpreter','latex');
ylabel('Power(Watt)','FontSize',16,'Interpreter','latex');
box(axes1,'on');
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',16,'XTick',[1 2 3 4 5 6],...
    'XTickLabel',{'A','B','C','D','E','F','G'});
legend1 = legend(axes1,'show');
set(legend1,'Interpreter','latex','EdgeColor','none');

% figure();
% set(gca,'FontName','Times New Roman','FontSize',12)
% set(gcf,'Position',  [100, 100, 500, 500]);
% subplot(2,1,1)
% plot(x,Rx.*Rx*8.44,'LineStyle','-','Marker','p','MarkerSize',5,...
%     'LineWidth',3,'Color','r');
% ylabel('IPT Power(Watt)','Interpreter','Latex','FontName','Times New Roman','FontSize',14)
% xticks([1 2 3 4 5 6])
% xticklabels(xtick)
% xlabel('Case','Interpreter','Latex','FontName','Times New Roman','FontSize',14)
% grid on
% 
% subplot(2,1,2)
% plot(x,duty.*Im*100,'LineStyle','-','Marker','o','MarkerSize',5,...
%     'LineWidth',3,'Color','r');
% ylabel('Motor Power(Watt)','Interpreter','Latex','FontName','Times New Roman','FontSize',14)
% xticks([1 2 3 4 5 6])
% xticklabels(xtick)
% xlabel('Case','Interpreter','Latex','FontName','Times New Roman','FontSize',14)
% grid on


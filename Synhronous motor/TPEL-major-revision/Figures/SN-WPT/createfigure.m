function createfigure(X1, YMatrix1)
%CREATEFIGURE(X1, YMatrix1)
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data

%  Auto-generated by MATLAB on 28-Apr-2023 15:25:55

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.13 0.112380952380952 0.775 0.815]);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(X1,YMatrix1,'LineWidth',1,'Parent',axes1);
set(plot1(1),'LineStyle','--','Color',[0 0 1]);
set(plot1(2),'Color',[0 0 1]);
set(plot1(3),'Color',[0 0 0]);
set(plot1(4),'Color',[1 0 0]);
set(plot1(5),'LineStyle','--','Color',[1 0 0]);

% Create ylabel
ylabel({'Normalized gain'});

% Create xlabel
xlabel({'Normalized frequency'});

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0.8 1.2]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 1]);
box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',15);
% Create textarrow
annotation(figure1,'textarrow',[0.716071428571425 0.864285714285714],...
    [0.41428571428572 0.635714285714286],'Color',[0 0 1],...
    'TextBackgroundColor',[1 1 1],...
    'String',{'Decreasing','capacitance'},...
    'FontSize',15,...
    'FontName','Times');

% Create textarrow
annotation(figure1,'textarrow',[0.507142857142857 0.514285714285713],...
    [0.214285714285714 0.923809523809526],'String',{'Designed system'},...
    'FontSize',15,...
    'FontName','Times');

% Create textarrow
annotation(figure1,'textarrow',[0.30892857142857 0.183928571428571],...
    [0.421428571428573 0.569047619047619],'Color',[1 0 0],...
    'TextBackgroundColor',[1 1 1],...
    'String',{'Increasing','capacitance'},...
    'FontSize',15,...
    'FontName','Times');


% ma =0:0.1:1;
% 
% mean = [  8.6686 8.6629 8.6631 8.6644 8.6606 8.6519 8.7112 8.6505 8.6473 9.3847 9.404];
% 
% maxmin= [ 1.0152 1.0824 0.9978 1.1349 2.8171 2.1173 3.3178 4.7611 5.9359 176.5942 133.1907];
% 
% 
% plot(ma,mean)

%% simualation

fsw=50e3;
ffund=100;

modulation= 0:0.1:1;
% 
% A= [    0.0112    0.4371    0.0000 ;
%     0.0127    0.4383    0.0853 ;
%     0.0154    0.4401    0.1739 ;
%     0.0075    0.4407    0.2599 ;
%     0.0087    0.4396    0.3462 ;
%     0.0103    0.4406    0.4334 ;
%     0.0063    0.4402    0.5199 ;
%     0.0069    0.4400    0.6064 ; 
%     0.0134    0.4396    0.6928 ; 
%     0.1741    0.4405    0.7794; 
%     0.5912    0.4231    0.8651 ; ];
% 
% ripple_fsw=A(:,1);
% mean_fsw=A(:,2);
% peak_ffund=A(:,3);


mean_fsw = [  8.6686 8.6629 8.6631 8.6644 8.6606 8.6519 8.7112 8.6505 8.6473 9.3847 9.404]/20;

ripple_fsw= [ 1.0152 1.0824 0.9978 1.1349 2.8171 2.1173 3.3178 4.7611 5.9359 176.5942 133.1907 ];

% ripple_fsw= [ 1.0152 1.0824 0.9978 1.1349 2.8171 2.1173 3.3178 4.7611 5.9359 176.5942 NaN ];

peak_ffund = [0 1.71 3.43 5.14 6.78 8.55 10.3 12 13.73 15.35 17.1851 ]/20;


%%
% yyaxis left
% plot(modulation,mean_fsw)
% hold on;
% plot(modulation,peak_ffund)
% hold on;
% ylim([0 1])
% yyaxis right
% plot(modulation,100*(ripple_fsw./mean_fsw))

%     'Position',[0.129953416149068 0 0.775 0.815],...
figure1 = figure()
% Create axes
axes1 = axes('Parent',figure1,...
    'YTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]);
hold(axes1,'on');
colororder([0 0.447 0.741]);

% Activate the left side of the axes
yyaxis(axes1,'left');
% Create multiple lines using matrix input to plot
plot1 = plot(modulation,mean_fsw,'MarkerFaceColor',[0 0 0.75],'MarkerSize',8,...
    'LineWidth',0.1,...
    'Color',[0 0 0.749019607843137]);
hold on;
plot2 = plot(modulation,peak_ffund,'MarkerFaceColor',[0 0 0.75],'MarkerSize',8,...
    'LineWidth',0.1,...
    'Color',[0 0 0.50]);
set(plot1,'DisplayName','$ \hat{S}_{AB_{fs}} $','Marker','square');
set(plot2,'DisplayName','$ \hat{S}_{AB_{fo}} $','Marker','pentagram');

% Create ylabel
ylabel({'Normalized Magnitude ($ \frac{V}{V_{DC}}$)'},'FontSize',20,...
    'Interpreter','latex');
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 1]);

% Set the remaining axes properties
set(axes1,'YColor',[0 0 0.50],'YTick',...
    [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]);
% Activate the right side of the axes
yyaxis(axes1,'right');
% Create plot
plot(modulation,ripple_fsw,...
    'DisplayName','  $  100 \frac{\tilde{S}_{AB_{fs}}} { \hat{S}_{AB_{fs}} } $',...
    'MarkerFaceColor',[0.75 0 0],...
    'MarkerSize',8,...
    'Marker','diamond',...
    'Color',[0.50 0 0]);
ylim([0 200])

% Create ylabel
ylabel('Normalized Ripple at $S_{AB_{fs}} $  ($\%$)','FontSize',20,...
    'Interpreter','latex');

% Set the remaining axes properties
set(axes1,'YColor',[0.50 0 0]);
% Create xlabel
xlabel('Modulation index','FontSize',20);

hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',16,'GridAlpha',0.2,...
    'GridColor',[0.75 0 0.75],'GridLineStyle','--','XGrid','on','XTick',...
    [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1],'YGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.215926231554015 0.581348254572686 0.190347331107706 0.299781720046281],...
    'Interpreter','latex',...
    'FontSize',18);

%%

modulation= 0:0.1:1;

 A= [    0         0         0    ;
      0.0066    0.0038    0.0837 ; 
      0.0268    0.0165    0.1712 ;
      0.0604    0.0374    0.2581 ;
      0.1059    0.0660    0.3449 ;
      0.1618    0.1017    0.4317 ;
      0.2278    0.1435    0.5184 ;
      0.3024    0.1904    0.6051 ;
      0.3830    0.2411    0.6917 ;
      0.4675    0.2947    0.7785 ;
      0.5551    0.3495    0.8652 ;] ;

ripple_fsw=A(:,1);
mean_fsw=A(:,2);
peak_ffund=A(:,3);
% 
%     'Position',[0.129953416149068 0 0.775 0.815],...
figure2 = figure()
% Create axes
axes1 = axes('Parent',figure2,...
    'YTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]);
hold(axes1,'on');
colororder([0 0.447 0.741]);

% Activate the left side of the axes
yyaxis(axes1,'left');
% Create multiple lines using matrix input to plot
plot1 = plot(modulation,mean_fsw,'MarkerFaceColor',[0 0 0.75],'MarkerSize',8,...
    'LineWidth',0.1,...
    'Color',[0 0 0.50]);
hold on;
plot2 = plot(modulation,peak_ffund,'MarkerFaceColor',[0 0 1],'MarkerSize',8,...
    'LineWidth',0.1,...
    'Color',[0 0 0.50]);
set(plot1,'DisplayName','$ \hat{S}_{AB_{fs}} $','Marker','square');
set(plot2,'DisplayName','$ \hat{S}_{AB_{fo}} $','Marker','pentagram');

% Create ylabel
ylabel({'Normalized Magnitude ($ \frac{V}{V_{DC}}$)'},'FontSize',20,...
    'Interpreter','latex');
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 1]);

% Set the remaining axes properties
set(axes1,'YColor',[0 0 0.50],'YTick',...
    [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]);
% Activate the right side of the axes
yyaxis(axes1,'right');
% Create plot
plot(modulation,100*(ripple_fsw./mean_fsw),...
    'DisplayName','  $  100 \frac{\tilde{S}_{AB_{fs}}} { \hat{S}_{AB_{fs}} } $',...
    'MarkerFaceColor',[0.75 0 0],...
    'MarkerSize',8,...
    'Marker','diamond',...
    'Color',[0.50 0 0]);

ylim([0 200])
% Create ylabel
ylabel('Normalized Ripple at $S_{AB_{fs}} $  ($\%$)','FontSize',20,...
    'Interpreter','latex');

% Set the remaining axes properties
set(axes1,'YColor',[0.50 0 0]);
% Create xlabel
xlabel('Modulation index','FontSize',20);

hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',16,'GridAlpha',0.2,...
    'GridColor',[0.75 0 0.75],'GridLineStyle','--','XGrid','on','XTick',...
    [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1],'YGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.215926231554015 0.581348254572686 0.190347331107706 0.299781720046281],...
    'Interpreter','latex',...
    'FontSize',18);


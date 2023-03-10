%%
Vdc=100;
m=1; % carrier
n=2; % fundamental
ma=0:0.01:1;
mag_f=ma/2;
mag_fsw=2*m*besselj(0,ma*pi/2)/pi;
mag_side=abs(2.*besselj(n,m*ma*pi/2)/(m*pi));
% mag_side=2.*besselj(n,m*ma*pi/2)/(m*pi);
mag_fund=sqrt(3).*ma/2;

%%

figure1 = figure('Position',[0 0 500 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create multiple lines using matrix input to plot
plot1 = plot(ma,mag_f,'LineWidth',1.5,'Parent',axes1);
plot2 = plot(ma,mag_fsw,'LineWidth',1.5,'Parent',axes1);
plot3 = plot(ma,mag_side,'LineWidth',1.5,'Parent',axes1);
ylim([0 1])

set(plot1,'DisplayName','U_r','Color',[0.501960784313725 0 0]);
set(plot2,'DisplayName','U_c','Color',[0 0 0.501960784313725]);
set(plot3,'DisplayName','U_l / U_h','Color',[0 0.501960784313725 0]);


ylabel('Normalized Magnitude','FontName','Times New Roman',...
    'Interpreter','latex');

% Create xlabel
xlabel('Modulation Index ($ma$)','FontName','Times New Roman',...
    'Interpreter','latex');

% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 1]);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'BoxStyle','full','FontName','Times New Roman','FontSize',14,...
    'GridAlpha',0.5,'GridColor',[0.0705882352941176 0.619607843137255 1],...
    'Layer','top','MinorGridAlpha',1,'MinorGridColor',...
    [0.0745098039215686 0.623529411764706 1],'XGrid','on','XMinorGrid','on',...
    'YGrid','on','YMinorGrid','on');
% Create legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.656845242272884 0.593650800462755 0.232142852938601 0.31666665772597],...
    'EdgeColor','none');
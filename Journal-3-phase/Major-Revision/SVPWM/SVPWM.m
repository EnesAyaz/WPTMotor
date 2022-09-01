
figure('Position', [0 0 600 300]);
mag=[ 0.6366    0.6317    0.6157    0.5890    0.5527    0.5071    0.4532    0.3925    0.3260    0.2550    0.1814];
mx=0:0.1:1;
plot(mx,mag)

mx=[];

V_sw_phi=[];
for ma=0:0.1:1
    mx=[mx ma];
    V_sw_phi=[V_sw_phi, (2/pi).* besselj(0,ma*pi/2)];
end
hold on; 
plot(mx,V_sw_phi)

legend('SVPWM','SPWM')

ylim([0 1])
set(gca,'FontName','Times New Roman','FontSize',12)
xlabel('$m_a$','Interpreter','Latex', 'FontName','Times New Roman', 'FontSize',20)
ylabel('$\frac{V_{l-n}}{V_{DC}}$', ...
    'Interpreter','Latex', 'FontName','Times New Roman', 'FontSize',20)

%%
figure1 = figure('Position', [0 0 800 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(mx,mag,'LineWidth',1,'Color',[0.5 0 0],'LineStyle','-','Marker','x', 'MarkerSize',15, ...
    'MarkerEdgeColor',[0.5 0 0],'MarkerFaceColor',[0.5 0 0] );


plot(mx,V_sw_phi,'LineWidth',1,'Color',[0 0 0.5],'LineStyle','-','Marker','o', 'MarkerSize',8, ...
    'MarkerEdgeColor',[0 0 0.5],'MarkerFaceColor','none' );

ylim(axes1,[0 1]);

box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
legend({'SVPWM','SPWM'},'Interpreter','Latex', 'FontName','Times New Roman', 'FontSize',15)
set(axes1,'FontName','Times New Roman','FontSize',15,'GridColor',[0 0 0],'GridAlpha',0.5,'GridLineStyle','--', ...
    'YTick',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1]);
xlabel('$m_a$','Interpreter','Latex', 'FontName','Times New Roman', 'FontSize',25)
ylabel('$\frac{V_{l-n}}{V_{DC}}$', ...
    'Interpreter','Latex', 'FontName','Times New Roman', 'FontSize',30)

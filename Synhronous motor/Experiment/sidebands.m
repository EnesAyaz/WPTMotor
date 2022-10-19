
ffund=100;

time=0:1e-6:1/ffund;

fsw=80e3;

fl= fsw-2*ffund;
fh= fsw+2*ffund;


B=0.6;
Al=0;
Ah=0;

sinx_t=Al*sin(2*pi*fl*time)+Ah*sin(2*pi*fh*time)+B*sin(2*pi*fsw*time);

figure1 = figure('Position',[0 0 500 200]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(time,sinx_t,'Color',[0 0 0.5],'LineWidth',0.1);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Color','white','FontName','Times New Roman','FontSize',12,...
    'GridAlpha',0.3,'GridColor',[0 0 0],'XGrid','on','YGrid','on');

% text(1:length(P1),P1,num2str(P1'),'vert','bottom','horiz','center'); 
ylabel('Voltage (V)','Interpreter','Latex','FontSize',14)
xlabel('Time (ms)','Interpreter','Latex','FontSize',14)

ylim([-1 1])

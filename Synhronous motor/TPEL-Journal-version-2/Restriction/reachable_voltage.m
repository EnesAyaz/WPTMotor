theta_f1=0:0.01:2*pi;
dead_time=0.02;

x1=[];
y1=[];
ma=[];
for m=0:0.02:1
n=0;
D1=(1+m*sin(theta_f1)+(n/6)*sawtooth(3*theta_f1+pi/2,1/2))/2;
D1(D1<dead_time)=dead_time;
D1(D1>(1-dead_time))=1-dead_time;
% S1=(2/pi)*sin(pi*D1)*cos(theta_c);
S1=(2/pi)*sin(pi*(D1));
theta_f2=theta_f1-2*pi/3;
D2=(1+m*sin(theta_f2)+(n/6)*sawtooth(3*theta_f2+pi/2,1/2))/2;
D2(D2<dead_time)=dead_time;
D2(D2>(1-dead_time))=1-dead_time;
D2=(1+m*sin(theta_f2)+(n/6)*sawtooth(3*theta_f2+pi/2,1/2))/2;
S2=(2/pi)*sin(pi*(D2));

x = min(abs(S1+S2));
y =max(abs(S1-S2));

x1=[x1 x];
y1=[y1 y];
ma=[ma m];
end 
%%
figure1 = figure('Position', [0 0 600 300]);
axes1 = axes('Parent',figure1);
plot(ma,x1,'Color',[0 1 0],'LineWidth',4)
hold on;
plot(ma,y1,'Color',[0 0 1],'LineWidth',4)
patch('Parent',axes1, 'XData', [ma fliplr(ma)],'YData', [x1 fliplr(y1)],'FaceColor',[0 0.5 0.5],...
    'EdgeColor','none','FaceAlpha',0.3)
hold on;
patch('XData',[ma fliplr(ma)],'YData', [x1 max(1.4)*ones(size(x1))],'FaceColor',[0.6 0 0],'EdgeColor','none','FaceAlpha',1')
patch('XData',[ma fliplr(ma)],'YData', [y1 min(0)*ones(size(x1))],'FaceColor',[0.6 0 0],'EdgeColor','none','FaceAlpha',1')


box(axes1,'on');
hold(axes1,'off');

xlim([0 1])
ylim([0 1.3])

set(axes1,'XTick',[0 0.25 0.5 0.75 1], ...
    'YTick',[0 0.4 0.8 1.2], ...
    'YTickLabel',{'0','0.4','0.8','1.2'}, ...
    'FontName','TimesNewRoman','FontSize',14);

% plot(ma,x1,'Color',[0 1 0],'LineWidth',1)
% hold on;
% plot(ma,y1,'Color',[0 0 1],'LineWidth',1)
% area(ma,y1,0,'FaceColor',[0 0.5 0],'EdgeColor','none','FaceAlpha',1);
% area(ma,x1,1.4,'FaceColor',[0 0.5 0],'EdgeColor','none','FaceAlpha',1);
% plot(ma, x1);
% hold on;
% plot(ma, y1);

%%



figure1 = figure('Position', [0 0 400 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% plot(theta_f1*180/pi,S1,'r')
% hold on;
% plot(theta_f1*180/pi,S2,'b')
% hold on;
plot(theta_f1*180/pi,abs(S1-S2),'color',[0 0.5 0],'LineWidth',2)
hold on;
plot(theta_f1*180/pi,abs(S1+S2),'color',[0 0 0.5],'LineWidth',2)

x = min(abs(S1+S2))*ones(size(theta_f1));
y=max(abs(S1-S2))*ones(size(theta_f1));

patch('Parent',axes1, 'XData', [theta_f1*180/pi fliplr(theta_f1*180/pi)],'YData', [x fliplr(y)],'FaceColor',[0 0.5 0.5],...
    'EdgeColor','none','FaceAlpha',0.1)

box(axes1,'on');
hold(axes1,'off');

xlim([0 360])
ylim([0 1.3])

set(axes1,'XTick',[0 359], ...
    'XTickLabel',{'8\pi','10\pi'}, ...
    'YTick',[0 0.4 0.8 1.2], ...
    'YTickLabel',{'0','0.4','0.8','1.2'}, ...
    'FontName','TimesNewRoman','FontSize',14);

legend1 = legend(axes1,'show',{'Minimum','Maximum'},'interpreter','Latex','FontName','TimesNewRoman','FontSize',25);
set(legend1,...
    'Location','Best',...
    'EdgeColor','none',...
    'Color','white');

ylabel({'$\hat{S}_{{AB}_{f_s}}$  (p.u)' },'interpreter','latex','FontName','Times New Roman',...
    'FontSize',20);

% Create xlabel
xlabel('Fundamental Phase (rad)','interpreter','latex','FontName','Times New Roman',...
    'FontSize',20);




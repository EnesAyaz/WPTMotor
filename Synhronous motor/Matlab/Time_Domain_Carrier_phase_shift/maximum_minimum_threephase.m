
dead_time=0.02;

m=0.9;

theta_f1=0:0.01:2*pi;
D1=(1+m*sin(theta_f1))/2;
S1=(2/pi)*sin(pi*(D1));

theta_f2=theta_f1-2*pi/3;
D2=(1+m*sin(theta_f2))/2;
S2=(2/pi)*sin(pi*(D2));

theta_f3=theta_f1+2*pi/3;
D3=(1+m*sin(theta_f3))/2;
S3=(2/pi)*sin(pi*(D3));
%%
SA_min= (S1-S2);
SB_min= (S3-S1);
SC_min= (S2-S3);

SA_max= (S1+S2);
SB_max= (S1+S3);
SC_max= (S2+S3);

plot(theta_f1*180/pi,SA_min,'r')
hold on;
plot(theta_f1*180/pi,SB_min,'b')
hold on;
plot(theta_f1*180/pi,SC_min,'m')
hold on;
plot(theta_f1*180/pi,SA_max,'--r')
hold on;
plot(theta_f1*180/pi,SB_max,'--b')
hold on;
plot(theta_f1*180/pi,SC_max,'--m')
hold on;

plot(theta_f1*180/pi,SA_min+SB_min+SC_min,'k');

hold on;

plot(theta_f1*180/pi,SA_max+SB_max+SC_max,'k')
%%
x=(S1-S2);
y=(S1+S2);
figure1 = figure('Position', [0 0 400 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
patch('Parent',axes1, 'XData', [theta_f1*180/pi fliplr(theta_f1*180/pi)],'YData', [x fliplr(y)],'FaceColor',[1 0 1],...
    'EdgeColor','none','FaceAlpha',0.1)


%%


figure1 = figure('Position', [0 0 400 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% plot(theta_f1*180/pi,S1,'r')
% hold on;
% plot(theta_f1*180/pi,S2,'b')
% hold on;
plot(theta_f1*180/pi,abs(S1-S2),'b')
hold on;
plot(theta_f1*180/pi,abs(S1+S2),'r')

x = min(abs(S1+S2))*ones(size(theta_f1));
y=max(abs(S1-S2))*ones(size(theta_f1));

patch('Parent',axes1, 'XData', [theta_f1*180/pi fliplr(theta_f1*180/pi)],'YData', [x fliplr(y)],'FaceColor',[1 0 1],...
    'EdgeColor','none','FaceAlpha',0.1)

box(axes1,'on');
hold(axes1,'off');

xlim([0 360])
ylim([0 1.3])

set(axes1,'XTick',[0 120 240 359], ...
    'XTickLabel',{'0','120','240','360'}, ...
    'YTick',[0 0.4 0.8 1.2], ...
    'YTickLabel',{'0','0.4','0.8','1.2'}, ...
    'FontName','TimesNewRoman','FontSize',14);

legend1 = legend(axes1,'show',{'Minimum','Maximum'},'interpreter','Latex','FontName','TimesNewRoman','FontSize',10);
set(legend1,...
    'Location','Best',...
    'EdgeColor','none',...
    'Color','white');

ylabel({'$\hat {S_{AB}}_{f_s}$'},'interpreter','latex','FontName','Times New Roman',...
    'FontSize',18);

% Create xlabel
xlabel('Fundamental Phase ($^o$)','interpreter','latex','FontName','Times New Roman',...
    'FontSize',15);








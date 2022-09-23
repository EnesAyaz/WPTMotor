Smin=[];
Smax=[];
mx=[];
theta_f1=0:0.1:2*pi;

for m=0:0.1:1
dead_time=0;

% m=0.9;
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

mx=[mx, m];

Smin=[Smin ; abs(S1-S2)];
Smax=[Smax ; abs(S1+S2)];
end

[X Y]= meshgrid(theta_f1*180/pi,mx); 

%%
figure1 = figure('Position', [0 0 400 300]);
colormap(cool)
% axes1 = axes('Parent',figure1);
% hold(axes1,'on');
contour(X,Y,Smin);

% mesh(X,Y,Smin);
% hold on;
% mesh(X,Y,Smax);
% hold on;

%%

figure2 = figure('Position', [0 0 400 300]);
colormap(cool)
contour(X,Y,Smax);
% % mesh(X,Y,Smax);


% Create ylabel
% ylabel({'Modulation Index'},'FontSize',15);

% Create xlabel
% xlabel('Fundamental Phase ($^o$)','FontSize',15);

% box(axes1,'off');
% grid(axes1,'on');
% axis(axes1,'tight');
% hold(axes1,'off');
% 
% set(axes1,'BoxStyle','full','Color',[0 0 0],...
%     'FontName','Times New Roman','FontSize',16,'GridAlpha',0.7, ...
%     'Layer','top','MinorGridAlpha',0.2,'MinorGridLineStyle','-','XMinorGrid','on', ...
%     'XTick', [0 60 120 180 240 300 359], ...
%     'XTickLabel',{'0','60','120','180','240','300','360'},...
%     'YMinorGrid','on','ZMinorGrid','on');

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








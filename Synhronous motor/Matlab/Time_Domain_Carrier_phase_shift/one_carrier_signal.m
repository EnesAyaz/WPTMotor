theta_f1=0:0.001:2*pi;
dead_time=0;
S1x=[];
S2x=[];
mx=[];
for m=0:0.1:1
% m=0.2;
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

S1x=[S1x; S1];
S2x=[S2x; S2];
% figure();
% plot(theta_f1*180/pi,S1,'r')
% hold on;
% plot(theta_f1*180/pi,S2,'b')
% hold on;
% plot(theta_f1*180/pi,abs(S1-S2),'k')
% hold on;
% plot(theta_f1*180/pi,abs(S1+S2),'k')
% patch([theta_f1*180/pi fliplr(theta_f1*180/pi)], [abs(S1-S2) fliplr(abs(S1+S2))], 'm')
mx=[mx, m];
end
[X Y]= meshgrid(theta_f1*180/pi,mx);
%%
figure1 = figure('Position', [0 0 800 300]);
colormap(cool)
axes1 = axes('Parent',figure1);
hold(axes1,'on');

[c1,h1] = contour(X,Y,abs(S1x-S2x),'Fill','on','LineColor',[0 0 0]);
clabel(c1,h1);
colorbar;

% Create ylabel
ylabel({'Modulation Index'},'interpreter','latex','FontName','Times New Roman',...
    'FontSize',20);

% Create xlabel
xlabel('Fundamental Phase ($^o$)','interpreter','latex','FontName','Times New Roman',...
    'FontSize',20);

box(axes1,'on');
grid(axes1,'on');
axis(axes1,'tight');
hold(axes1,'off');

set(axes1,'BoxStyle','full','Color','None',...
    'FontName','Times New Roman','FontSize',16,'GridAlpha',0.7, ...
    'Layer','top','MinorGridAlpha',0.2,'MinorGridLineStyle','-','XMinorGrid','on', ...
    'XTick', [0 60 120 180 240 300 359], ...
    'XTickLabel',{'0','60','120','180','240','300','360'},...
    'YMinorGrid','on','ZMinorGrid','on');

%%
figure1 = figure('Position', [0 0 800 300]);
colormap(cool)
axes1 = axes('Parent',figure1);
hold(axes1,'on');


x = theta_f1*180/pi;
y = abs(S1x(end-1,:)-S2x(end-1,:));
z = y;
patch([x nan],[y nan],[z nan],[z nan], 'edgecolor', 'interp','LineWidth',3); 
% colorbar;
colormap(cool);


box(axes1,'on');
grid(axes1,'on');
axis(axes1,'tight');
hold(axes1,'off');

set(axes1,'BoxStyle','full','Color',[1 1 1],...
    'FontName','Times New Roman','FontSize',16,'GridAlpha',0.7, ...
    'Layer','top','MinorGridAlpha',0.2,'MinorGridLineStyle','-','XMinorGrid','on', ...
    'XTick', [0 60 120 180 240 300 359], ...
    'XTickLabel',{'0','60','120','180','240','300','360'},...
    'YTick', [0 0.1 0.2 0.3 0.4 0.5], ...
    'YMinorGrid','on');
ylim([0 0.5])



ylabel({'$\hat {S_{AB}}_{f_s}$'},'interpreter','latex','FontName','Times New Roman',...
    'FontSize',20);

% Create xlabel
xlabel('Fundamental Phase ($^o$)','interpreter','latex','FontName','Times New Roman',...
    'FontSize',19);

%%

figure1 = figure('Position', [0 0 800 300]);
colormap(cool)
axes1 = axes('Parent',figure1);
hold(axes1,'on');


x = theta_f1*180/pi;
y = abs(S1x(6,:)-S2x(6,:));
z = y;
patch([x nan],[y nan],[z nan],[z nan], 'edgecolor', 'interp','LineWidth',3); 
% colorbar;
colormap(cool);


box(axes1,'on');
grid(axes1,'on');
axis(axes1,'tight');
hold(axes1,'off');

set(axes1,'BoxStyle','full','Color',[1 1 1],...
    'FontName','Times New Roman','FontSize',16,'GridAlpha',0.7, ...
    'Layer','top','MinorGridAlpha',0.2,'MinorGridLineStyle','-','XMinorGrid','on', ...
    'XTick', [0 60 120 180 240 300 359], ...
    'XTickLabel',{'0','60','120','180','240','300','360'},...
    'YTick', [0 0.1 0.2 0.3 0.4 0.5], ...
    'YMinorGrid','on');
ylim([0 0.5])



ylabel({'$\hat {S_{AB}}_{f_s}$'},'interpreter','latex','FontName','Times New Roman',...
    'FontSize',20);

% Create xlabel
xlabel('Fundamental Phase ($^o$)','interpreter','latex','FontName','Times New Roman',...
    'FontSize',19);

%%
figure1 = figure('Position', [0 0 800 300]);
colormap(cool)
axes1 = axes('Parent',figure1);
hold(axes1,'on');

[c1,h1] = contour(X,Y,abs(S1x+S2x),'Fill','on','LineColor',[0 0 0]);
clabel(c1,h1);

% Create ylabel
ylabel({'Modulation Index'},'FontSize',15);

% Create xlabel
xlabel('Fundamental Phase ($^o$)','FontSize',15);

box(axes1,'off');
grid(axes1,'on');
axis(axes1,'tight');
hold(axes1,'off');

set(axes1,'BoxStyle','full','Color',[0 0 0],...
    'FontName','Times New Roman','FontSize',16,'GridAlpha',0.7, ...
    'Layer','top','MinorGridAlpha',0.2,'MinorGridLineStyle','-','XMinorGrid','on', ...
    'XTick', [0 60 120 180 240 300 359], ...
    'XTickLabel',{'0','60','120','180','240','300','360'},...
    'YMinorGrid','on','ZMinorGrid','on');

%%






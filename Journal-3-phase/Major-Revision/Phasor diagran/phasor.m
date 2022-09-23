phase=0;
phi=15;
A=2;

figure1 = figure('Position', [0 0 800 600]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

p1 = [0 0];                         % First Point
p2 = A*[cosd(0) cosd(90)];                         % Second Point
dp = p2-p1;                         % Difference
h=quiver(p1(1),p1(2),dp(1),dp(2),0,'Color',[0.8 0 0],'LineStyle','-','LineWidth',2)
set(h,'MaxHeadSize',0.3,'AutoScaleFactor',1);
hold on;

p1 = [0 0];                           % First Point
p2 = A*[cosd(0-phase) cosd(90-phase)];              % Second Point
dp = p2-p1;        % Difference

h=quiver(p1(1),p1(2),dp(1),dp(2),0,'Color',[0 0 0.8],'LineStyle','-.','LineWidth',2)
set(h,'MaxHeadSize',0.3,'AutoScaleFactor',1);
hold on;


p1 = [0 0];                           % First Point
p2 = A*[cosd(0-phase+phi) cosd(90-phase+phi)];              % Second Point
dp = p2-p1;        % Difference

h=quiver(p1(1),p1(2),dp(1),dp(2),0,'Color',[0 0 0.8],'LineStyle','-.','LineWidth',2)
set(h,'MaxHeadSize',0.3,'AutoScaleFactor',1);
hold on;


p1 = [0 0];                           % First Point
p2 = A*[cosd(0+phase) cosd(90+phase)];              % Second Point
dp = p2-p1;                         % Difference
h=quiver(p1(1),p1(2),dp(1),dp(2),0,'Color',[0.8 0 0.8],'LineStyle','--','LineWidth',2)
hold on;
set(h,'MaxHeadSize',0.3,'AutoScaleFactor',1);


p1 = [0 0];                           % First Point
p2_x = A*[cosd(0) cosd(90)];                         % Second Point
p2_y = A*[cosd(0-phase+phi) cosd(90-phase+phi)];              % Second Point
p2=p2_x-p2_y;
dp = p2-p1;        % Difference

h=quiver(p1(1),p1(2),dp(1),dp(2),0,'Color',[0 0 0],'LineStyle','-','LineWidth',2)
set(h,'MaxHeadSize',0.8,'AutoScaleFactor',1);
hold on;

% hold on;
% p1 = [0 0];                           % First Point
% p2 = [XE_3 YE_3];                         % Second Point
% dp = p2-p1;                         % Difference
% quiver(p1(1),p1(2),dp(1),dp(2),0,'Color','k','LineWidth',2,'LineStyle','--')
axis equal
% grid minor;
xlim([-2, 2])
ylim([-2, 2])

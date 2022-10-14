
m=0.75;

theta_f1=0:0.001:2*pi;
n=0;
D1=(1+m*sin(theta_f1)+(n/6)*sawtooth(3*theta_f1+pi/2,1/2))/2;

S1=(2/pi)*sin(pi*(D1));
theta_f2=theta_f1-2*pi/3;
D2=(1+m*sin(theta_f2)+(n/6)*sawtooth(3*theta_f2+pi/2,1/2))/2;
S2=(2/pi)*sin(pi*(D2));

theta_f3=theta_f1+2*pi/3;
D3=(1+m*sin(theta_f3)+(n/6)*sawtooth(3*theta_f3+pi/2,1/2))/2;
S3=(2/pi)*sin(pi*(D3));

% figure();
% plot(theta_f1*180/pi,S1);
% hold on;
% plot(theta_f1*180/pi,S2);
% hold on;
% plot(theta_f1*180/pi,S3);

% figure();
% plot(theta_f1*180/pi,S1-abs(2*S2-S3),'r');
% hold on;
% yline(0,'LineWidth',5,'Color','k')
% figure();
% plot(theta_f1*180/pi,S1+abs(2*S2-S3),'b');
% yline(0,'LineWidth',5,'Color','k')



theta_x=[];
alpha_x=[];
beta_x=[];
for ix=1:length(S1)

A=S1(ix);
B= S2(ix);
C=S3(ix);
D=0;

if B-C ~= 0
    if D >= A-abs(B-C) && D <= A+abs(B-C)
     theta =acos((A^2-(B-C)^2+D^2)/(2*A*D));
    else
        theta=0;
    end
else
    
    theta=0;

end
    
XE=D*cos(theta);
YE=D*sin(theta);


alpha=2*atan((((8*B^2*C*YE)/((A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2)*(A^2 - 2*A*B - 2*A*XE + B^2 + 2*B*XE - C^2 + XE^2 + YE^2)) + (4*B*C*((A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2)*(- A^2 + 2*A*XE + B^2 + 2*B*C + C^2 - XE^2 - YE^2))^(1/2))/((A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2)*(A^2 - 2*A*B - 2*A*XE + B^2 + 2*B*XE - C^2 + XE^2 + YE^2)))*(A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2))/(4*B*C));
beta= -2*atan(((A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2)*(- A^2 + 2*A*XE + B^2 + 2*B*C + C^2 - XE^2 - YE^2))^(1/2)/(A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2));

theta_x=[theta_x, theta];
alpha_x=[alpha_x, alpha];
beta_x=[beta_x, beta];


end

figure();
% plot(theta_f1*180/pi,theta_x*180/pi);
plot(theta_f1*180/pi,alpha_x*180/pi,'Color','r','LineStyle','-');
hold on;
plot(theta_f1*180/pi,beta_x*180/pi,'Color','b','LineStyle','--');

%%

XE_1 = real(A*cos(alpha));
YE_1 = real(A*sin(alpha));

XE_2 = real(A*cos(alpha)+B*cos(alpha+beta));
YE_2 = real(A*sin(alpha)+B*sin(alpha+beta));

XE_3 = real(A*cos(alpha) + B*cos(alpha+beta) + C*cos(alpha+beta+gamma));
YE_3 = real(A*sin(alpha) + B*sin(alpha+beta) + C*sin(alpha+beta+gamma));

figure1 = figure('Position', [0 0 400 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

p1 = [0 0];                         % First Point
p2 = [XE_1 YE_1];                         % Second Point
dp = p2-p1;                         % Difference
h=quiver(p1(1),p1(2),dp(1),dp(2),0,'Color',[0.5 0 0],'LineWidth',2)
set(h,'MaxHeadSize',0.3,'AutoScaleFactor',1);
hold on;
p1 = [XE_1 YE_1];                           % First Point
p2 = [XE_2 YE_2];                         % Second Point
dp = p2-p1;        % Difference

h=quiver(p1(1),p1(2),dp(1),dp(2),0,'Color',[0 0.5 0],'LineWidth',2)
set(h,'MaxHeadSize',0.3,'AutoScaleFactor',1);
hold on;
p1 = [XE_2 YE_2];                           % First Point
p2 = [XE_3 YE_3];                         % Second Point
dp = p2-p1;                         % Difference
h=quiver(p1(1),p1(2),dp(1),dp(2),0,'Color',[0 0 0.5],'LineWidth',2)
hold on;
set(h,'MaxHeadSize',100,'AutoScaleFactor',1);
plot([0 XE_3],[0 YE_3],'k--','LineWidth',2)

% hold on;
% p1 = [0 0];                           % First Point
% p2 = [XE_3 YE_3];                         % Second Point
% dp = p2-p1;                         % Difference
% quiver(p1(1),p1(2),dp(1),dp(2),0,'Color','k','LineWidth',2,'LineStyle','--')
axis equal


%%
y=0;

r=abs(B-C);

x=A;

ang=0:0.01:2*pi; 

xp1=r*cos(ang);
yp1=r*sin(ang);

plot(x+xp1,y+yp1,'k');


r=abs(B+C);

x=A;


xp2=r*cos(ang);
yp2=r*sin(ang);
plot(x+xp2,y+yp2,'k');

% fill([x+xp1 flip(x+xp2)],[yp1 flip(yp2)],'Color','g')

patch('Parent',axes1, 'XData', [x+xp1 flip(x+xp2)],'YData', [yp1 flip(yp2)],'FaceColor',[0.6 0 0.6],...
    'EdgeColor','none','FaceAlpha',0.1)

box(axes1,'on');
hold(axes1,'off');


grid on;
xlim([A-B-C B+C+A])
ylim([-B-C B+C])

ylabel({'$\hat{S}_{{ABC}_{f_s}} sin(\phi)$'},'interpreter','latex','FontName','Times New Roman',...
    'FontSize',20);

% Create xlabel
xlabel({'$\hat{S}_{{ABC}_{f_s}} cos(\phi)$'},'interpreter','latex','FontName','Times New Roman',...
    'FontSize',20);



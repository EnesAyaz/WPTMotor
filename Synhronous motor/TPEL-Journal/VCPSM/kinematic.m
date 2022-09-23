mx="0";
m=0.9;

theta_f1=0:0.001:2*pi;
dead_time=0.0;
% m=0;
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

theta_f3=theta_f1+2*pi/3;
D3=(1+m*sin(theta_f3)+(n/6)*sawtooth(3*theta_f3+pi/2,1/2))/2;
D3(D3<dead_time)=dead_time;
D3(D3>(1-dead_time))=1-dead_time;
D3=(1+m*sin(theta_f3)+(n/6)*sawtooth(3*theta_f3+pi/2,1/2))/2;
S3=(2/pi)*sin(pi*(D3));
% figure();
% plot(theta_f1*180/pi,S1);
% hold on;
% plot(theta_f1*180/pi,2*S2);
% hold on;
% plot(theta_f1*180/pi,S3);

%%
i=length(S1);

phi=180;
phi=165;
ix=int32(i*phi/360);
A=S1(ix);
B= 2*S2(ix);
C=S3(ix);
D=0.95;
%%
if B-C ~= 0
    if D >= A-abs(B-C) && D <= A+abs(B-C)
     theta =acos((A^2-(B-C)^2+D^2)/(2*A*D));
    else
        theta=0;
    end
% elseif B<C
% 
%     if D > A+(B-C) && D < A-(B-C)
%         theta =acos((A^2+(C-B)^2-D^2)/(2*A*D))
%     else
%         theta=0;
%     end
%     
else
    
    theta=0;

end

    
XE=D*cos(theta);
YE=D*sin(theta);

% alpha=pi;
% beta= 2*atan2((A - B - C + D)*(-((A + B + C + D)*(A + B - C + D))/((A - B - C + D)^3*(A - B + C + D)))^(1/2));
% gamma=-2*atan2(((A - B - C + D)^2*(-((A + B + C + D)*(A + B - C + D))/((A - B - C + D)^3*(A - B + C + D)))^(1/2))/(A + B - C + D));

alpha=0;
beta=2*atan((((8*B^2*C*YE)/((A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2)*(A^2 - 2*A*B - 2*A*XE + B^2 + 2*B*XE - C^2 + XE^2 + YE^2)) + (4*B*C*((A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2)*(- A^2 + 2*A*XE + B^2 + 2*B*C + C^2 - XE^2 - YE^2))^(1/2))/((A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2)*(A^2 - 2*A*B - 2*A*XE + B^2 + 2*B*XE - C^2 + XE^2 + YE^2)))*(A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2))/(4*B*C));
gamma= -2*atan(((A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2)*(- A^2 + 2*A*XE + B^2 + 2*B*C + C^2 - XE^2 - YE^2))^(1/2)/(A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2));

XE_1 = real(A*cos(alpha));
YE_1 = real(A*sin(alpha));

XE_2 = real(A*cos(alpha)+B*cos(alpha+beta));
YE_2 = real(A*sin(alpha)+B*sin(alpha+beta));

XE_3 = real(A*cos(alpha) + B*cos(alpha+beta) + C*cos(alpha+beta+gamma));
YE_3 = real(A*sin(alpha) + B*sin(alpha+beta) + C*sin(alpha+beta+gamma));

% figure1=figure(1);
% axes1 = axes('Parent',figure1);
% hold(axes1,'on');
% hold on;
% plot([0 XE_1], [0 YE_1],'r');
% plot([XE_1 XE_2], [YE_1 YE_2],'g');
% plot([XE_2 XE_3], [YE_2 YE_3],'b');
% plot(XE_3,YE_3,'o','MarkerSize',12,'MarkerFaceColor','m')
% sqrt(XE_3^2+YE_3^2)


figure1 = figure('Position', [0 0 400 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
%%
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



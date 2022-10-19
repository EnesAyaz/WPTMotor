theta_f1=0:0.001:2*pi;
dead_time=0.0;

m=1;
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


figure1 = figure('Position', [0 0 400 300]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
% plot(theta_f1*180/pi,S1,'r')
% hold on;
% plot(theta_f1*180/pi,S2,'b')
% hold on;
S=zeros(size(S1));
for i=1:length(S1)
    if (abs(S1(i)-S3(i))<S2(i)) && (S1(i)+S3(i)> S2(i))
    S(i)=0;
    elseif abs(S1(i)-S3(i))> S2(i)
     S(i)= abs(S1(i)-S3(i))-S2(i);
   
    elseif (S1(i)+S3(i)< S2(i))    
        S(i)= -abs(S1(i)+S3(i))+S2(i);
    end

end

plot(theta_f1*180/pi,S,'color',[0 0 0.5])
hold on;
% plot(theta_f1*180/pi,-abs(S1+S2)+abs(S3-S2),'b')
hold on;
plot(theta_f1*180/pi,abs(S1+2*S2+S3),'color',[0.5 0 0])

x = min(abs(S1+2*S2+S3))*ones(size(theta_f1));
% y=max(abs(S1-S2)-abs(S3+S2))*ones(size(theta_f1));
y=max(S)*ones(size(theta_f1));

patch('Parent',axes1, 'XData', [theta_f1*180/pi fliplr(theta_f1*180/pi)],'YData', [x fliplr(y)],'FaceColor',[0.5 0 0.5],...
    'EdgeColor','none','FaceAlpha',0.1)

box(axes1,'on');
hold(axes1,'off');

xlim([0 360])
ylim([0 2.6])

set(axes1,'XTick',[0 120 240 359], ...
    'XTickLabel',{'0','120','240','360'}, ...
    'YTick',[0 0.4 0.8 1.2 1.6 2 2.4], ...
    'YTickLabel',{'0','0.4','0.8','1.2','1.6','2','2.4'}, ...
    'FontName','TimesNewRoman','FontSize',14);

legend1 = legend(axes1,'show',{'Minimum','Maximum'},'interpreter','Latex','FontName','TimesNewRoman','FontSize',10);
set(legend1,...
    'Location','Best',...
    'EdgeColor','none',...
    'Color','white');

ylabel({'$\hat {S_{ABC}}_{f_s}$'},'interpreter','latex','FontName','Times New Roman',...
    'FontSize',18);

% Create xlabel
xlabel('Fundamental Phase ($^o$)','interpreter','latex','FontName','Times New Roman',...
    'FontSize',15);








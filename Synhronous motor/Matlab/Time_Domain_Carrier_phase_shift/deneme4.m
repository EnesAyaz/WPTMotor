figure1=figure(1);
axes1 = axes('Parent',figure1);
hold(axes1,'on');

mx="0";
for m=0:0.2:1
theta_f1=0:0.01:2*pi;
dead_time=0.00;
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

subplot(2,1,1)
plot(theta_f1*180/pi,S1)
hold on;
ylim([0 1])
xlim([0 360])
subplot(2,1,2)
plot(theta_f1*180/pi,S2)
hold on;
ylim([0 1])
xlim([0 360])
mx=[mx, strcat("ma=",string(m))];
end

mx=mx(2:end);

box(axes1,'on');
hold(axes1,'off');
% grid on;
% Set the remaining axes properties
% set(axes1,'XTick',0:60:360,'XTickLabel',{'0','\pi/3','2\pi/3','\pi','4\pi/3','5\pi/3','2\pi'}, ...
%     'FontName','TimesNewRoman','FontSize',16);
set(axes1,'XTick',0:60:360, ...
    'FontName','TimesNewRoman','FontSize',14);
set(axes1,'YTick',0:0.2:1, ...
    'FontName','TimesNewRoman','FontSize',14);
set(axes1,'defaultAxesTickLabelInterpreter','latex'); 


legend1 = legend(axes1,'show',mx,'FontName','TimesNewRoman','FontSize',10);
set(legend1,...
    'Location','Best',...
    'EdgeColor','none',...
    'Color','white');
ylabel('Carrier Phase Shift ($^o$)','FontName','TimesNewRoman','FontSize',20)
xlabel('Phase of Reference-A ($^o$)','FontName','TimesNewRoman','FontSize',16)

%%

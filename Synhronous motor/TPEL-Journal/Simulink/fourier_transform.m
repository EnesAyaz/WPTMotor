
data=VAB.signals.values; 
time=VAB.time;
%%
T=time(2)-time(1);
Fs=1/T;
L=length(time);

Y = fft(data);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
f=f/1000;
f(P1<0.01)=[];
P1(P1<0.01)=[];

% figure1 = figure('Position',[0 0 750 150]);
figure1 = figure('Position',[0 0 750 400]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
b=bar(f,P1,'FaceAlpha',0.6,'FaceColor',[0 0 1],...
    'EdgeColor','none',...
    'BarWidth',2);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Color','white','FontName','Times New Roman','FontSize',12,...
    'GridAlpha',0.3,'GridColor',[0 0 1],'XGrid','on','YGrid','on','YTick',...
    [0 0.25 0.5 0.75 1]);

% text(1:length(P1),P1,num2str(P1'),'vert','bottom','horiz','center'); 

ylabel('$\hat{S}_{{AB}_{f_n}} (\frac{V}{V_{DC}} $)','Interpreter','Latex','FontSize',17)
xlabel('Harmonic number (n)')
xlim([0 100])
% ylim([0 1])




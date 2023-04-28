close all;

time_sine=[];
sinex=[];
time_VAB=[];
VAB=[];
for j=1:1:10
j
filename2="G:\My Drive\WPT-MOTOR\Test-Result\2022.10.17\";
if j==10
filename3="C3ma";
else 
filename3="C3ma0";
end
filename3
filename4=strcat(filename2,filename3);
filename5=strcat(filename4,string(j));
filename6= "v2_00000.dat";
filename=strcat(filename5,filename6);
% filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.29\C2ma06_makale_10khz00000.dat";
[time, data] = importfile(filename);
time=time-time(1);

T=time(2)-time(1);
Fs=1/T;
L=length(time);
Y = fft(data);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
P3 = angle(Y/L);
P4 = P3(1:L/2+1);
f = Fs*(0:(L/2))/L;
f=5*round(f/5);

fsw=50e3;
ffund=100;
Pmag=[];
Pangle=[];
f_ma=[];
for  i=-2000:ffund:2000
   f_ma=[f_ma, f(f==fsw+i)];
   Pmag = [Pmag  P1(f==fsw+i)];
   Pangle = [Pangle P4(f==fsw+i)];
end

% stem(f_ma,Pmag);

timex=0:4e-9:(0.02-4e-9);
sinx_t=zeros(size(timex));
for i=1:length(Pmag)
sinx=Pmag(i)*cos(2*pi*f_ma(i)*timex+Pangle(i));
sinx_t=sinx_t+sinx;
end

time_sine=[time_sine, (j-1)*0.02+timex];
sinex=[sinex, sinx_t];
time_VAB=[time_VAB ;(j-1)*(0.02-4e-9)+time];
VAB=[VAB; data];
end
%%
% plot(time_sine,sinex)
% hold on;
% plot(time_VAB,VAB)


figure1 = figure('Position',[0 0 1000 350]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(time_VAB*1000,VAB/20,'Color',[0 0 0.5],'LineWidth',0.5);
hold on; 
plot(time_sine*1000,sinex/20,'Color',[0 0.6 0.6],'LineWidth',1);

hold(axes1,'off');

set(axes1,'FontName','Times New Roman','FontSize',20,'GridAlpha',0,...
    'GridColor',[0 0 0],'XGrid','on','YGrid','on','YTick',...
    [-1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1]);
% text(1:length(P1),P1,num2str(P1'),'vert','bottom','horiz','center'); 

ylabel('$U_i$/$U_i^f$ (p.u)','FontSize',20,'FontName','Times New Roman',...
    'Interpreter','latex');

% Create xlabel
xlabel({'Time (ms)'},'FontSize',20,...
    'FontName','Times New Roman',...
    'Interpreter','latex');
ylim([-1 1])

%%

figure1 = figure('Position',[0 0 400 200]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(time_VAB*1000,VAB/20,'Color',[0 0 0.5],'LineWidth',1);
hold on; 
plot(time_sine*1000,sinex/20,'Color',[0 0.6 0.6],'LineWidth',1);

hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',18,'YGrid','off','YTick',...
   [-1  -0.5  0  0.5 1])
% set(axes1,'FontName','Times New Roman','FontSize',15,'GridAlpha',0,...
%     'GridColor',[0 0 0],'XGrid','on','YGrid','on','YTick',...
%     [-1 -0.75 -0.5 -0.25 0 0.25 0.5 0.75 1]);
% text(1:length(P1),P1,num2str(P1'),'vert','bottom','horiz','center'); 
% 
% ylabel('$U_i$/$U_i^f$ (p.u)','FontSize',16,'FontName','Times New Roman',...
%     'Interpreter','latex');

% Create xlabel
% xlabel({'Time (ms)'},'FontSize',16,yeterli...
%     'FontName','Times New Roman',...
%     'Interpreter','latex');
ylabel('$U_i$/$U_i^f$ (p.u)','FontSize',20,'FontName','Times New Roman',...
    'Interpreter','latex');

% Create xlabel
xlabel({'Time (ms)'},'FontSize',20,...
    'FontName','Times New Roman',...
    'Interpreter','latex');
ylim([-1 1])

xlim([100 100.2])
xlim([40 40.2])
% xlim([140 140.2])
xlim([155 155.2])

%%

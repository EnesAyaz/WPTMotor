close all;
filename2="G:\My Drive\WPT-MOTOR\Test-Result\2022.10.17\";
filename3="C3ma01v2_00000.dat";
filename=strcat(filename2,filename3);
% filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.29\C2ma06_makale_10khz00000.dat";
[time, data] = importfile(filename);

T=time(2)-time(1);
Fs=1/T;
L=length(time);

Y = fft(data);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

P3 = angle(Y/L);
P4 = P3(1:L/2+1);
% P4(2:end-1) = P4(2:end-1);

f = Fs*(0:(L/2))/L;

f=5*round(f/5);

% f(P1<0.01)=[];
% P1(P1<0.01)=[];
% P4(P1<0.01)=[];

stem(f,P1) 
xlim([0e3 200])

%%
fsw=50e3;
ffund=100;
Pmag=[];
Pangle=[];
Pcomplex=[];
f_ma=[];
for  i=-2000:ffund:2000
   f_ma=[f_ma, f(f==fsw+i)];
   Pmag = [Pmag  P1(f==fsw+i)];
   Pangle = [Pangle P4(f==fsw+i)];
%    Pcomplex=[Pcomplex P6(f==160000+i)]; 
end

stem(f_ma,Pmag);
% hold on;
% stem(f_ma,Pangle);


figure1 = figure('Position',[0 0 500 200]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
time=0:1e-7:0.02;
sinx_t=zeros(size(time));
for i=1:length(Pmag)
sinx=Pmag(i)*cos(2*pi*f_ma(i)*time+Pangle(i));
% sinx=Pcomplex(i)*cos(2*pi*f_ma(i)*time);
sinx_t=sinx_t+sinx;
end
plot(time*1000,sinx_t,'Color',[0 0 0.5],'LineWidth',0.1);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Color','white','FontName','Times New Roman','FontSize',12,...
    'GridAlpha',0.3,'GridColor',[0 0 0],'XGrid','on','YGrid','on');

% text(1:length(P1),P1,num2str(P1'),'vert','bottom','horiz','center'); 

ylabel('Voltage (V)','Interpreter','Latex','FontSize',14)
xlabel('Time (ms)','Interpreter','Latex','FontSize',14)
% xlim([0 25])
% ylim([-0.5 0.5])
%%
figure();
fl2 = 1;
[up2,lo2] = envelope(sinx_t,fl2,'peak');
plot_param = {'Color', [0.6 0.1 0.2],'Linewidth',2}; 

hold on
plot(time,up2)
hold off
title('Hilbert Envelope')
xlim([0 1e-2])
ylim([0 10])

[mean(up2) 100*(max(up2)-min(up2))/mean(up2)]


%%
% figure1 = figure('Position',[0 0 500 200]);
% axes1 = axes('Parent',figure1);
% hold(axes1,'on');
% time=0:1e-7:0.02;
% sinx_t2=P1(f==100)*cos(2*pi*100*time+P4(f==100));
% plot(time*1000,sinx_t2*10,'Color',[0 0 0.5],'LineWidth',0.1);
% hold(axes1,'off');
% % Set the remaining axes properties
% set(axes1,'Color','white','FontName','Times New Roman','FontSize',12,...
%     'GridAlpha',0.3,'GridColor',[0 0 0],'XGrid','on','YGrid','on');
% 
% % text(1:length(P1),P1,num2str(P1'),'vert','bottom','horiz','center'); 
% 
% ylabel('Voltage (V)','Interpreter','Latex','FontSize',14)
% xlabel('Time (ms)','Interpreter','Latex','FontSize',14)
% % xlim([0 25])
% % ylim([-10 10])
% 
% max(sinx_t2);
% % A=[];
% % A=[A ; (max(up2)-min(up2)), mean(up2), max(sinx_t2);]
% 
% % close all
% clc;
% [100*(max(up2)-min(up2))/mean(up2) mean(up2)]

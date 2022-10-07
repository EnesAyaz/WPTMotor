filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.26\C3ma000000.dat";
dataLines = [1, Inf];
[time, data] = importfile(filename, dataLines);
clear filename dataLines
%%
plot(time,data)

T=time(2)-time(1);
Fs=1/T;
L=length(time);

Y = fft(data);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
stem(f,P1/10) 
xlim([0 100e3])

%%
figure(1);
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.26\C3ma0600000.dat";
dataLines = [1, Inf];
[time, data] = importfile(filename, dataLines);
clear filename dataLines
%%
subplot(2,1,1)
plot(time,data)

T=time(2)-time(1);
Fs=1/T;
L=length(time);

Y = fft(data);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

subplot(2,1,2)
f = Fs*(0:(L/2))/L;
stem(f/1000,P1/10) 
xlim([0 100])
ylim([0 1])
% 0.2598
%%
% figure(2);
clear;
clc;

% filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.26\C3ma06_200000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.26\C3ma000000.dat";
% filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.26\C3ma0300000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.27\C3ma0600000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.27\C3ma06_phase000000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.27\C3ma06_phase7100000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.27\C3ma06_phaseVar 00000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.27\C3ma06_phaseVar_10000000.dat";
% filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.27\C3ma06_phaseVar_kablo00000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.29\C3ma06_50khz-1khz00000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.29\C3ma06_50khz-100Hz00000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.29\C3ma06_50khz-100Hz_200000.dat";
dataLines = [1, Inf];
[time, data] = importfile(filename, dataLines);
clear filename dataLines
%%
% data(data>25)=50;
% data(data<-25)=-50;
% data(data>-25 & data<25)=0;
plot(time,data)
%%
% subplot(2,1,1)
% plot(time,data)
VDC=10;
T=time(2)-time(1);
Fs=1/T;
L=length(time);

Y = fft(data);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

P1=P1/VDC;
f = Fs*(0:(L/2))/L;
f=f/1000;
f(P1<0.01)=[];
P1(P1<0.01)=[];

figure1 = figure('Position',[0 0 750 150]);
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
ylim([0 1])
% 0.51
%%

filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.26\C3ma0600000.dat";
dataLines = [1, Inf];
[time, data] = importfile(filename, dataLines);
clear filename dataLines
%%
% data(data>-5 & data<5 ) =0;
% data(data<-5 ) =-10;
% data(data>5) =10;
% 
% plot(time,data)

%%
subplot(2,1,1)
plot(time,data)

T=time(2)-time(1);
Fs=1/T;
L=length(time);

Y = fft(data);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

subplot(2,1,2)
f = Fs*(0:(L/2))/L;
stem(f/1000,P1/10) 
xlim([0 105])
ylim([0 1])
%%
f = Fs*(0:(L/2))/L;
semilogy(f/1000,P1/10,'LineStyle','-','Marker','o','MarkerSize',2) 
xlim([0 100])
ylim([0.01 1])
% 0.51

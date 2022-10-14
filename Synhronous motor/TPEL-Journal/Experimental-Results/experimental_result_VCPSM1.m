% figure(2);
clear;
clc;
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.29\C2ma0_makale_10khz00000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.29\C2ma03_makale_10khz00000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.29\C2ma06_makale_10khz00000.dat";
% filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.29\C2ma086_makale_10khz00000.dat";
dataLines = [1, Inf];
[time, data] = importfile(filename, dataLines);
clear filename dataLines
%%
plot(time,data)
%%
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
% f(P1<0.04)=[];
% P1(P1<0.04)=[];

figure1 = figure('Position',[0 0 750 450]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
b=bar(f(1:499989),P1(1:499989),'FaceAlpha',0.6,'FaceColor',[0 0 1],...
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
xlim([0 25])
ylim([0 0.75])
% 0.51
%%

figure();
time=0:1e-7:0.01;
sinx_t=zeros(size(time));
for i=1:length(Pmag)
sinx=Pmag(i)*cos(2*pi*f_ma(i)*time+Pangle(i));
% sinx=Pcomplex(i)*cos(2*pi*f_ma(i)*time);
sinx_t=sinx_t+sinx;
end
plot(time,sinx_t)


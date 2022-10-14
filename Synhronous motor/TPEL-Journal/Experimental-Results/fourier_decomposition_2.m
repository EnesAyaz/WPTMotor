%%
% i = "" "03" "06" "086"
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.26\C3ma00000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.26\C3ma0300000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.26\C3ma0600000.dat";
filename="G:\My Drive\WPT-MOTOR\Test-Result\2022.09.26\C3ma08800000.dat";
% filename=strcat(folder,"_makale00000.dat");
dataLines = [1, Inf];
[time, data] = importfile(filename, dataLines);
clear folder filename2 filename dataLines i
%%
plot(time,data);
% data(data<5 & data>-5)=0;
% data(data>5)=10;
% data(data<-5)=-10;
%%

T=time(2)-time(1);
Fs=1/T;
L=length(time);

Y = fft(data/10);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

P3 = angle(Y/L);
P4 = P3(1:L/2+1);
% P4(2:end-1) = P4(2:end-1);

f = Fs*(0:(L/2))/L;

f=100*round(f/100);

% f(P1<0.01)=[];
% P1(P1<0.01)=[];
% P4(P1<0.01)=[];

stem(f,P1) 
xlim([0e3 100e3])


%%

Pmag=[];
Pangle=[];
Pcomplex=[];
f_ma=[];
for  i=-10000:1000:10000
   f_ma=[f_ma, f(f==50000+i)];
   Pmag = [Pmag  P1(f==50000+i)];
   Pangle = [Pangle P4(f==50000+i)];
%    Pcomplex=[Pcomplex P6(f==160000+i)]; 
end

% stem(f_ma,Pmag);
% hold on;
% stem(f_ma,Pangle);

%%
%%
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
plot(time*1000,sinx_t*10,'Color',[0 0 0.5],'LineWidth',0.1);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Color','white','FontName','Times New Roman','FontSize',12,...
    'GridAlpha',0.3,'GridColor',[0 0 0],'XGrid','on','YGrid','on');

% text(1:length(P1),P1,num2str(P1'),'vert','bottom','horiz','center'); 

ylabel('Voltage (V)','Interpreter','Latex','FontSize',14)
xlabel('Time (ms)','Interpreter','Latex','FontSize',14)
% xlim([0 25])
% ylim([-1 1])

%%
figure1 = figure('Position',[0 0 500 200]);
axes1 = axes('Parent',figure1);
hold(axes1,'on');
time=0:1e-7:0.02;
sinx_t=P1(f==100)*cos(2*pi*100*time+P4(f==100));
plot(time*1000,sinx_t*10,'Color',[0 0 0.5],'LineWidth',0.1);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Color','white','FontName','Times New Roman','FontSize',12,...
    'GridAlpha',0.3,'GridColor',[0 0 0],'XGrid','on','YGrid','on');

% text(1:length(P1),P1,num2str(P1'),'vert','bottom','horiz','center'); 

ylabel('Voltage (V)','Interpreter','Latex','FontSize',14)
xlabel('Time (ms)','Interpreter','Latex','FontSize',14)
% xlim([0 25])
ylim([-10 10])

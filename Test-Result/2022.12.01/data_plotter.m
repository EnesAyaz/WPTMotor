file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.12.01\";
name="F1m0_80kHz_phase000000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_VAB_m0_phi0, data_VAB_m0_phi0] = importfile(filename, dataLines);
clear name filename
%%
figure1=figure();
figure1.Position = [0 0 500 200];
axes1 = axes('Parent',figure1);
plot(time_VAB_m0_phi0,data_VAB_m0_phi0,'Color','r','LineWidth',0.1);

set(axes1,'FontName','Times New Roman','FontSize',10);
% -5.10e-5
box off
xlim([1.10e-4, 11.1e-4])
ylim([-12 12])
a=linspace(1.10e-4,11.1e-4,5);
xticks(a)
xticklabels({'0','0.25','0.5','0.75','1'})
yticks([-12 -10 -5 0 5 10 12])
yticklabels({'','-Vdc','','0','','Vdc',''})
xlabel('Time(ms)','FontName','Times New Roman','FontSize',12);
ylabel('Voltage(V)','FontName','Times New Roman','FontSize',12)

%%
f_s= 1/(time_VAB_m0_phi0(2)-time_VAB_m0_phi0(1));
y_m0_phi0 = fft(data_VAB_m0_phi0);
L=length(y_m0_phi0);
P2= abs(y_m0_phi0/L);
P1_m0_phi0=P2(1:L/2+1);
P1_m0_phi0(2:end-1)=2*P1_m0_phi0(2:end-1);
f_m0_phi0= f_s*(0:(L/2))/L;
figure();
stem(f_m0_phi0,P1_m0_phi0)
xlim([0 85e3])
%%

figure1 = figure;
figure1.Position = [0 0 300 200];
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

f=[1e3 35e3 40e3 45e3];
m=[0 0 0.14 0];

bar(f,m/8.6,'FaceColor',[0 0 1],'BarWidth',0.2)
ylim([0 1])
set(axes1,'FontName','Times New Roman','FontSize',11,'XTick',f,...
    'XTickLabel',{'f_o','f_s_w-2f_o','f_s_w','f_s_w+2f_o'},'XTickLabelRotation',90,...
    'YTick',[0 0.25 0.5 0.75 1]);
mp=m/8.6;
h=text(f,mp,num2str(mp','%0.2f'),'HorizontalAlignment','center','VerticalAlignment','bottom'); 
%  set(h,'Rotation',90);
% ylabel('Modulation','FontName','Times New Roman','FontSize',12)
title('\rm Harmonic Spectrum','FontName','Times New Roman','FontSize',12)
%%
file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.12.01\";
name="F1m0_80kHz_phase4000000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_VAB_m0_phi40, data_VAB_m0_phi40] = importfile(filename, dataLines);

clear name filename
%%
figure1=figure();
figure1.Position = [0 0 500 200];
axes1 = axes('Parent',figure1);
plot(time_VAB_m0_phi40,data_VAB_m0_phi40,'Color','r','LineWidth',0.1);

set(axes1,'FontName','Times New Roman','FontSize',10);
% -5.10e-5
box off
xlim([1.10e-4, 11.1e-4])
ylim([-12 12])
a=linspace(1.10e-4,11.1e-4,5);
xticks(a)
xticklabels({'0','0.25','0.5','0.75','1'})
yticks([-12 -10 -5 0 5 10 12])
yticklabels({'','-Vdc','','0','','Vdc',''})
xlabel('Time(ms)','FontName','Times New Roman','FontSize',12);
ylabel('Voltage(V)','FontName','Times New Roman','FontSize',12)

%%
f_s= 1/(time_VAB_m0_phi40(2)-time_VAB_m0_phi40(1));
y_m0_phi40 = fft(data_VAB_m0_phi40);
L=length(y_m0_phi40);
P2= abs(y_m0_phi40/L);
P1_m0_phi40=P2(1:L/2+1);
P1_m0_phi40(2:end-1)=2*P1_m0_phi40(2:end-1);
f_m0_phi0= f_s*(0:(L/2))/L;
figure();
stem(f_m0_phi0,P1_m0_phi40)
xlim([0 85e3])

%%

figure1 = figure;
figure1.Position = [0 0 300 200];
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

f=[1e3 35e3 40e3 45e3];
m=[0 0 4.5 0];

bar(f,m/8.6,'FaceColor',[0 0 1],'BarWidth',0.2)
ylim([0 1])
set(axes1,'FontName','Times New Roman','FontSize',11,'XTick',f, ...
    'XTickLabel',{'f_o','f_s_w-2f_o','f_s_w','f_s_w+2f_o'},'XTickLabelRotation',90,...
    'YTick',[0 0.25 0.5 0.75 1]);
mp=m/8.6;
h=text(f,mp,num2str(mp','%0.2f'),'HorizontalAlignment','center','VerticalAlignment','bottom'); 
%  set(h,'Rotation',90);
% ylabel('Modulation','FontName','Times New Roman','FontSize',12)
title('\rm Harmonic Spectrum','FontName','Times New Roman','FontSize',12)
%%
file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.12.01\";
name="F1m06_80kHz_phase000000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_VAB_m06_phi0, data_VAB_m06_phi0] = importfile(filename, dataLines);
clear name filename
%%
figure1=figure();
figure1.Position = [0 0 400 200];
axes1 = axes('Parent',figure1);
plot(time_VAB_m06_phi0,data_VAB_m06_phi0,'Color',[0 0.5 0],'LineWidth',0.1);

set(axes1,'FontName','Times New Roman','FontSize',10);
% -5.10e-5
box off
xlim([1.10e-4, 11.1e-4])
ylim([-12 12])
a=linspace(1.10e-4,11.1e-4,5);
xticks(a)
xticklabels({'0','0.25','0.5','0.75','1'})
yticks([-12 -10 -5 0 5 10 12])
yticklabels({'','-Vdc','','0','','Vdc',''})
xlabel('Time (ms)','FontName','Times New Roman','FontSize',12);
ylabel('Voltage (V)','FontName','Times New Roman','FontSize',12)


%%
f_s= 1/(time_VAB_m06_phi0(2)-time_VAB_m06_phi0(1));
y_m06_phi0 = fft(data_VAB_m06_phi0);
L=length(y_m06_phi0);
P2= abs(y_m06_phi0/L);
P1_m06_phi0=P2(1:L/2+1);
P1_m06_phi0(2:end-1)=2*P1_m06_phi0(2:end-1);
f_m0_phi0= f_s*(0:(L/2))/L;
figure();
stem(f_m0_phi0,P1_m06_phi0)
xlim([0 85e3])
%%
%%
figure1 = figure;
figure1.Position = [0 0 200 200];
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

f=[1e3 15e3 20e3 25e3];
m=[5.32 1.1 0.11 1.15];

bar(f,m/8.6,'FaceColor',[0 0 0.5],'BarWidth',0.2)
ylim([0 1])
set(axes1,'FontName','Times New Roman','FontSize',11,'XTick',f,...
    'XTickLabel',{'f_o','f_s_w-2f_o','f_s_w','f_s_w+2f_o'},'XTickLabelRotation',90,...
    'YTick',[0 0.25 0.5 0.75 1]);
mp=m/8.6;
text(f,mp,num2str(mp','%0.2f'),'HorizontalAlignment','center','VerticalAlignment','bottom'); 
% ylabel('Modulation','FontName','Times New Roman','FontSize',12)
title('\rm Harmonic Spectrum','Interpreter','Latex','FontName','Times New Roman','FontSize',12)

%%
file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.12.01\";
name="F1m06_80kHz_phase47.500000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_VAB_m06_phi475, data_VAB_m06_phi475] = importfile(filename, dataLines);
clear name filename
%%
figure1=figure();
figure1.Position = [0 0 400 200];
axes1 = axes('Parent',figure1);
plot(time_VAB_m06_phi475,data_VAB_m06_phi475,'Color',[0 0.5 0],'LineWidth',0.1);

set(axes1,'FontName','Times New Roman','FontSize',10);
% -5.10e-5
box off
xlim([-55.10e-5, 44.9e-5])
ylim([-12 12])
a=linspace(-55.10e-5,44.9e-5,5);
xticks(a)
xticklabels({'0','0.25','0.5','0.75','1'})
yticks([-12 -10 -5 0 5 10 12])
yticklabels({'','-Vdc','','0','','Vdc',''})
xlabel('Time (ms)','FontName','Times New Roman','FontSize',12);
ylabel('Voltage (V)','FontName','Times New Roman','FontSize',12)
%%
f_s= 1/(time_VAB_m06_phi475(2)-time_VAB_m06_phi475(1));
y_m06_phi475 = fft(data_VAB_m06_phi475);
L=length(y_m06_phi475);
P2= abs(y_m06_phi475/L);
P1_m06_phi475=P2(1:L/2+1);
P1_m06_phi475(2:end-1)=2*P1_m06_phi475(2:end-1);
f_m0_phi0= f_s*(0:(L/2))/L;
figure();
stem(f_m0_phi0,P1_m06_phi475)
xlim([0 85e3])
%%
figure1 = figure;
figure1.Position = [0 0 300 200];
% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

f=[1e3 35e3 40e3 45e3];
m=[5.37 1.27 4.14 0.82];

bar(f,m/8.6,'FaceColor',[0 0 1],'BarWidth',0.2)
ylim([0 1])
set(axes1,'FontName','Times New Roman','FontSize',11,'XTick',f,...
    'XTickLabel',{'f_o','f_s_w-2f_o','f_s_w','f_s_w+2f_o'},'XTickLabelRotation',90,...
    'YTick',[0 0.25 0.5 0.75 1]);
mp=m/8.6;
text(f,mp,num2str(mp','%0.2f'),'HorizontalAlignment','center','VerticalAlignment','bottom'); 
% ylabel('Modulation','FontName','Times New Roman','FontSize',12)
title('\rm Harmonic Spectrum','FontName','Times New Roman','FontSize',12)












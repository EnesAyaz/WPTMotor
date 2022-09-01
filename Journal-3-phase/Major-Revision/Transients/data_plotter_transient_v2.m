file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.12.01\transient\";
name="C1Im_motor_zoomout00000.dat";
name2="C2Itx_motor_zoomout00000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
filename2=strcat(file_location,name2);
[time_Im_tM, data_Im_tM] = importfile(filename, dataLines);
[time_Itx_tM, data_Itx_tM] = importfile(filename2, dataLines);
clear name filename
%%
figure1=figure();
figure1.Position = [0 0 300 150];
axes1 = axes('Parent',figure1);
plot(time_Im_tM,data_Im_tM,'Color',[0.5 0 0],'LineWidth',0.1);
ylabel('Current(A)','FontName','Times New Roman','FontSize',10)
hold on;
ylim([-8 8])
yticks(linspace(-8,8,5));
xlim([-0.4 1.2])
xticks(linspace(-0.4,1.2,9));
xticklabels(string(linspace(0,1.6,9)))
grid on;
legend('I_M', 'FontSize',10,...
    'FontName','Times New Roman',...
    'EdgeColor','none',...
    'Color','none')
set(axes1,'FontName','Times New Roman','FontSize',10)
%%

figure1=figure();
figure1.Position = [0 0 300 150];
axes1 = axes('Parent',figure1);
plot(time_Itx_tM,data_Itx_tM,'Color',[0 0 0.5],'LineWidth',0.1);
ylabel('Current(A)','FontName','Times New Roman','FontSize',10)
hold on;
ylim([-8 8])
yticks(linspace(-8,8,5));
xlim([-0.4 1.2])
xticks(linspace(-0.4,1.2,9));
xticklabels(string(linspace(0,1.6,9)))
grid on;
legend('I_{TX}', 'FontSize',10,...
    'FontName','Times New Roman',...
    'EdgeColor','none',...
    'Color','none')
xlabel('Time(s)','FontName','Times New Roman', 'FontSize',10);
set(axes1,'FontName','Times New Roman','FontSize',10)

%%
Y= fft(data_Itx_tM);
L=length(Y);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
Fs=1/(time_Itx_tM(3)-time_Itx_tM(2));
f = Fs*(0:(L/2))/L;
%%
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

%%

file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.12.01\transient\";
name="C2Itx_motor_zoomin_noload00000.dat";
name2="C2Itx_motor_zoomin_load00000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
filename2=strcat(file_location,name2);
[time_Itx_noload, data_Itx_noload] = importfile(filename, dataLines);
[time_Itx_load, data_Itx_load] = importfile(filename2, dataLines);
clear name filename
%%
figure1=figure();
figure1.Position = [0 0 200 150];
axes1 = axes('Parent',figure1);
plot(time_Itx_noload,data_Itx_noload,'Color',[0 0 0.5],'LineWidth',0.1);
hold on;

ylim([-2 2])
xlim([3e-4 3.5e-4])
xticks(linspace(3e-4,3.6e-4,7));
xticklabels(string(linspace(2003e-4,2006e-4,7)))
grid on;
set(axes1,'FontName','Times New Roman','FontSize',10)
%%
figure1=figure();
figure1.Position = [0 0 200 150];
axes1 = axes('Parent',figure1);
plot(time_Itx_load,data_Itx_load,'Color',[0 0 0.5],'LineWidth',0.1);
hold on;
ylim([-2 2])
xlim([210e-4 210.5e-4])
xticks(linspace(210e-4,210.6e-4,7));
xticklabels(string(linspace(8003e-4,8006e-4,7)))
grid on;
set(axes1,'FontName','Times New Roman','FontSize',10)


file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.11.29\";
name="C3Im_0.8m_20hz_only_motor00000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_onlymotor_Im, data_onlymotor_Im] = importfile(filename, dataLines);
clear name filename

file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.11.29\";
name="C3Im_0.8m_20hz_simultaenous00000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_simultaneous_Im, data_simultaneous_Im] = importfile(filename, dataLines);
clear name filename


file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.11.29\";
name="C4Itx_0.8m_20hz_onlyWPT00001.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_onlyIPT_Itx, data_onlyIPT_Itx] = importfile(filename, dataLines);
clear name filename


%%
figure1=figure();
figure1.Position = [0 0 500 500];
axes1 = axes('Parent',figure1);
plot(time_onlymotor_Im,data_onlymotor_Im/4+10,'Color',[0.5 0 0],'LineWidth',2);
set(axes1,'FontName','Times New Roman','FontSize',12);
hold on;
plot(time_onlyIPT_Itx,data_onlyIPT_Itx+9,'Color',[0 0 0.5],'LineWidth',2);
hold on;
plot(time_simultaneous_Im-0.0015,data_simultaneous_Im/4+7,'Color',[0 0 0.5],'LineWidth',2);
% -5.10e-5
grid on;
grid minor;
xlim([-0.1065,-0.0065])
yticklabels({''})
a=linspace(-0.1065,-0.0065,6);
xticks(a)
xticklabels(string(linspace(0,0.1,6)))
% xlabel('Time (ms)','Interpreter','Latex','FontName','Times New Roman','FontSize',12);
ylabel('Current (A)','Interpreter','Latex','FontName','Times New Roman','FontSize',12);

%%










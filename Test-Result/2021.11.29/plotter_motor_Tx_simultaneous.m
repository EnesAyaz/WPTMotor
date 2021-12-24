file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.11.29\";
name="C3Im_0.8m_20hz_simultaenous00000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_onlymotor, data_onlymotor] = importfile(filename, dataLines);
clear name filename
%%
figure1=figure();
figure1.Position = [0 0 300 200];
axes1 = axes('Parent',figure1);
plot(time_onlymotor,data_onlymotor,'Color',[0 0.5 0],'LineWidth',2);
set(axes1,'FontName','Times New Roman','FontSize',12);
% -5.10e-5
grid on;
xlim([-0.1050,-0.0050])
ylim([-4 4])
a=linspace(-0.1050,-0.0050,6);
xticks(a)
xticklabels(string(linspace(0,0.1,6)))
yticks([-4 -2 0 2 4])
% yticklabels({'','-Vdc','','0','','Vdc',''})
% xlabel('Time (ms)','Interpreter','Latex','FontName','Times New Roman','FontSize',12);
% ylabel('Current (A)','Interpreter','Latex','FontName','Times New Roman','FontSize',12);
%%
file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.11.29\";
name="C4Itx_0.8m_20hz_simultaenous00000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_onlymotor, data_onlymotor] = importfile(filename, dataLines);
clear name filename
%%
figure1=figure();
figure1.Position = [0 0 300 200];
axes1 = axes('Parent',figure1);
plot(time_onlymotor,data_onlymotor,'Color',[0.5 0 0.5],'LineWidth',2);
set(axes1,'FontName','Times New Roman','FontSize',12);
% -5.10e-5
grid on;
xlim([-0.1050,-0.0050])
ylim([-1 1])
a=linspace(-0.1050,-0.0050,6);
xticks(a)
xticklabels(string(linspace(0,0.1,6)))
yticks([-1 -0.5 0 0.5 1])
% yticklabels({'','-Vdc','','0','','Vdc',''})
% xlabel('Time (ms)','Interpreter','Latex','FontName','Times New Roman','FontSize',12);
% ylabel('Current (A)','Interpreter','Latex','FontName','Times New Roman','FontSize',12);
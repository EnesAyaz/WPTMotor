%%
file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.12.01\";
name="F1m06_80kHz_phase000000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_VAB_m06_phi0, data_VAB_m06_phi0] = importfile(filename, dataLines);
clear name filename
%%
figure1=figure();
figure1.Position = [0 0 600 200];
axes1 = axes('Parent',figure1);
plot(time_VAB_m06_phi0,data_VAB_m06_phi0,'Color',[0.5 0 0],'LineWidth',0.1);

set(axes1,'FontName','Times New Roman','FontSize',12);
% -5.10e-5
box off
xlim([1.10e-4, 11.1e-4])
ylim([-12 12])
a=linspace(1.10e-4,11.1e-4,5);
xticks(a)
xticklabels({'0','0.25','0.5','0.75','1'})
% xticklabels({""});
yticks([-12 -10 -5 0 5 10 12])
yticklabels({'','-Vdc','','0','','Vdc',''})
xlabel('Time (ms)','FontName','Times New Roman','FontSize',12);
ylabel('Voltage (V)','FontName','Times New Roman','FontSize',12)

% % legend("$\phi_{CPS}=0$")
% legend1 = legend(axes1,'show');
% set(legend1,...
%     'Position',[0.729349302155731 0.768913979925135 0.166206217570914 0.115999998569488],...
%     'Interpreter','latex',...
%     'FontSize',12,...
%     'EdgeColor','none',...
%     'Color','none');

set(axes1,'FontName','Times New Roman','FontSize',12)
%%
file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.12.01\";
name="F1m06_80kHz_phase47.500000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_VAB_m06_phi475, data_VAB_m06_phi475] = importfile(filename, dataLines);
clear name filename
%%
figure1=figure();
figure1.Position = [0 0 600 200];
axes1 = axes('Parent',figure1);
plot(time_VAB_m06_phi475,data_VAB_m06_phi475,'Color',[0 0 0.5],'LineWidth',0.1);

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

% legend("$\phi_B=47.5$")
% legend1 = legend(axes1,'show');
% set(legend1,...
%     'Position',[0.729349302155731 0.768913979925135 0.166206217570914 0.115999998569488],...
%     'Interpreter','latex',...
%     'FontSize',12,...
%     'EdgeColor','none',...
%     'Color','none');

set(axes1,'FontName','Times New Roman','FontSize',12)
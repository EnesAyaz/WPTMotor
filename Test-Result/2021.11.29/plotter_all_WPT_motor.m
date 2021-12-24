file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.11.29\";
name="C3Im_0.8m_20hz_only_motor00000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_onlymotor, data_onlymotor] = importfile(filename, dataLines);
clear name filename

figure1=figure();
figure1.Position = [0 0 300 200];
axes1 = axes('Parent',figure1);
plot(time_onlymotor,data_onlymotor,'Color',[0 0.5 0],'LineWidth',2);
set(axes1,'FontName','Times New Roman','FontSize',12);
% -5.10e-5
grid on;
xlim([-0.1065,-0.0065])
ylim([-4 4])
a=linspace(-0.1065,-0.0065,6);
xticks(a)
xticklabels(string(linspace(0,0.1,6)))
yticks([-4 -2 0 2 4])
% yticklabels({'','-Vdc','','0','','Vdc',''})
xlabel('Time (ms)','Interpreter','Latex','FontName','Times New Roman','FontSize',12);
ylabel('Current (A)','Interpreter','Latex','FontName','Times New Roman','FontSize',12);

legend('$I_m$')
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.403963350817596 0.789913981176833 0.41999999254942 0.114999997168779],...
    'FontSize',12,...
    'EdgeColor','none','Color','none','Interpreter','Latex');

% Create textbox
annotation(figure1,'textbox',...
    [0.250000000000001 0.225 0.396666666666666 0.14],...
    'String',{'$I_m =1.749 A_{RMS}$'},...
    'FontSize',12,...
    'FontName','Times',...
    'FitBoxToText','off',...
    'EdgeColor','none','Interpreter','Latex');
%%
file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.11.29\";
name="C4Itx_0.8m_20hz_onlyWPT00001.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_onlymotor, data_onlyWPT] = importfile(filename, dataLines);
clear name filename
figure1=figure();
figure1.Position = [0 0 300 200];
axes1 = axes('Parent',figure1);
plot(time_onlymotor,data_onlyWPT,'Color',[0.5 0 0.5],'LineWidth',2);
set(axes1,'FontName','Times New Roman','FontSize',12);
% -5.10e-5
grid on;
xlim([-0.1065,-0.0065])
ylim([-4 4])
a=linspace(-0.1065,-0.0065,6);
xticklabels(string(linspace(0,0.1,6)))
yticks([-4 -2 0 2 4])
% yticklabels({'','-Vdc','','0','','Vdc',''})
xlabel('Time (ms)','Interpreter','Latex','FontName','Times New Roman','FontSize',12);
ylabel('Current (A)','Interpreter','Latex','FontName','Times New Roman','FontSize',12)

legend('$I_{TX}$')
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.403963350817596 0.789913981176833 0.41999999254942 0.114999997168779],...
    'FontSize',12,...
    'EdgeColor','none','Color','none','Interpreter','Latex');

% Create textbox
annotation(figure1,'textbox',...
    [0.250000000000001 0.225 0.396666666666666 0.14],...
    'String',{'$I_{TX} =0.346 A_{RMS}$'},...
    'FontSize',12,...
    'FontName','Times',...
    'FitBoxToText','off',...
    'EdgeColor','none','Interpreter','Latex');

%%

file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.11.29\";
name="C3Im_0.8m_20hz_simultaenous00000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_motor, data_motor] = importfile(filename, dataLines);
clear name filename

file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.11.29\";
name="C4Itx_0.8m_20hz_simultaenous00000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
[time_WPT, data_WPT] = importfile(filename, dataLines);
clear name filename

figure1=figure();
figure1.Position = [0 0 500 200];
axes1 = axes('Parent',figure1);
plot(time_motor,data_motor,'Color',[0 0.5 0],'LineWidth',2);
hold on;
plot(time_WPT,data_WPT,'Color',[0.5 0 0.5],'LineWidth',2);
set(axes1,'FontName','Times New Roman','FontSize',12);
grid on;
xlim([-0.1050,-0.0050])
ylim([-4 4])
a=linspace(-0.1050,-0.0050,6);
xticks(a)
xticklabels(string(linspace(0,0.1,6)))
yticks([-4 -2 0 2 4])
% yticklabels({'','-Vdc','','0','','Vdc',''})
xlabel('Time (ms)','Interpreter','Latex','FontName','Times New Roman','FontSize',12);
ylabel('Current (A)','Interpreter','Latex','FontName','Times New Roman','FontSize',12);

legend('$I_m$','$I_{TX}$')
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.403963350817596 0.789913981176833 0.41999999254942 0.114999997168779],...
    'FontSize',12,...
    'EdgeColor','none','Color','none','Interpreter','Latex');


annotation(figure1,'textbox',...
    [0.60 0.225 0.396666666666666 0.14],...
    'String',{'$I_{TX} = 0.349 A_{RMS}$'},...
    'FontSize',12,...
    'FontName','Times',...
    'FitBoxToText','off',...
    'EdgeColor','none','Interpreter','Latex');

% Create textbox
annotation(figure1,'textbox',...
    [0.20 0.225 0.396666666666666 0.14],...
    'String',{'$I_m =1.747 A_{RMS}$'},...
    'FontSize',12,...
    'FontName','Times',...
    'FitBoxToText','off',...
    'EdgeColor','none','Interpreter','Latex');



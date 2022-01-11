file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.12.01\transient\";
name="C1Im_IPT_zoomout200000";
name2="C2Itx_IPT_zoomout200000.dat";

dataLines=[1 inf];
filename=strcat(file_location,name);
filename2=strcat(file_location,name2);
[time_Im_tM, data_Im_tM] = importfile(filename, dataLines);
[time_Itx_tM, data_Itx_tM] = importfile(filename2, dataLines);
clear name filename
%%
figure1=figure();
figure1.Position = [0 0 600 150];
axes1 = axes('Parent',figure1);
plot(time_Im_tM,data_Im_tM,'Color',[1 0 0],'LineWidth',0.1);
ylabel('Current(A)','FontName','Times New Roman','FontSize',14)
hold on;
ylim([-4 4])
%yticks(linspace(-8,8,5));
xlim([-0.1 0.3])
xticks(linspace(-0.1,0.3,5));
xticklabels(string(linspace(0,0.4,5)))
set(axes1,'FontName','Times New Roman','FontSize',12)
grid on;
legend('I_M', 'FontSize',12,...
    'FontName','Times New Roman',...
    'EdgeColor','none',...
    'Color','none')
%%
figure1=figure();
figure1.Position = [0 0 600 150];
axes1 = axes('Parent',figure1);
plot(time_Itx_tM,data_Itx_tM,'Color',[0 0 1],'LineWidth',0.1);
ylabel('Current(A)','FontName','Times New Roman','FontSize',14)
hold on;
ylim([-4 4])
%yticks(linspace(-8,8,5));
xlim([-0.1 0.3])
xticks(linspace(-0.1,0.3,5));
xticklabels(string(linspace(0,0.4,5)))
grid on;
legend('I_{TX}', 'FontSize',12,...
    'FontName','Times New Roman',...
    'EdgeColor','none',...
    'Color','none')
set(axes1,'FontName','Times New Roman','FontSize',12)
xlabel('Time(s)','FontName','Times New Roman', 'FontSize',14);
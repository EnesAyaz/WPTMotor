clear;
clc;

file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.11.29\";

name="C1VAB_m06_1kHz_phase000000.dat";
name2="C2Itx_m06_1kHz_phase000000.dat";

% % 
% name="C1VAB_m08_1kHz_phase5000000.dat";
% name2="C2Itx_m08_1kHz_phase5000000.dat";

filename=strcat(file_location,name);
filename2=strcat(file_location,name2);
dataLines=[1 inf];

[time_VAB, data_VAB] = importfile(filename, dataLines);
[time_Itx, data_Itx] = importfile(filename2, dataLines);

name="C1VAB_m06_1kHz_phase47.500000.dat";
name2="C2Itx_m06_1kHz_phase47.500000.dat";

filename=strcat(file_location,name);
filename2=strcat(file_location,name2);

[time_VAB2, data_VAB2] = importfile(filename, dataLines);
[time_Itx2, data_Itx2] = importfile(filename2, dataLines);

clear name filename name2 filename2 
%%
% figure1=figure();
% axes1 = axes('Parent',figure1);
% plot(time_VAB,data_VAB+50);
% hold on;
% plot(time_Itx,data_Itx*10 );
% xlim([8e-4 18e-4])
% ylim([-20 80])
% grid on;
% grid minor;
% set(axes1,'XTickLabel',{},'YTickLabel',{});
%% 0.6 no phase-shift
figure1=figure();
figure1.Position = [0 0 500 200];
axes1 = axes('Parent',figure1);
plot(time_VAB,data_VAB+60,'Color','r','LineWidth',0.1);
hold on;
plot(time_Itx,data_Itx*10,'Color','b','LineWidth',0.1);
xlim([12.5e-4 22.5e-4])
ylim([-20 90])
grid minor;
grid on;
set(axes1,'GridAlpha',0.0,'GridColor',[0 0 0],'MinorGridAlpha',0.0,...
    'MinorGridLineStyle','-','XMinorGrid','on','YMinorGrid','on','ZMinorGrid',...
    'on');
% set(axes1,'XTickLabel',{},'YTickLabel',{});


%% 0.6 no phase-shift
figure1=figure();
figure1.Position = [0 0 500 200];
axes1 = axes('Parent',figure1);
plot(time_VAB,data_VAB+60,'Color','r','LineWidth',0.1);
hold on;
plot(time_Itx,data_Itx*10,'Color','b','LineWidth',0.1);
xlim([12.5e-4 22.5e-4])
ylim([-20 90])
grid minor;
grid on;
set(axes1,'GridAlpha',0.5,'GridColor',[0 0 0],'MinorGridAlpha',0.0,...
    'MinorGridLineStyle','-','XMinorGrid','on','YMinorGrid','on','ZMinorGrid',...
    'on');
set(axes1,'XTickLabel',{},'YTickLabel',{});
%%
figure();
plot(time_Itx,data_Itx*10 );
xlim([17.30e-4 17.70e-4])
ylim([-5 5])
%%
figure();
plot(time_VAB,data_VAB);
xlim([17.30e-4 17.70e-4])
ylim([-5 30])
%% 0.6  phase-shift
figure1=figure();
figure1.Position = [0 0 500 200];
axes1 = axes('Parent',figure1);
plot(time_VAB2,data_VAB2+60);
hold on;
plot(time_Itx2,data_Itx2*10 );
xlim([9.25e-4 19.25e-4])
ylim([-20 90])
grid minor;
grid on;
set(axes1,'GridAlpha',0.5,'GridColor',[0 0 0],'MinorGridAlpha',0,...
    'MinorGridLineStyle','-','XMinorGrid','on','YMinorGrid','on','ZMinorGrid',...
    'on');
set(axes1,'XTickLabel',{},'YTickLabel',{});
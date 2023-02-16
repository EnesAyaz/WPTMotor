filename="G:\My Drive\WPT-MOTOR\Test-Result\2023.02.03\C1b400000.dat";
dataLines=[1, Inf];
[timeC1,dataC1] = importfile(filename, dataLines);
clear dataLines filename
%%
figure1 = figure;
set(gcf,'position',[0,0,415,100])
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(timeC1*1e6,dataC1,'Color',[0.5 0.5 0]);
% ylabel('Current (A)','FontName','Times New Roman');
% xlabel('Time (\mus)','FontName','Times New Roman');
% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[-50 50]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[-2 2]);
box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',12);
%%

filename="G:\My Drive\WPT-MOTOR\Test-Result\2023.02.03\C2b400000.dat";
dataLines=[1, Inf];
[timeC2,dataC2] = importfile(filename, dataLines);
clear dataLines filename
%%
figure1 = figure;
set(gcf,'position',[0,0,411,100])
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(timeC2*1e6,dataC2,'Color',[0.741176470588235 0 0.184313725490196]);
% ylabel('Voltage (V)','FontName','Times New Roman');
% xlabel('Time (\mus)','FontName','Times New Roman');
% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[-50 50]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[-120 120]);
box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',12);
%%
filename="G:\My Drive\WPT-MOTOR\Test-Result\2023.02.03\C3b400000.dat";
dataLines=[1, Inf];
[timeC3,dataC3] = importfile(filename, dataLines);
clear dataLines filename
%%
figure1 = figure;
set(gcf,'position',[0,0,415,100])
axes1 = axes('Parent',figure1);
hold(axes1,'on');
plot(timeC3*1e6,dataC3,'Color',[0 0 0.8]);
% ylabel('Current (A)','FontName','Times New Roman');
% xlabel('Time (\mus)','FontName','Times New Roman');
% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[-50 50]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[0 10]);
box(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',12)
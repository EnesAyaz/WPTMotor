%Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 6);
% Specify range and delimiter
opts.DataLines = [2, Inf];
opts.Delimiter = "\t";
% Specify column names and types
opts.VariableNames = ["time", "VVDAVSA", "VVGAVSA", "Vvgap", "Vvsa", "IR3"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double"];
% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
% Import the data
ZVSIPT = readtable("D:\Github\WPTMotor\Journal-DC-Motor\v8.0\Soft-Switch\Spice-files\ZVS-IPT.txt", opts);
% ZVSIPT = readtable("D:\Github\WPTMotor\Journal-DC-Motor\v8.0\Soft-Switch\Spice-files\ZVS-motor.txt", opts);
%Clear temporary variables
clear opts
%%
time=ZVSIPT.time;
VDSA=ZVSIPT.VVDAVSA;
VGSA=ZVSIPT.VVGAVSA;
VDSAP=ZVSIPT.Vvsa;
VGSAP=ZVSIPT.Vvgap;
Iinv=-ZVSIPT.IR3;
%%
figure1 = figure('Position', [0 0 600 200]);
axes1 = axes('Parent',figure1,'Position',[0.13 0.115 0.775 0.815],...
    'YTick',[0 40 80 120]);
hold(axes1,'on');
colororder([0 0.447 0.741]);
yyaxis(axes1,'left');
plot(time,VDSA,'LineWidth',1,'Color',[0 0 1]);
ylabel({'V_{DS} (V)'});
set(axes1,'YColor',[0 0 1],'YTick',[0 40 80 120]);
ylim([-10 120])
yyaxis(axes1,'right');
plot(time,VGSA,'LineWidth',1,'LineStyle','--','Color',[1 0 0]);
ylabel({'V_{GS} (V)'},'Color',[1 0 0]);
set(axes1,'YColor',[1 0 0]);
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',12,'XTick',zeros(1,0));
xlim([1e-3 1.025e-3])
ylim([-5 10])
%%

figure1 = figure('Position', [0 0 600 200]);
axes1 = axes('Parent',figure1,'Position',[0.13 0.115 0.775 0.815],...
    'YTick',[0 40 80 120]);
hold(axes1,'on');
colororder([0 0.447 0.741]);
yyaxis(axes1,'left');
plot(time,VDSAP,'LineWidth',1,'Color',[0 0 1]);
ylabel({'V_{DS} (V)'});
set(axes1,'YColor',[0 0 1],'YTick',[0 40 80 120]);
ylim([-10 120])
yyaxis(axes1,'right');
plot(time,VGSAP,'LineWidth',1,'LineStyle','--','Color',[1 0 0]);
ylabel({'V_{GS} (V)'},'Color',[1 0 0]);
set(axes1,'YColor',[1 0 0]);
hold(axes1,'off');
set(axes1,'FontName','Times New Roman','FontSize',12,'XTick',zeros(1,0));
xlim([1e-3 1.025e-3])
ylim([-5 10])
%%
figure1 = figure('Position', [0 0 600 200]);
axes1 = axes('Parent',figure1,'Position',[0.13 0.115 0.775 0.815]);
hold(axes1,'on');
colororder([0 0.447 0.741]);
plot(time,Iinv,'LineWidth',1,'Color',[0 0 0]);
ylabel({'I_{inv} (A)'});
set(axes1,'YColor',[0 0 0]);
set(axes1,'FontName','Times New Roman','FontSize',12,'XTick',zeros(1,0));
xlim([1e-3 1.025e-3])
ylim([0 15])

%%
figure('Position', [0 0 600 200]);
yyaxis left
plot(time,VDSA,'LineWidth',1,'LineStyle','-', 'color','b')
hold on;
% plot(time,VDSAP,'LineWidth',1,'LineStyle','-', 'color','b')
xlim([1e-3 1.025e-3])
ylim([0 120])
yyaxis right
plot(time,VGSA,'LineWidth',1,'LineStyle','--', 'color','r')
hold on;
% plot(time,VGSAP,'LineWidth',1,'LineStyle','-', 'color','k')
% xlim([1e-3 1.0248e-3])
ylim([-5 10])

%%
figure('Position', [0 0 400 300]);
yyaxis left
plot(time,VGSA,'LineWidth',1,'LineStyle','-', 'color','k')
hold on;
plot(time,VGSAP,'LineWidth',1,'LineStyle','--', 'color','k')
xlim([1e-3 1.0248e-3])

yyaxis right
plot(time,VDSA,'LineWidth',1,'LineStyle','-', 'color','b')
hold on;
plot(time,VDSAP,'LineWidth',1,'LineStyle','--', 'color','b')
xlim([1e-3 1.0248e-3])

%%
yyaxis left;
plot(time,VGSA);
yyaxis right; 
plot(time,VDSA);
xlim([1.01e-3 1.06e-3])

%%
yyaxis left;
plot(time,VGSAP);
yyaxis right; 
plot(time,VDSAP);
xlim([1.01e-3 1.06e-3])

%%

plot(time,Iinv)


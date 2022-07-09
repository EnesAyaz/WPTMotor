opts = delimitedTextImportOptions("NumVariables", 3);
opts.DataLines = [1, Inf];
opts.Delimiter = ["\t", ","];

opts.VariableNames = ["Freq1", "Vout", "angle"];
opts.VariableTypes = ["double", "double", "double"];

opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

opts = setvaropts(opts, ["Vout", "angle"], "TrimNonNumeric", true);
opts = setvaropts(opts, ["Vout", "angle"], "ThousandsSeparator", ",");

tbl = readtable("D:\Github\WPTMotor\Synhronous motor\System-Design\LTspice\Frequency_domain_SN.txt", opts);

Freq = tbl.Freq1;
Vout = tbl.Vout;
angle = tbl.angle;

clear opts tbl

%%

% figure();
% plot(Freq/1e3,(10.^(Vout/20))*pi/2/sqrt(2))
% xlim([40 120])
% grid on;




figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(Freq/1e3,(10.^(Vout/20))*pi/2/sqrt(2),'Color',[0 0 1]);
xlim([40 120])
% Create ylabel
ylabel({'V_{OUT}'},'FontSize',15);

% Create xlabel
xlabel({'Frequency (kHz)'},'FontSize',15);

% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[40 120]);
box(axes1,'on');
grid(axes1,'on');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'FontName','Times New Roman','FontSize',12,'GridAlpha',0.5);
% Create textarrow
annotation(figure1,'textarrow',[0.608928571428571 0.469642857142855],...
    [0.883333333333334 0.880952380952383],'String',{'8.5 V'},'FontSize',15,...
    'FontName','Times New Roman');

% Create textbox
annotation(figure1,'textbox',...
    [0.72142857142857 0.726190476190477 0.155357142857143 0.0880952380952382],...
    'String','R_L = 1.2',...
    'FontSize',15,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none',...
    'BackgroundColor',[1 1 1]);
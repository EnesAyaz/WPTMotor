opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
opts.VariableNames = ["time", "Curr"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";

% tbl = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2022.07.28\C2if_maq0-zoom00000.dat", opts);
% tb2 = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2022.07.28\C2if_maq03-zoom00000.dat", opts);
% tb3 = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2022.07.28\C2if_maq05-zoom00000.dat", opts);

tbl = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2022.08.10\C2ifield_maq0-zoom00000", opts);
tb2 = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2022.08.10\C2ifield_maq03-zoom00000", opts);
tb3 = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2022.08.10\C2ifield_maq05-zoom00000", opts);

% tbl = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2022.07.28\C4iconv_maq05-zoom00000.dat", opts);
% tb2 = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2022.07.28\C3iph_maq03-zoom00000.dat", opts);
% tb3 = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2022.07.28\C3iph_maq05-zoom00000.dat", opts);
time1 = tbl.time;
Curr1 = tbl.Curr;
time2 = tb2.time;
Curr2 = tb2.Curr;
time3 = tb3.time;
Curr3 = tb3.Curr;
clear opts tbl
%%

plot(time3,Curr3)
%%
mean(Curr1)
rms(Curr1)
max(Curr1)/sqrt(2)
max(Curr1)-min(Curr1)

%%

figure1 = figure();
axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(time1, Curr1-mean(Curr1),'r')

plot(time2, Curr2-mean(Curr2),'b')

plot(time3, Curr3-mean(Curr3),'m')


% xlim([-0.2 0.2])
% % 
% set(axes1,'XTick',[-0.2, -0.1,  0,  0.1, 0.2], ...
%     'XTickLabel',{'0','100','200','300','400'}, ...
%     'YTick',[-0.6 -0.4 -0.2, 0 0.2 0.4 0.6], ...
%     'FontName','TimesNewRoman','FontSize',14);

xlim([-0.5 0.5])
% 
set(axes1,'XTick',[-0.5, -0.25,  0,  0.25, 0.5], ...
    'XTickLabel',{'0','250','500','750','1000'}, ...
    'YTick',[-0.1, -0.05 0 0.05 0.1], ...
    'FontName','TimesNewRoman','FontSize',14);

legend1 = legend(axes1,'show',{'$m_a=0$','$m_a=0.3$','$m_a=0.5$'},'interpreter','Latex','FontName','TimesNewRoman','FontSize',15);
set(legend1,...
    'Location','Best',...
    'EdgeColor','none',...
    'Color','white');

xlabel({'Time (ms)'},'interpreter','latex','FontName','Times New Roman',...
    'FontSize',18);

% Create xlabel
ylabel('Current (A)','interpreter','latex','FontName','Times New Roman',...
    'FontSize',18);




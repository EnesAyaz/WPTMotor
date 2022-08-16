opts = delimitedTextImportOptions("NumVariables", 2);
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
opts.VariableNames = ["time", "Curr"];
opts.VariableTypes = ["double", "double"];
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
tbl = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2022.08.10\C2ifield_maq05-zoom00000", opts);
tbl = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2022.08.10\C3iconv_maq05-zoom00000.dat", opts);
tbl = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2022.08.10\C4imotor_maq05-zoom00000", opts);
time = tbl.time;
Curr = tbl.Curr;
clear opts tbl
%%

plot(time,Curr)
mean(Curr)
rms(Curr)
max(Curr)/sqrt(2)
max(Curr)-min(Curr)

%%
% plot(Curr-mean(Curr))
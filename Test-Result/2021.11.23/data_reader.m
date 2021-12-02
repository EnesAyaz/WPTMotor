%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);
% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
% Specify column names and types
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];
% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
% Import the data
tbl = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2021.11.23\C4modulationSweep_Itx00000.dat", opts);

%% Convert to output type
time = tbl.time;
data = tbl.data;

%% Clear temporary variables
clear opts tbl
%%
% plot(time,data-mean(data))
hold on;
data2=data-mean(data);
data3=movmean(abs(data2),5000);
plot(time,data3)

hold on;


%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);
% Specify range and delimiter
opts.DataLines = [1, Inf];
opts.Delimiter = " ";
% Specify column names and types
opts.VariableNames = ["time", "data"];
opts.VariableTypes = ["double", "double"];
% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";
% Import the data
tbl = readtable("G:\My Drive\WPT-MOTOR\Test-Result\2021.11.23\C4modulationSweep_Itx_v200000.dat", opts);

%% Convert to output type
timev2 = tbl.time;
datav2 = tbl.data;

%% Clear temporary variables
clear opts tbl
%%
% plot(time,data-mean(data))
hold on;
datav22=datav2-mean(datav2);
datav23=movmean(abs(datav22),5000);
plot(time,datav23)

ylim([0 0.6])
%%
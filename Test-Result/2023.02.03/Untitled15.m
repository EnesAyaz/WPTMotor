filename="G:\My Drive\WPT-MOTOR\Test-Result\2023.02.03\C3b400000.dat";
dataLines=[1, Inf];
[timeC3,dataC3] = importfile(filename, dataLines);
clear dataLines filename
%%
mean(dataC3)
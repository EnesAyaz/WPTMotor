filename="G:\My Drive\WPT-MOTOR\Test-Result\2023.02.07\C3c200000.dat";
dataLines=[1, Inf];
[timeC3,dataC3] = importfile(filename, dataLines);
clear dataLines filename

filename="G:\My Drive\WPT-MOTOR\Test-Result\2023.02.07\C4c200000.dat";
dataLines=[1, Inf];
[timeC4,dataC4] = importfile(filename, dataLines);
clear dataLines filename
%%

plot(timeC4,dataC4)
%%

plot(timeC3,dataC3)
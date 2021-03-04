%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 7);

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A3:G27";

% Specify column names and types
opts.VariableNames = ["FrequencykHz", "SimulationGain", "PrimerAkm", "SekonderAkm", "SekonderVoltaj", "InputAkm", "inputVoltaj"];
opts.VariableTypes = ["double", "double", "double", "double", "string", "double", "double"];

% Specify variable properties
opts = setvaropts(opts, "SekonderVoltaj", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "SekonderVoltaj", "EmptyFieldRule", "auto");

% Import the data
IPTfreq = readtable("D:\Github\WPT-Motor\Test-Result\2021.02.18\IPT-freq.xlsx", opts, "UseExcel", false);


%Clear temporary variables
clear opts
%%
RL=8.44;
frequency=IPTfreq.FrequencykHz(2:end);
simulation_gain=IPTfreq.SimulationGain(2:end);

figure();
set(gcf,'Position',[100 100 300 300])
plot(frequency,simulation_gain,'LineWidth',2,'Color','r');
ylabel('Gain($ \frac{Vout}{Vin}$)','Interpreter','Latex','FontSize',12,'FontName','Times New Roman');
xlabel('Frequency(kHz)','Interpreter','Latex','FontSize',12,'FontName','Times New Roman')
grid on;

%%

%% Set up the Import Options and import the data
opts = spreadsheetImportOptions("NumVariables", 6);

% Specify sheet and range
opts.Sheet = "Sheet1";
opts.DataRange = "A4:F24";

% Specify column names and types
opts.VariableNames = ["DutyCycle", "Simulation", "PirmerAkm", "SeconderAkm", "InputCurrent", "InputVoltage"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double"];

% Import the data
IPTDutyCycle = readtable("D:\Github\WPT-Motor\Test-Result\2021.02.18\IPT-Duty-Cycle.xlsx", opts, "UseExcel", false);

%Clear temporary variables
clear opts
%%
RL=8.44;
duty=IPTDutyCycle.DutyCycle(1:end);
simulation_gain=IPTDutyCycle.Simulation(1:end)/sqrt(2);

figure();
set(gcf,'Position',[100 100 300 300])
plot(duty,simulation_gain,'LineWidth',2,'Color','r');
hold on;
ylabel('Gain($ \frac{Vin}{Vdc}$)','Interpreter','Latex','FontSize',12,'FontName','Times New Roman');
xlabel('Duty Cycle','Interpreter','Latex','FontSize',12,'FontName','Times New Roman')
grid on;
ylim([0 1])


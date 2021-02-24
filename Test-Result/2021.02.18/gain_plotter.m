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
seconder_current=IPTfreq.SekonderAkm(2:end)/1000;
seconder_voltage=seconder_current*RL;
experiment_gain=1.1107*seconder_voltage./IPTfreq.inputVoltaj(2:end);

figure();
plot(frequency,simulation_gain,'LineWidth',2,'Color','r');
hold on;
plot(frequency,experiment_gain,'x','LineWidth',5,'Color','b');
ylabel('Gain','Interpreter','Latex','FontSize',15);
xlabel('Frequency(kHz)','Interpreter','Latex','FontSize',15)
legend('simulation','experiment','FontSize',15,'box','off', ...
    'Interpreter','Latex' ...
     ,'Position',[0.5 0.3 0.3 0.1]);
grid on;

error=((experiment_gain-simulation_gain)./simulation_gain)*100;
figure();
plot(frequency,error,'LineWidth',2,'Color','r');
ylabel(' $\Delta $Gain','Interpreter','Latex','FontSize',15);
xlabel('Frequency(kHz)','Interpreter','Latex','FontSize',15)
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
duty=IPTDutyCycle.DutyCycle(2:end-1);
simulation_gain=IPTDutyCycle.Simulation(2:end-1)/sqrt(2);
seconder_current=IPTDutyCycle.SeconderAkm(2:end-1)/1000;
seconder_voltage=seconder_current*RL;
experiment_gain=seconder_voltage./IPTDutyCycle.InputVoltage(2:end-1)/0.547;

figure();
plot(duty,simulation_gain,'LineWidth',2,'Color','r');
hold on;
plot(duty,experiment_gain,'x','LineWidth',5,'Color','b');
ylabel('Gain','Interpreter','Latex','FontSize',15);
xlabel('Duty Cycle','Interpreter','Latex','FontSize',15)
legend('simulation','experiment','FontSize',15,'box','off', ...
    'Interpreter','Latex' ...
     ,'Position',[0.4 0.2 0.3 0.1]);
grid on;


error=((experiment_gain-simulation_gain)./simulation_gain)*100;
figure();
plot(duty,error,'LineWidth',2,'Color','r');
ylabel(' $\Delta $Gain','Interpreter','Latex','FontSize',15);
xlabel('Frequency(kHz)','Interpreter','Latex','FontSize',15)
grid on;

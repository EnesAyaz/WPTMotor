file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.11.23\";

% data_name="C2VAB-50V-noload-onlyMotor00000";
% 
% data_name="C2VAB-50V-noload-simultaneous00000";


data_name="C3ImA-50V-noload-onlyMotor00000";
%  
% data_name="C3ImA-50V-noload-simultaneous00000";

filename=strcat(file_location,data_name);

dataLines= [1 inf];

[time,data]=importfile_only_sim(filename, dataLines);

clear filename file_location dataLines data_name;
%%
plot(time, data)
%%
data2=lowpass(data,1e5,1/1.9998e-08);
plot(time, data2)
% plot(time+ 0.0022, data2)
hold on;
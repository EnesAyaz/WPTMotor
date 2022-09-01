[time,data] =importfile('G:\My Drive\WPT-MOTOR\Test-Result\2022.08.29\withoutWPT2\C1_00000.dat');

C1_time=time;
C1_data=data;

[time,data] =importfile('G:\My Drive\WPT-MOTOR\Test-Result\2022.08.29\withoutWPT2\C2_00000.dat');

C2_time=time;
C2_data=data;

[time,data] =importfile('G:\My Drive\WPT-MOTOR\Test-Result\2022.08.29\withoutWPT2\C3_00000.dat');

C3_time=time;
C3_data=data;

[time,data] =importfile('G:\My Drive\WPT-MOTOR\Test-Result\2022.08.29\withoutWPT2\C4_00000.dat');

C4_time=time;
C4_data=data;

%%
plot(C1_time,C1_data)
hold on;
plot(C2_time,C2_data)
hold on;
plot(C3_time,C3_data)
hold on;
plot(C4_time,C4_data)
hold on;
%%
P=C1_data.*C4_data+C2_data.*C3_data;

plot(C1_time,P)

real_power=mean(P)*ones(size(C1_time));

plot(C1_time,real_power)

P_in=273;

eff=-mean(P)/P_in

%%
i=1;
[time,data] =importfile('G:\My Drive\WPT-MOTOR\Test-Result\2022.08.29\with_WPT2\C1_00000.dat');

C1_time=time(i:end);
C1_data=data(i:end);

[time,data] =importfile('G:\My Drive\WPT-MOTOR\Test-Result\2022.08.29\with_WPT2\C2_00000.dat');

C2_time=time(i:end);
C2_data=data(i:end);

[time,data] =importfile('G:\My Drive\WPT-MOTOR\Test-Result\2022.08.29\with_WPT2\C3_00000.dat');

C3_time=time(i:end);
C3_data=data(i:end);

[time,data] =importfile('G:\My Drive\WPT-MOTOR\Test-Result\2022.08.29\with_WPT2\C4_00000.dat');

C4_time=time(i:end);
C4_data=data(i:end);
%%
plot(C1_time,C1_data)
hold on;
plot(C2_time,C2_data)
hold on;
plot(C3_time,C3_data)
hold on;
plot(C4_time,C4_data)
hold on;

%%

P=C1_data.*C4_data+C2_data.*C3_data;

plot(C1_time,P)

real_power=mean(P)*ones(size(C1_time));

plot(C1_time,real_power)

P_in=312;
% 
eff=-mean(P)/P_in

%%
% i=1546920+6.6667e+05;
% j=3546920+6.6667e+05;
% C3_data_2=data(i:end);
% plot(C3_time,C3_data)
% hold on;
% plot(C4_time,C4_data)
% hold on;
% plot(C3_time,C3_data_2)
% hold on;
% plot(C4_time,C3_data-C3_data_2)

clear;
clc;

file_location="G:\My Drive\WPT-MOTOR\Test-Result\2021.11.29\";

name="C1VAB_m06_1kHz_phase000000.dat";

name="C1VAB_m06_1kHz_phase47.500000.dat";
% 
% 
% name="C1VAB_m08_1kHz_phase5000000.dat";

filename=strcat(file_location,name);
dataLines=[1 inf];

[time, data] = importfile(filename, dataLines);

clear name filename
%%
figure();
plot(time,data)
%%
data(data>20)=20;
data(data<19 & data>-19)= 0;
data(data<-20) =-20;
figure();
plot(time,data)
%%

f_s= 1/(time(2)-time(1));
y = fft(data);
L=length(y);
P2= abs(y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);
f= f_s*(0:(L/2))/L;
figure();
stem(f,P1)
xlim([0 85e3])
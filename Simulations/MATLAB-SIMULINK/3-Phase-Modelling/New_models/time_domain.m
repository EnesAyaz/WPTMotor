A=0.6;
B=0.1;
fs=40e3;
fsM2fo=39400;
fsP2fo=40600;

time=linspace(0,400/fs,100000);
A_fs=A*sin(2*pi*fs*time)-A*sin(2*pi*fs*time-2*pi/3);
plot(time,A_fs)

B_fsM2fo=B*sin(2*pi*fsM2fo*time)-B*sin(2*pi*fsM2fo*time+2*pi/3);

B_fsP2fo=B*sin(2*pi*fsP2fo*time)-B*sin(2*pi*fsP2fo*time-2*pi/3);

hold on; 

plot(time,B_fsM2fo);

hold on;

plot(time,B_fsP2fo);

%%
plot(time,abs(B_fsM2fo+B_fsP2fo));

%%
plot(time,abs(A_fs+B_fsP2fo));

%%

plot(time,abs(A_fs+B_fsM2fo));

% All data is in the google-drive 

%% DATA1
% Transmitter(Itx) and receiver current(Irx) only 50V
% Tx should be multiplied 10
% 80 kHz, d=0.5, RLoad_WPT=8.44 
load('D:\GoogleDrive\WPT-MOTOR\Test-Result\2021.01.29\data1\data.mat')
figure();
plot(Itx.time*1e6,Itx.data*10,'r','LineWidth',3);
hold on;
plot(Irx.time*1e6,Irx.data,'b','LineWidth',3);
ylabel('Current(A)');
xlabel('time(us)')
legend('Tx-Current','Rx-Current')
 set(gca,'Fontsize',16);
% Power Calculation 
Pin=rms(Itx.data*10)*45; % %50*4/pi/sqrt(2)
Pout=rms(Irx.data)^2*8.4

%% DATA2
% Transmitter(Itx) and receiver current(Irx) only 70V
% Tx should be multiplied 10
% 80 kHz, d=0.8, RLoad_WPT=8.44 
load('D:\GoogleDrive\WPT-MOTOR\Test-Result\2021.01.29\data2\data.mat')
figure();
plot(Itx.time,Itx.data*10);
hold on;
plot(Irx.time,Irx.data);
legend('Tx-Current','Rx-Current')

% Power Calculation 
Pin=rms(Itx.data*10)*37 %70*4/pi*cos(3*pi/10)/sqrt(2)
Pout=rms(Irx.data)^2*8.44

%% DATA3
% Transmitter(Itx) and receiver current(Irx) , RL Load (IRL) 70V
% IRL should be multiplied 10
% 80 kHz, d=0.8, RLoad_WPT=8.44 
load('D:\GoogleDrive\WPT-MOTOR\Test-Result\2021.01.29\data3\data.mat')
figure();
plot(Itx.time,Itx.data);
hold on;
plot(Irx.time,Irx.data);
hold on;
plot(IRL.time,IRL.data*10);
legend('Tx-Current','Rx-Current','RL-Current')

% Power Calculation 
% Pin=rms(Itx.data*10)*37 %70*4/pi*cos(3*pi/10)/sqrt(2)
% Pout=rms(Irx.data)^2*8.44
%% DATA 2-3 Comparison 
load('D:\GoogleDrive\WPT-MOTOR\Test-Result\2021.01.29\data2\data.mat')
Itx_time_only= Itx.time;
Irx_time_only= Irx.time;
Itx_data_only=Itx.data;
Irx_data_only=Irx.data;
load('D:\GoogleDrive\WPT-MOTOR\Test-Result\2021.01.29\data3\data.mat')
Itx_time= Itx.time;
Irx_time= Irx.time;
Itx_data=Itx.data;
Irx_data=Irx.data;
IRL_time=IRL.time;
IRL_data=IRL.data;

figure1=figure();
subplot(3,1,1)
plot(Itx_time_only*1e6,Itx_data_only*10,'r','LineWidth',1);
hold on;
plot(Itx_time*1e6,Itx_data,'b','LineWidth',1);
hold on;
legend('Tx-Current-Only','Tx-Current','Fontsize',12)

subplot(3,1,2)
plot(Irx_time_only*1e6,Irx_data_only,'r','LineWidth',1);
hold on;
plot(Irx_time*1e6,Irx_data,'b','LineWidth',1);
hold on;
ylabel('Current(A)');
set(gca,'Fontsize',16)
legend('Rx-Current-Only','Rx-Current','Fontsize',12)

subplot(3,1,3)
plot(IRL_time*1e6,IRL_data*10,'b','LineWidth',1);
ylim([0,6])
xlabel('time(us)')
set(gca,'Fontsize',16)
legend('RL-Current','Fontsize',12)



%% DATA4
% Transmitter(Itx) and receiver current(Irx) , Motor Current (Im), Motor 
% Current only(Im_only) 70V
% Im and Im_only  should be multiplied 10
% 80 kHz, d=0.8, RLoad_WPT=8.44 
load('D:\GoogleDrive\WPT-MOTOR\Test-Result\2021.01.29\data4\data.mat')
figure1=figure();
subplot(2,1,1)
plot(Itx.time,Itx.data);
hold on;
plot(Irx.time,Irx.data);
hold on;
legend('Tx-Current','Rx-Current')
subplot(2,1,2)
plot(Im.time,Im.data*10);
legend('Tx-Current','Rx-Current','RL-Current')
hold on;
plot(Im_only.time,Im_only.data*10);
legend('Motor-Current','Only-Motor-Current')
diff=int2str(((mean(Im.data*10)-mean(Im_only.data*10))/mean(Im_only.data*10))*100);
diff=strcat('Difference %',diff);

annotation(figure1,'textbox',...
[0.153857142857143 0.134285714285714 0.200428571428571 0.0476190476190477],...
'String',{diff},...
'FitBoxToText','off', 'EdgeColor','none','FontSize',10);

%%
%% DATA5
% Transmitter(Itx) and receiver current(Irx) , Motor Current (Im), 
% Transmitter(Itx_only) and receiver current(Irx_only)  Motor Current only(Im_only) 100V
% Im and Im_only  should be multiplied 10
% 80 kHz, d=0.8, RLoad_WPT=8.44 
load('D:\GoogleDrive\WPT-MOTOR\Test-Result\2021.01.29\data5\data.mat')
figure1=figure();
subplot(3,1,1)
plot(Itx.time,Itx.data,'r','LineWidth',1);
hold on;
plot(Itx_only.time,Itx_only.data,'--b','LineWidth',1);
hold on;
legend('Tx-Current','Tx-Current-Only','Fontsize',12)

subplot(3,1,2)
plot(Irx.time,Irx.data,'r','LineWidth',1);
hold on;
plot(Irx_only.time,Irx_only.data,'--b','LineWidth',1);
hold on;
ylabel('Current(A)');
set(gca,'Fontsize',16)
legend('Rx-Current','Rx-Current-Only','Fontsize',12)

subplot(3,1,3)
plot(Im.time,Im.data*10,'r','LineWidth',1);
legend('Tx-Current','Rx-Current','RL-Current')
hold on;
plot(Im_only.time,Im_only.data*10,'--b','LineWidth',1);
xlabel('time(us)')
set(gca,'Fontsize',16)
legend('Motor-Current','Only-Motor-Current','Fontsize',12)


% diff=int2str(((mean(Im.data*10)-mean(Im_only.data*10))/mean(Im_only.data*10))*100);
% diff=strcat('Difference %',diff);
% annotation(figure1,'textbox',...
% [0.153857142857143 0.134285714285714 0.200428571428571 0.0476190476190477],...
% 'String',{diff},...
% 'FitBoxToText','off', 'EdgeColor','none','FontSize',10);

 
%%

plot(Itx.time,Itx.data);
hold on;
plot(Itx2.time, Itx2.data);





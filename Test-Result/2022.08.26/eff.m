Vout_motor=[83.5 74 65.3 58.3 52.5];
Vout_motor_ipt=[84 73.6 64.9 57.8 52.1];
R_motor=[103.8 51.8 34.5 25.9 20.7];
Vin=100;
Iin_motor=[2.35 3.05 3.54 3.91 4.17];
Iin_motor_ipt=[2.62 3.27 3.75 4.10 4.36];

Itx=1.06;
Irx=2.33;
Rrx=0.072;
Rtx=0.1368;

Vout_ipt=15;
Rload_ipt=8.3;
P_ipt=Vout_ipt*Vout_ipt/Rload_ipt;
P_tx=Rtx*Itx*Itx;
P_rx=Rrx*Irx*Irx;

Pout_motor=Vout_motor.*Vout_motor./R_motor;
Pin_motor=Vin*Iin_motor;
Loss_motor=Pin_motor-Pout_motor;


Pout_motor_ipt=Vout_motor_ipt.*Vout_motor_ipt./R_motor;
Pin_motor_ipt=Vin*Iin_motor_ipt;
Loss_motor_ipt=Pin_motor_ipt-Pout_motor_ipt-P_ipt-P_tx-P_rx;

% plot(Loss_motor)
% hold on;
% plot(Loss_motor_ipt)
% hold on;
plot(Pin_motor_ipt,Loss_motor-Loss_motor_ipt)
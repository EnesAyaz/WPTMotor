Vout_motor=52.5;
Vout_motor_ipt=52.1;
R_motor=20.7;
Vin=100;
Iin_motor= 4.17;
Iin_motor_ipt=4.36;

Itx=1.06;
Irx=2.33;
Rrx=0.072;
Rtx=0.1368;

Vout_ipt=15;
Rload_ipt=7.8;
P_ipt=Vout_ipt*Vout_ipt/Rload_ipt;
P_tx=Rtx*Itx*Itx;
P_rx=Rrx*Irx*Irx;

Pout_motor=Vout_motor.*Vout_motor./R_motor;
Pin_motor=Vin*Iin_motor;
Loss_motor=Pin_motor-Pout_motor;


Pout_motor_ipt=Vout_motor_ipt.*Vout_motor_ipt./R_motor;
Pin_motor_ipt=Vin*Iin_motor_ipt;
Loss_motor_ipt=Pin_motor_ipt-Pout_motor_ipt-P_ipt-P_tx-P_rx;
loss_motor_additional= -Loss_motor+Loss_motor_ipt;
power_IPT= P_ipt+P_tx+P_rx;
%%
power= [Loss_motor, loss_motor_additional,  P_ipt,P_tx+P_rx, Pout_motor ]
labels = {'Motor and drive losses','Additional drive losses','IPT output power','IPT coil losses','Load Power'};
explode = [1 1 1 1 1];
pie(power,explode)

legend(labels);


power= [Pin_motor Loss_motor, Pout_motor ]

power= [Pin_motor_ipt Pout_motor_ipt Loss_motor_ipt, P_tx+P_rx,  P_ipt ]

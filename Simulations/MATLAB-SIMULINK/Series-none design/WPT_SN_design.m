Vin_rms=35; % IPt input voltage V rms
Vout= 24 ;  %IPT  rectified output voltage V DC
Vout_rms= Vout/0.9; % IPT output voltage before rectification V rms
fr=80 ;  % resonanse frequency kHz
wr=fr*1000*2*pi;  % resonance angular frequency rad/sec;
k= 0.8; % coupling (strong :D)
Pout=96;  % Output power W
R_ac= Vout_rms*Vout_rms/Pout; % output reflected resistance from rectifier ohm
Q=1;                          % Quality factor of Rx side
Lrx=Q*R_ac/wr;
n= Vin_rms/Vout_rms;          % 1/voltage gain at resonant frequency of Lr Cr
Ltx=Lrx*n^2/k^2;
M=k*sqrt(Ltx*Lrx);
Lr=(1-k^2)*Ltx;
Cr= 1/(wr^2*Lr);

[Ltx*1e6 Lrx*1e6 M*1e6 Lr*1e6 Cr*1e9]


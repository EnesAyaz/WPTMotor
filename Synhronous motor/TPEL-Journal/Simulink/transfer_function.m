syms s R L2 C2 M L1 C1

Z1= R+1/(s*C2)+s*L2 ;
Z2= s*M;
Z3= 1/((1/Z1)+(1/Z2));

Z4=1/(s*C1)+s*L1;

Vou=(Z3/(Z4+Z3))*R/Z1;

simplify(Vou)

%%
f=160.8e3;
w=2*pi*f;
L1=63e-6;
L2=100e-6;
M=18e-6;
C1=1/w/w/(L1+M);
C2=1/w/w/(L2+M);
R=40;

sn3=C1*C2*M*R;
sd4=C1*C2*L1*L2+C1*C2*L1*M+C1*C2*L2*M;
sd3= C1*C2*L1*R+ C1*C2*M*R;
sd2= C1*L1+C2*L2+C1*M+C2*M;
sd1=C2*R;
sd0=1;

sys= tf([sn3 0 0 0],[sd4 sd3 sd2 sd1 sd0]);

% Q=1;
% wm= 2*pi*160e3;
% sn1=wm/Q;
% sd1=wm/Q;
% sd0=wm^2;
% 
% sys= tf([sn1 0],[1 sd1 sd0]);
% w=wm;


w1 = linspace(0,4*w,2000);
[mag1,phase1] = bode(sys,w1);
% stepplot(sys)
f1= w1/2/pi;
mag=reshape(mag1,[1,length(mag1)]);
phase=reshape(phase1,[1,length(phase1)]);

plot(f1,mag)
xlim([0e3 400e3])
xlim([158e3 162e3])

%%
figure();
data=VAB.signals.values;
time=VAB.time;
% data=CA.signals.values;
% time=CA.time;
% data=VRX.signals.values;
% time=VRX.time;
% data=Vrx_rec.signals.values;
% time=Vrx_rec.time;
lsim(sys,data,time)
data2=lsim(sys,data,time);
%%
figure();
plot(time,data2)


%% envelope

fl2 = 1;
[up2,lo2] = envelope(data2,fl2,'peak');
plot_param = {'Color', [0.6 0.1 0.2],'Linewidth',2}; 


% plot(time,data2)
hold on;
plot(time,lo2)
hold on
plot(time,up2)
hold off
title('Hilbert Envelope')
xlim([0 1e-2])


%%
figure();
T=time(2)-time(1);
Fs=1/T;
L=length(time);

Y = fft(data2);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
stem(f,P1/2.2) 
xlim([158e3 162e3])


%%





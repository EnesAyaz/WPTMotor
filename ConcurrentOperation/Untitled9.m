sample_time=1e-7;

fs1=80e3;
fs2=120e3;

time=0:sample_time:1e-4;

Afs1=0.4;
Afs2=0.2;

Mfs1= Afs1*cos(2*pi*fs1*time);
Mfs2=Afs2*cos(2*pi*fs2*time);

Sfs1=(Mfs1>0==1);
Sfs2=(Mfs2>0==1);

plot(time,Mfs1)
hold on;
plot(time,Mfs2)

ylim([-2 2])
%%
Sfs1=(Mfs1>0==1);
Sfs2=(Mfs2>0==1);

figure()
plot(time,Sfs1)
hold on;
plot(time,Sfs2)
hold on; 
%%
figure()
plot(time,(Sfs1+Sfs2)/2)

%%

Msf1sin=sqrt(1-Mfs1.^2);
Msf2sin=sqrt(1-Mfs2.^2);

C= sqrt((Mfs1+Mfs2).^2+(Msf1sin+Msf2sin).^2 );



plot(time,Mfs1+Mfs2)
hold on;
ylim([-2 2])


%%
A=(Mfs1+Mfs2)>0==1;

Fs= 1/sample_time;
Y = fft(A);
L=length(A);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
plot(f,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([100e3 200e3])

% y=acos(Mfs1+Mfs2);
%%

% plot(time,y)
% hold on;
% plot(time,Mfs1+Mfs2)
%%
plot(time,A)

for i=1:1:length(A)
   
    
    
    
end









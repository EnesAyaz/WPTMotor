sample_time=1e-7;

fs1=20e3;
fs2=100e3;

% fl=(fs2-fs1)/4;
% fh= (fs2+fs1)/2;

time=0:sample_time:4/(fs1);

Afs1=0.4;
Afs2=0.5;

Mfs1= Afs1*cos(2*pi*fs1*time);
Mfs2=Afs2*cos(2*pi*fs2*time);

Sfs1=int8(Mfs1>0==1);
Sfs2=int8(Mfs2>0==1);

plot(time,Sfs1);
hold on;
plot(time,Sfs2+2);

Sfsd=Sfs1.*Sfs2;
%%
figure();
plot(time,Sfsd)
%%
A=Sfsd;
Fs= 1/sample_time;
Y = fft(A);
L=length(A);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
stem(f,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 200e3])


%%






Mfsd=Mfs1+Mfs2;

plot(time,Mfsd);
%%

A=Mfs2;
Fs= 1/sample_time;
Y = fft(A);
L=length(A);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
stem(f,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")
xlim([0 400e3])
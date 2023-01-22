ts=1e-8;

f1=80e3;
f2=120e3;

Af1=10;
Af2=8;

Cf1_tot=[];
wst_tot=[];
Afx_tot=[];

fsample=4*(f1+f2);
tsample= 1/fsample;

for time=tsample:tsample:1e-2
    
Ax=Af1*cos(2*pi*f1*time);
Ay=Af1*sin(2*pi*f1*time);

Bx=Af2*cos(2*pi*f2*time);
By=Af2*sin(2*pi*f2*time);


Cf1=sqrt((Ax+Bx)^2+(Ay+By)^2 );

wst=atan((Ay+By)/(Ax+Bx));

Afx= Cf1*cos(wst);

Afx_tot=[Afx_tot Afx];
% Cf1
% _tot=[Cf1_tot Cf1];
wst_tot=[wst_tot wst];
% time
end
%%
plot(wst_tot)
%%
plot(Afx_tot)
%%

Fs= fsample;
Y = fft(Afx_tot);
L=length(Afx_tot);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
plot(f,P1) 
title("Single-Sided Amplitude Spectrum of X(t)")
xlabel("f (Hz)")
ylabel("|P1(f)|")
% xlim([0 200e3])





data=VAB.signals.values;
time= tout;
%%
T=time(2)-time(1);
Fs=1/T;
L=length(time);

Y = fft(data);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(L/2))/L;
stem(f,P1/10) 
xlim([0 20e3])

%%


data1=VAB{1}.Values;
time=data1.Time;
data=data1.Data;
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
% data(time>0.0025)=[];
% time(time>0.0025)=[];
% plot(time,data)
T=time(2)-time(1);
Fs=1/T;
L=length(time);

Y = fft(data);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

P3 = angle(Y/L);
P4 = P3(1:L/2+1);
% P4(2:end-1) = P4(2:end-1);

f = Fs*(0:(L/2))/L;

f=round(f);
stem(f,P1) 
xlim([0e3 100e3])

%%
Pmag=[];
Pangle=[];
Pcomplex=[];
f_ma=[];
for  i=-2000:100:2000
   f_ma=[f_ma, (50000+i)];
   Pmag = [Pmag  P1(f==50000+i)];
   Pangle = [Pangle P4(f==50000+i)];
%    Pcomplex=[Pcomplex P6(f==160000+i)]; 
end
%%
%%
stem(f_ma,Pmag);
hold on;
stem(f_ma,Pangle);


%%
% for  i=-1600:200:1600
%    f_ma=[f_ma, (320000+i)];
%    Pmag = [Pmag  P1(f==320000+i)];
%    Pangle = [Pangle P4(f==320000+i)];
% end
figure();
time=0:1e-7:0.05;
sinx_t=zeros(size(time));
for i=1:length(Pmag)
sinx=Pmag(i)*cos(2*pi*f_ma(i)*time+Pangle(i));
% sinx=Pcomplex(i)*cos(2*pi*f_ma(i)*time);
sinx_t=sinx_t+sinx;
end
plot(time,sinx_t)


%%



fl2 = 1;
[up2,lo2] = envelope(sinx_t,fl2,'peak');
plot_param = {'Color', [0.6 0.1 0.2],'Linewidth',2}; 


% plot(time,data2)
hold on;
% plot(time,lo2)
hold on
plot(time,up2)
hold off
title('Hilbert Envelope')
xlim([0 1e-2])
ylim([0 0.5])
100*(max(up2)-min(up2))/mean(up2)





%%
SA=0.5;
SB=0.5;
beta=52;
alfa=63.5;

S=sqrt(2*SA^2*(1-cosd(beta)));

a = asind(SB*sind(beta)/S)

%%











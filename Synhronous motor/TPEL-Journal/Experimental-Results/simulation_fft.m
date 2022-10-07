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
data=VAB.signals.values;
time=VAB.time;
data=CA.signals.values;
time=CA.time;
data=VRX.signals.values;
time=VRX.time;
data=Vrx_rec.signals.values;
time=Vrx_rec.time;
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
P4(2:end-1) = 2*P4(2:end-1);

f = Fs*(0:(L/2))/L;
f=round(f);
stem(f,P1) 
xlim([0 300e3])

%%
Pmag=[];
Pangle=[];
f_ma=[];
for  i=-1600:200:1600
   f_ma=[f_ma, (160000+i)];
   Pmag = [Pmag  P1(f==160000+i)];
   Pangle = [Pangle P4(f==160000+i)];
end

% for  i=-1600:200:1600
%    f_ma=[f_ma, (320000+i)];
%    Pmag = [Pmag  P1(f==320000+i)];
%    Pangle = [Pangle P4(f==320000+i)];
% end

time=0:1e-7:1/100;
sinx_t=zeros(size(time));
for i=1:length(Pangle)
sinx=Pmag(i)*cos(2*pi*f_ma(i)*time+Pangle(i));
sinx_t=sinx_t+sinx;
end
plot(time,sinx_t)


%%
SA=0.5;
SB=0.5;
beta=52;
alfa=63.5;

S=sqrt(2*SA^2*(1-cosd(beta)));

a = asind(SB*sind(beta)/S)

%%











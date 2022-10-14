fsw=50e3;
fo=100;

meanF=[];
maxF=[];
minF=[];

carrier_B=[];
carrier_C=[];

ma=0.5;

for  carrier_B=0:10:360
    
meanF_1=[];
maxF_1=[];
minF_1=[];
for  carrier_C=0:10:360
    
sim('delta_coils.slx');
    
SA=IABC.signals(1).values;
SB=IABC.signals(2).values; 
SC=IABC.signals(3).values;  
time=IABC.time;

I=SA+SB-SC;

T=time(2)-time(1);
Fs=1/T;
L=length(time);

Y = fft(I);

P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

P3 = angle(Y/L);
P4 = P3(1:L/2+1);

f = Fs*(0:(L/2))/L;

f=5*round(f/5);

Pmag=[];
Pangle=[];
Pcomplex=[];
f_ma=[];

for  i=-2000:100:2000
   f_ma=[f_ma, f(f==50000+i)];
   Pmag = [Pmag  P1(f==50000+i)];
   Pangle = [Pangle P4(f==50000+i)];
end

time=0:1e-7:0.02;
sinx_t=zeros(size(time));
for i=1:length(Pmag)
sinx=Pmag(i)*cos(2*pi*f_ma(i)*time+Pangle(i));
% sinx=Pcomplex(i)*cos(2*pi*f_ma(i)*time);
sinx_t=sinx_t+sinx;
end

fl2 = 1;
[up2,lo2] = envelope(sinx_t,fl2,'peak');

% Ripple =100*(max(up2)-min(up2))/mean(up2);
% Mean=  mean(up2);

meanF_1=[meanF_1, mean(up2)];
maxF_1=[ maxF_1, max(up2)];
minF_1=[minF_1, min(up2)];


end

carrier_B
meanF=[meanF ; meanF_1];
maxF=[maxF; maxF_1];
minF=[minF; minF_1];

end

carrier_B_x=0:10:360;
carrier_B_x=0:10:360;
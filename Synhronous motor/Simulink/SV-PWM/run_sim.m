f_fund=50;
ma=0.2;
phi_carrier=0; % degree
phaseA= 0; % rad
f_carrier=50e3;

out=sim('SVPWM.slx');

%%

time=out.simout.time;
data=out.simout.Data;
sampleTime=time(2)-time(1);
f_s=1/sampleTime;

% plot(time, data)
y = fft(data);

L=length(data);

P2= abs(y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);

f= f_s*(0:(L/2))/L;

% figure(2);
% stem(f,P1);
f_new=[];
P_new=[];
for i=1:((L-1)/2)
   if P1(i)/(max(P1))> 0.005
       f_new = [f_new f(i)];
       P_new= [P_new P1(i)];
   end
end

figure();
stem(f_new,P_new)
xlim([0 200e3])


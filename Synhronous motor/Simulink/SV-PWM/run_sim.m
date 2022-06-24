mx=[];
a=[];
b=[];

for ma=0:0.1:1
f_fund=50;
% ma=0;
phi_carrier=0; % degree
phaseA= 0; % rad
f_carrier=50e3;

out=sim('SVPWM.slx');



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


P3= angle(y/L);
P4=P3(1:L/2+1);
P4(2:end-1)=2*P4(2:end-1);

% figure(2);
% stem(f,P1);
f_new=[];
P_new=[];
Phase_new=[];
for i=1:((L-1)/2)
   if P1(i)/(max(P1))> 0.005
       f_new = [f_new f(i)];
       P_new= [P_new P1(i)];
       Phase_new=[Phase_new P4(i)];
   end
end

% figure();
% subplot(2,1,1)
% stem(f_new,P_new)
% xlim([49e3 51e3])
% subplot(2,1,2)
% stem(f_new,Phase_new*180/pi)
% xlim([49e3 51e3])

a=[a P_new(round(f_new)==50e3)];
b=[b Phase_new(round(f_new)==50e3)];
mx=[mx ma] ;
end

%%
subplot(2,1,1)
plot(mx,a)
subplot(2,1,2)
plot(mx,(b*180/pi)-180)
% ylim([0 180])



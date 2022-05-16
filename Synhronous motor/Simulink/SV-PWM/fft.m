

%%
time=out.simout.time;
data=out.simout.Data;
sampleTime=time(2)-time(1);
f_s=1/sampleTime;


plot(time, data)


y = fft(data);

L=length(data);

P2= abs(y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);

f= f_s*(0:(L/2))/L;

figure(2);
stem(f,P1);
%%
f_new=[];
P_new=[];
for i=1:((L-1)/2)
   if P1(i)/(max(P1))> 0.01
       f_new = [f_new f(i)];
       P_new= [P_new P1(i)];
   end
end
%%
figure(2);
stem(f_new,P_new)
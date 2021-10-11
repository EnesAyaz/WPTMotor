%%

figure(1);
tout=time(1:4000000);
y=VAB(1:4000000);
plot(tout,y);
%%

f_s= 1/(tout(2)-tout(1));

y = fft(y);

L=length(y);

P2= abs(y/L);
P1=P2(1:L/2+1);
P1(2:end-1)=2*P1(2:end-1);

f= f_s*(0:(L/2))/L;

figure(2);
stem(f,P1)
xlim([78000 82000] )
%%
figure(3);
stem(f,P1)
xlim([0 1000] )
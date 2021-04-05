t=IFBA.time;
I=IFBA.data;
dataFreq=1e8;
sampleFreq=1e4;
k=dataFreq/sampleFreq;
x=0;
t1=[];
I1=[];
for i=1:length(I)
    if x<k
        x=x+1;
        
    else 
        t1=[t1 t(i-k)];
        I1=[I1 I(i-k)];
        x=0;
        
    end
    
   
end


figure();
plot(t,I);
hold on;
% plot(t1,I1);
% hold on;

%%
Y1 = fft(I1);
L1=length(I1);
P2 = abs(Y1/L1);
P1 = P2(1:L1/2+1);
P1(2:end-1) = 2*P1(2:end-1);
Fs1=sampleFreq;
f = Fs1*(0:(L1/2))/L1;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
%%
Y1 = fft(I);
L1=length(I);
P2 = abs(Y1/L1);
P1 = P2(1:L1/2+1);
P1(2:end-1) = 2*P1(2:end-1);
Fs1=dataFreq;
f = Fs1*(0:(L1/2))/L1;
plot(f,P1) 
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

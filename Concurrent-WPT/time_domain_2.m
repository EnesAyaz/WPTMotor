X=[];
%%
for ma = 0.2
fout = 50; % Hz
fsw = 1e3; % Hz
fl=fsw-2*fout;
fh=fsw+2*fout;
The_c=0;
The_f=2*pi/3;
phaseP=The_f+0;
carrierPhP=The_c;

Tstep = 1/fsw/1000; % s
Ts = Tstep; % s
Fs=1/Ts;
Tfinal =2/fout ; % s
time_array = 0:Tstep:Tfinal-Tstep;
NumberofSteps = numel(time_array);

m=2; % carrier
n=3; % fundamental
mb=2.*besselj(n,m*ma*pi/2)/(m*pi);
mb=0;
% Time array
%Generate switching signals
VrefP = ma*cos(2*pi*fout*time_array+phaseP)+2*mb*cos(2*pi*fl*time_array-2*phaseP)+2*mb*cos(2*pi*fh*time_array+2*phaseP);
% VrefP = ma*cos(2*pi*fout*time_array+phaseP)-2*mb*cos(2*pi*4*fout*time_array-2*phaseP);
Vtriang = zeros(1, NumberofSteps);
for k = 1:Tfinal*fsw
   Triang_temp = triang(1/(Ts*fsw));
   Vtriang((length(Triang_temp)*(k-1)+1:k/(Tstep*fsw))) = (Triang_temp*2)-1;
end

carP= round(carrierPhP/(fsw*Ts)/360);
if carP==0
    carP=1;
end

VcarrierP = [ Vtriang(carP:end), zeros(1,carP-1)];
SP = double(VrefP > VcarrierP);
%
% figure();
% minus=0;
% hold on; 
% plot(time_array,VcarrierP+minus)
% hold on;
% plot(time_array,VrefP)

% figure();
% plot(time_array,SP)
% hold on;
%%
Y = fft(SP);
P2 = abs(Y/NumberofSteps);
P1 = P2(1:NumberofSteps/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(NumberofSteps/2))/NumberofSteps;
% figure();
% plot(f,P1) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
% xlim([1500 2500])
[al,bl]=find(f==(fsw-2*fout));
[a,b]=find(f==fsw);
[ah,bh]=find(f==(fsw+2*fout));

X=[X; [P1(bl),P1(b),P1(bh)]];

end
display(X)
% Time array
D = 0.5;
Vref=2*D-1;
fout = 50; % Hz
fsw = 50*36; % Hz
Tstep = (1/fsw)/200; % s
Ts = Tstep; % s
Tfinal =2/fout ; % s
time_array = 0:Tstep:Tfinal-Tstep;
NumberofSteps = numel(time_array);
%Generate switching signals
Vtriang = zeros(1, NumberofSteps);
for k = 1:Tfinal*fsw
   Triang_temp = triang(1/(Ts*fsw));
   Vtriang((length(Triang_temp)*(k-1)+1:k/(Tstep*fsw))) = (Triang_temp*2)-1;
end

carrierPhA=0;
carrierPhB=0;
carrierPhC=0;

carA= round(carrierPhA/(fsw*Ts)/360);
if carA==0
    carA=1;
end
carB= round(carrierPhB/(fsw*Ts)/360);
if carB==0
    carB=1;
end
carC= round(carrierPhC/(fsw*Ts)/360);
if carC==0
    carC=1;
end

VcarrierA = [ Vtriang(carA:end), zeros(1,carA-1)];
VcarrierB = [ Vtriang(carB:end), zeros(1,carB-1)];
VcarrierC = [ Vtriang(carC:end), zeros(1,carC-1)];

%% 
VencoderA=zeros([1,NumberofSteps]);
VencoderB=zeros([1,NumberofSteps]);
VencoderC=zeros([1,NumberofSteps]);

for i=1:NumberofSteps
   k=mod(i,1/fout/Ts);
   if k <(1/fout/Ts/2)
       VencoderA(i)=1;
   end
   
   k=mod(i+2/fout/Ts/3,1/fout/Ts);
   if k <(1/fout/Ts/2)
       VencoderB(i)=1;
   end
   
   k=mod(i+4/fout/Ts/3,1/fout/Ts);
   if k <(1/fout/Ts/2)
       VencoderC(i)=1;
   end
   
   
end

% 
% plot(time_array,VencoderA,'LineWidth',1)
% hold on;
% plot(time_array,VencoderB-1.5,'LineWidth',1)
% hold on;
% plot(time_array,VencoderC-3,'LineWidth',1)
% hold on;


%%
SA=zeros([1,NumberofSteps]);
SB=zeros([1,NumberofSteps]);
SC=zeros([1,NumberofSteps]);


for i=1:NumberofSteps
  if VencoderA(i)>0 && Vref>VcarrierA(i)
     SA(i)=1;
  end
  
   if VencoderB(i)>0 && Vref>VcarrierB(i)
     SB(i)=1;
   end
  
    if VencoderC(i)>0 && Vref>VcarrierC(i)
     SC(i)=1;
  end
end
%%
% plot(time_array,SA,'LineWidth',1)
% hold on;
% plot(time_array,SB-1.5,'LineWidth',1)
% hold on;
% plot(time_array,SC-3,'LineWidth',1)


%%
VAB=SA-SB;
VCA=SC-SA;
%%
% figure();
% plot(time_array,VAB,'LineWidth',1)
% 
% %%
% hold on;
% plot(time_array,VCA-3,'LineWidth',1)
%%

% Fs=1/Ts;
% T=Ts;
% L=NumberofSteps;
% Y = fft(VAB);
% P2 = abs(Y/L);
% P1 = P2(1:L/2+1);
% P1(2:end-1) = 2*P1(2:end-1);
% f = Fs*(0:(L/2))/L;
% figure;
% plot(f,P1) 
% title('Single-Sided Amplitude Spectrum of X(t)')
% xlabel('f (Hz)')
% ylabel('|P1(f)|')
% xlim([55000,60000])

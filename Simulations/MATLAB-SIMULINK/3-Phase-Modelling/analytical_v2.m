figure;
%%
Magx11=[];
Phasex11=[];
Magx22=[];
Phasex22=[];
for m=0:0.1:1
ma=m;
phase_fund_1=0;
phase_carrier_1=0;
[f1, Mag1, Phase1]=SwitchingFunction(ma,50,80e3,phase_fund_1,phase_carrier_1,2,4);
phase_fund_2=-2*pi/3;
phase_carrier_2=2*pi/3;
[f2, Mag2, Phase2]=SwitchingFunction(ma,50,80e3,phase_fund_2,phase_carrier_2,2,4);
Magx1=[];
Magx2=[];
Phasex2=[];
Phasex1=[];

for i=1:length(f1)
Magx1=[Magx1 Mag1(i)];
Phasex1=[Phasex1 Phase1(i)];
Magx2=[Magx2 Mag2(i)];
Phasex2=[Phasex2 Phase2(i)];
end

% Magx11 = cat(1,Magx11,Magx1);
% Phasex11=cat(1,Phasex11,Phasex1);
% Magx22=cat(1,Magx22, Magx2);
% Phasex22=cat(1,Phasex22,Phasex2);

Magx11=[Magx11 ; Magx1 ];
Phasex11=[Phasex11 ; Phasex1];
Magx22=[Magx22 ; Magx2];
Phasex22=[Phasex22 ; Phasex2];


end 

% A=(Magx1.*(exp(1i*Phasex1)-exp(-1i*Phasex1))/2)-(Magx2.*(exp(1i*Phasex2)-exp(-1i*Phasex2))/2);
fx=[0,1,5,6,7,8,9,10,11,12,13,18,19,20,21,22,23,24,25,26];
m=0:0.1:1;
figure();
subplot(2,1,1)
stem3(fx,m,Magx11,'lineStyle','None','LineWidth',1);
hold on;
subplot(2,1,2)
stem3(fx,m,Phasex11*180/pi,'lineStyle','None','LineWidth',1);
hold on;
%%
% f=[f(1) f(3) f(5)]  ;
% Mag=[Mag(1) Mag(3) Mag(5)]  ;
% Phase=[Phase(1) Phase(3) Phase(5)]  ;
% subplot(2,1,1)
stem(f1,Mag1,'lineStyle','-','LineWidth',1);
hold on;

% subplot(2,1,2)
% stem(f,Phase*180/pi,'lineStyle','none','LineWidth',3)
% hold on;

%%
stem(f1,Phase1*180/pi,'lineStyle','-','LineWidth',3)
hold on;

%%
ma=0:0.01:1;
a=2*besselj(0,1*ma*pi/2)/pi;
% figure();
plot(ma,a)
hold on;
%%
ma=0:0.01:1;
% a=2*besselj(0,1*ma*pi/2)/pi;
% figure();
a=2*besselj(0,1*ma*pi/2).*besselj(4,1*ma*pi/2)/pi;
plot(ma,a)
hold on;


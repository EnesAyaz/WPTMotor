figure;
%%
ma=0.6;
phase_fund=-2*pi/3;
%-2*pi/3;
[f, Mag, Phase]=SwitchingFunction(ma,300,80e3,phase_fund,0,4,4);

f=f(3:end);
Mag=Mag(3:end);
Phase=Phase(3:end);
%%
% f=[f(1) f(3) f(5)]  ;
% Mag=[Mag(1) Mag(3) Mag(5)]  ;
% Phase=[Phase(1) Phase(3) Phase(5)]  ;
% subplot(2,1,1)
stem(f,Mag,'lineStyle','-','LineWidth',1);
hold on;

% subplot(2,1,2)
% stem(f,Phase*180/pi,'lineStyle','none','LineWidth',3)
% hold on;

%%
stem(f,Phase*180/pi,'lineStyle','-','LineWidth',3)
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


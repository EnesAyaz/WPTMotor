%%
m=1; % carrier
n=2; % fundamental
ma=0:0.1:1;
a1=2*m*besselj(0,ma*pi/2)/pi;
% figure();
plot(ma,a1)
hold on;
ma=0:0.1:1;
% a=2*besselj(0,1*ma*pi/2)/pi;
% figure();
a=abs(2*m*besselj(0,m*ma*pi/2).*besselj(n,m*ma*pi/2)*sin((m+n)*pi/2)/pi);
a=abs(2.*besselj(n,m*ma*pi/2)/(m*pi));
plot(ma,abs(a))
hold on;
%%

figure();
plot(ma,abs(a1./a))
ylim([0 2])
% xlim([0 1])
m=1; % carrier
n=2; % fundamental
ma=-0.1:0.1:1;
a1=2*m*besselj(0,ma*pi/2)/pi;
% figure();
plot(ma,a1)
hold on;
ma=0:0.1:1;
% a=2*besselj(0,1*ma*pi/2)/pi;
% figure();
% a=abs(2*m*besselj(0,m*ma*pi/2).*besselj(n,m*ma*pi/2)*sin((m+n)*pi/2)/pi);
a=abs(2.*besselj(n,m*ma*pi/2)/(m*pi));
plot(ma,abs(a))
hold on;
set(gca,'xtick',[])
set(gca,'ytick',[])
xline(0)
xline(0.2)
xline(0.4)
xline(0.6)
xline(0.8)
% X = [0.13+0.1 0.13+0.1];
% Y = [0.11   0.11+abs(a1(2))];
% annotation('arrow',X,Y);
% X = [0.13+0.15 0.13+0.15];
% Y = [0.11   0.15+abs(a(2))];
% annotation('arrow',X,Y);
% X = [0.13+0.05 0.13+0.05];
% Y = [0.11   0.15+abs(a(2))];
% annotation('arrow',X,Y);
% 
% 
% X = [0.13+0.3 0.13+0.3];
% Y = [0.11   0.11+abs(a1(2))];
% annotation('arrow',X,Y);
% X = [0.13+0.35 0.13+0.35];
% Y = [0.11   0.15+abs(a(2))];
% annotation('arrow',X,Y);
% X = [0.13+0.25 0.13+0.25];
% Y = [0.11   0.15+abs(a(2))];
% annotation('arrow',X,Y);
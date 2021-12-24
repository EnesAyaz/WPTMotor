%%
Vdc=1;
m=1; % carrier
n=2; % fundamental
ma=0.6;
mag_fsw=2*m*besselj(0,ma*pi/2)/pi;
mag_side=abs(2.*besselj(n,m*ma*pi/2)/(m*pi));
% mag_side=2.*besselj(n,m*ma*pi/2)/(m*pi);
mag_fund=sqrt(3).*ma/2;

theta=-47.5;
mag_fund_carrier=mag_fund*Vdc;
mag_fsw_carrier=  mag_fsw*sqrt(2)*sqrt(1-cosd(theta))*Vdc;
mag_side1_carrier= mag_side*sqrt(2)*sqrt(1-cosd(theta-120)) *Vdc;
mag_side2_carrier= mag_side*sqrt(2)*sqrt(1-cosd(theta+120)) *Vdc;

[ mag_fund_carrier mag_side1_carrier mag_fsw_carrier mag_side2_carrier]


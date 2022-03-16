fr=65.8e3;
k=0.4;
fh=fr*sqrt((1+k)/(1-k^2));
wh=2*pi*fh;
wr=2*pi*fr;
RL=100;

Lp=200e-6;
Cp=1/(wr^2*Lp)
Ls=50e-6;
Cs=1/(wr^2*Ls)
M=40e-6;
M=k*sqrt(Lp*Ls);

Zs=1i*wh*Ls+ 1/(1i*wh*Cs) + RL;

Zref=wh^2*M^2/(Zs);

Zp= 1i*wh*Lp+ 1/(1i*wh*Cp);

Zin= Zref+Zp;

Ip= 30/Zin;

Vout= abs ((1i*wh*M*Ip/Zs)*RL)
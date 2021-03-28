figure();
%%
V=10;
I=0:1:49;
I1=1+I;
Vt=V-I1*2;
Vt(Vt<0)=NaN;

plot(I,Vt)
hold on;
    

% m=0 n=1 MVdc, m=0 and n=0 2VDC


%% m=0 n>1

m=0; % carrier 
n=3; %9,15  % fundamental
M= 0.8; % modulation index

w0=2*pi*50;
% wc=2*pi*80e3;
w=w0*n;

A0n= 3*sqrt(3)*M/(pi*(n^2-1))*sin(n*pi/6)*sin(n*pi/2)


%% m>0; 
M=0.8;
m=2;
n=2;
w0=2*pi*50;
wc=2*pi*80e3;
q= m+n*w0/wc;
%%
if (n==0)
Amn=0;
else 
Amn=(pi/6)*sin((q+n)*pi/2)*(besselj(n,q*3*pi*M/4)+(2*cos(n*pi/6)*besselj(n,q\sqrt(3)*pi*M/4)))+ ...
    (1/n)*sin(q*pi/2)*cos(n*pi/2)*sin(n*pi/6)*(besselj(0,q*3*pi*M/4)-besselj(0,q\sqrt(3)*pi*M/4)); 
end

%%
for k=1:100
   
    Amn=0
    
    
    
    
end
Amn=Amn*8/(m*pi^2);

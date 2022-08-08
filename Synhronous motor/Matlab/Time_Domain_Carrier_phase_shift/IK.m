syms alpha beta A B C theta x y
R1=[cos(beta) -sin(beta) 0;
    sin(beta) cos(beta)  0;
    0          0           1];
Tr1=[1 0 B;
    0 1 0;
    0 0 1];
T1=R1*Tr1;

R2=[cos(alpha) -sin(alpha) 0;
    sin(alpha) cos(alpha)  0;
    0          0             1];
Tr2=[1 0 C;
    0 1 0;
    0 0 1];
T2=R2*Tr2;

T=[1 0 A; 0 1 0; 0 0 1]*T1*T2;

star=[cos(theta) -sin(theta) x;
      sin(theta) cos(theta)  y;
      0          0           1];

eqn= T==star;

% S=solve(eqn,[alpha, beta])
%% RRR
syms alpha beta gamma A B C
syms XE YE D theta
XE_RHS = A*cos(alpha)+B*cos(alpha+beta) + C*cos(alpha+beta+gamma);
YE_RHS = A*sin(alpha)+B*sin(alpha+beta) + C*sin(alpha+beta+gamma);

XE_EQ = D*cos(theta) == XE_RHS;
YE_EQ = D*sin(theta) == YE_RHS;

S = solve([XE_EQ YE_EQ], [alpha beta gamma])
%% RRR x axis
syms alpha beta gamma
syms theta
A=3;
B=2;
C=2;
D=4;
XE_RHS = A*cos(alpha) + B*cos(alpha+beta) + C*cos(alpha+beta+gamma);
YE_RHS = A*sin(alpha) + B*sin(alpha+beta) + C*sin(alpha+beta+gamma);

XE_EQ = D == XE_RHS;
YE_EQ = 0 == YE_RHS;

S = solve([XE_EQ YE_EQ], [alpha beta gamma])
%% RR normal
syms alpha beta gamma A B C
syms XE YE D theta
XE_RHS = A+B*cos(beta) + C*cos(beta+gamma);
YE_RHS = B*sin(beta) + C*sin(beta+gamma);

XE_EQ = XE == XE_RHS;
YE_EQ = YE == YE_RHS;

S = solve([XE_EQ, YE_EQ], [beta gamma])
%% RR D
syms alpha beta gamma A B C
syms XE YE D theta
XE_RHS = A+B*cos(beta) + C*cos(beta+gamma);
YE_RHS = B*sin(beta) + C*sin(beta+gamma);

D_EQ = D == sqrt(XE_RHS^2+YE_RHS^2);

S = solve(D_EQ, [beta gamma])
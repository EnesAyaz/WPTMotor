syms s R L2 C2 M L1 C1

Z1= R+1/(s*C2)+s*L2 ;
Z2= s*M;
Z3= 1/((1/Z1)+(1/Z2));

Z4=1/(s*C1)+s*L1;

Vou=(Z3/(Z4+Z3))*R/Z1;

simplify(Vou)
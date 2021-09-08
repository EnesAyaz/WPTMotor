%% R1=7.14 R2=7.9 R3=8.9 R4=10.18 R5= 14.40]
% data is taken for ma=0:0.2:1;
R=[7.14 7.9 8.9 10.18 14.4];
ma= 0:0.2:1;
IphA_R1=  [0	0.875	1.53  2.3	 3.13	3.95 ];
       
IphA_R2=  [0	0.93	1.59  2.27	 3.02	3.85 ];
        
IphA_R3=  [0	0.91	1.55  2.2	 2.92	3.72 ];
     
IphA_R4= [0 	0.88	1.5   2.13	 2.81	3.55 ];
       
IphA_R5=  [0	0.81	1.53  1.89	 2.45	3.07 ];
 
%% 
figure();
plot(ma,3*IphA_R1.^2*R(1));
hold on;
plot(ma,3*IphA_R2.^2*R(2));
hold on;
plot(ma,3*IphA_R3.^2*R(3));
hold on;
plot(ma,3*IphA_R4.^2*R(4));
hold on;
plot(ma,3*IphA_R5.^2*R(5));
hold on;
legend("R1","R2","R3","R4","R5")

%% 
X= 5e-3*50*2*pi;
scatter(R,R./sqrt(X^2+R.^2)./sqrt(X^2+R.^2))
hold on;

%%

Vout_R1=  [45	44.5	42.4	40.85	41.2	45.1];
       
Vout_R2=  [45	44.5	42.4	40.9	41.1	45.2 ];
        
Vout_R3=  [45	44.5	42.4	40.8	41	    45.2 ];
     
Vout_R4=  [44.9	44.3	42.3	40.9	41.1	45.2];
       
Vout_R5=  [45.1	44.2	42.3	40.7	41	    45.1 ];
 
%%
figure();
plot(ma,Vout_R1);
hold on;
plot(ma,Vout_R2);
hold on;
plot(ma,Vout_R3);
hold on;
plot(ma,Vout_R4);
hold on;
plot(ma,Vout_R5);
hold on;
legend("R1","R2","R3","R4","R5")



  

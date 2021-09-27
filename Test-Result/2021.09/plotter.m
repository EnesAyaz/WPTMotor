%% R1=7.14 R2=7.9 R3=8.9 R4=10.18 R5= 14.40]
% data is taken for ma=0:0.2:1;
R=[7.14 7.9 8.9 10.18 14.4];
ma= 0:0.2:1;
IphA_R1=  [0	1.18	2.02	2.92	3.85	4.84];
       
IphA_R2=  [0	1.13	1.74	2.4	    3.09	3.85 ];
        
IphA_R3=  [0	1	    1.43	    1.91	2.41	2.93];
     
IphA_R4= [ 0	0.9 	1.13	1.42	1.73	2.05 ];
       
IphA_R5=  [0	0.8	    0.88	    0.96	1.07	1.2 ];
 
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

Vout_R1=  [44.5	 44	    42.1	    40.8	41	   44.7];
        
Vout_R2=  [44.6	 44.1	42	        40.7	41	   44.7 ];
        
Vout_R3=  [44.6	 44	    42	        40.6    40.9    44.7 ];
        
Vout_R4=  [44.5	 43.9	42	        40.5	40.8	44.7];
       
Vout_R5=  [44.5  43.9	42	        40.5	40.7	44.9 ];
 
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

%%

m=[ma,ma,ma,ma,ma];
Vout=[Vout_R1,Vout_R2,Vout_R3,Vout_R4,Vout_R5];
IphA =[IphA_R1,IphA_R2,IphA_R3,IphA_R4,IphA_R5];

%%
figure();
[x,y]=meshgrid(IphA,ma);
Vout2=[Vout;Vout;Vout;Vout;Vout;Vout];

scatter(IphA,m,40,Vout,'Filled')
hold on;
colormap('Jet')
colorbar
ylabel('Modulation Index(ma)')
xlabel('Phase Current (A)')
%%


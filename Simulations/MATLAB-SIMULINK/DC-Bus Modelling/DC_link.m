% syms D; 
convolvedTotal=[];
for D=0:0.05:1
fourier_series=[2*D-1 ]; % DC fs 2fs 3fs 4fs

for k=1:5

    Vin=4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
   
    fourier_series=[fourier_series,Vin];
    
end

    current=[fourier_series(1),0];
    convolved=conv(fourier_series,current);
    convolvedTotal=[convolvedTotal ; convolved];
end
%%
% figure();
% stem(fourier_series,'LineWidth',3);
% hold on;
% stem(current,'LineWidth',3);
% hold on;
% stem(convolved,'LineWidth',3);
% legend('Switching','Current','Convolved')
%%
figure();
D=0:0.05:1;
k=0:6;
[x,y] = meshgrid(k,D);
mesh(y,x,abs(convolvedTotal))
% view([0 90])
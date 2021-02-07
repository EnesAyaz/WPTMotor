D=0:0.005:1;
Co=(2*D-1);

k=1;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,Co,'LineWidth',3)
hold on;
plot(D,abs(Ck),'LineWidth',3)
hold on;

k=2;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,abs(Ck),'LineWidth',3)
hold on;

k=3;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,abs(Ck),'LineWidth',3)
hold on;

k=4;
Ck= 4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
abs(Ck)
plot(D,abs(Ck),'LineWidth',3)
hold on;
xlabel('Duty Cycle');
ylabel('Output/Input')
legend('DC','1st','2nd','3rd','4th')
set(gca,'Fontsize',16)

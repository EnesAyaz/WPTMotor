t=0:0.1:4*pi;
d=1;
V=zeros(size(t));
V(t<d*pi)=1;
V(t>=d*pi & t<(2-d)*pi)=-1;
V(t>=(2-d)*pi & t<(2+d)*pi) =1;
V(t>=(2+d)*pi & t<(4-d)*pi) =-1;
V(t>=(4-d)*pi & t<4*pi) =1;
% plot(t,V)
DC=(2*d-1)*ones(size(t));
%%
k=1;
Ck= 4*d.*(sin(k*pi*d)./(k*pi*d)).*exp(-1i*k*pi.*d);
h1=-abs(Ck)*sin(t+angle(Ck));

%%
k=2;
Ck= 4*d.*(sin(k*pi*d)./(k*pi*d)).*exp(-1i*k*pi.*d);
h2=-abs(Ck)*sin(2*(t+angle(Ck)));
%%
k=3;
Ck= 4*d.*(sin(k*pi*d)./(k*pi*d)).*exp(-1i*k*pi.*d);
h3=-abs(Ck)*sin(3*(t+angle(Ck)));
%%
% figure();
k=d/0.25;
subplot(2,2,k)
plot(t,V,'color','k')
hold on;
plot(t,DC,'--r')
hold on;
plot(t,h1,'color','b')
% ylabel({'$V_{out}$'},'FontSize',20,'FontName','Times New Roman',...
%     'Interpreter','latex');
legend({'$V_{FB}$','$V_{DC}$','$V_{H1}$'},'FontSize',8,'FontName','Times New Roman',...
    'Interpreter','latex','Location','best','EdgeColor','none','Color','none')

set(gca,'XTick',...
    [0 3.14159265358979 6.28318530717959 9.42477796076938 12.56],'XTickLabel',...
    {'0','Ts/2','Ts','3Ts/2','2Ts'},'YTickLabel',...
    {'-2V_b_u_s','-V_b_u_s','0','V_b_u_s','2V_b_u_s'});

% plot(t,h2)
hold on;
% plot(t,h3)
xlim([0 4*pi])
ylim([-2 2])


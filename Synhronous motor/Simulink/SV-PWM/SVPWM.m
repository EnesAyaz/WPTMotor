
figure('Position', [0 0 600 300]);


mag=[ 0.6366    0.6317    0.6157    0.5890    0.5527    0.5071    0.4532    0.3925    0.3260    0.2550    0.1814];
mx=0:0.1:1;

plot(mx,mag)

mx=[];

V_sw_phi=[];
for ma=0:0.1:1
    mx=[mx ma];
    V_sw_phi=[V_sw_phi, (2/pi).* besselj(0,ma*pi/2)];
end
hold on; 
plot(mx,V_sw_phi)

legend('SVPWM','SPWM')

ylim([0 1])
set(gca,'FontName','Times New Roman','FontSize',12)
xlabel('$m_a$','Interpreter','Latex', 'FontName','Times New Roman', 'FontSize',20)
ylabel('$\frac{V_{l-n}}{V_{DC}}$', ...
    'Interpreter','Latex', 'FontName','Times New Roman', 'FontSize',20)
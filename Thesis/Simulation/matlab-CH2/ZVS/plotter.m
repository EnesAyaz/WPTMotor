
figure();
yyaxis right
plot(time,IL,'k')
yticks([-14.5 0 14.5])
yticklabels({'-I_{Tx}','0','I_{Tx}'})

yyaxis left
plot(time,Vds,'r')
hold on;
plot(time,Vgs,'-b')

xlim([14.9e-5 16.2e-5])

legend({'$I_{Tx}$','$V_{DS}$','$V_{GS}$'},'interpreter','Latex','FontName','Times New Roman', 'FontSize',12)

yticks([0 15 100])
yticklabels({'0','V_{GS}','V_{DS}'})
xticks([15e-5 15.5e-5 16e-5])
xticklabels({'0','T_s','2T_s'})
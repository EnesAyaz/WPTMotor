
load('Bifurcation.mat')
%%
x=find(isnan(Freq));
xi=x+1;
xf=x-1;


for k=[2,3,4,8,11]

plot(Freq(xi(k):xf(k+1))/150e3,db2mag(Vout(xi(k):xf(k+1)))/3.4)
hold on;
end

xlim([0.667, 1.33])
set(gca,'FontName', 'Times New Roman', 'FontSize',16)
xlabel('Normalized Frequency ($\frac{f}{f_r}$)', 'Interpreter','Latex', 'FontName', 'Times New Roman', 'FontSize',16)

ylim([0 1])
ylabel('Normalized Gain ($\frac{V}{V_{rated}}$)', 'Interpreter','Latex', 'FontName', 'Times New Roman', 'FontSize',16)

%%
load('Bifurcation_input.mat')

x=find(isnan(Freq));
xi=x+1;
xf=x-1;

for k=[2,3,4,8,11]

plot(Freq(xi(k):xf(k+1))/150e3,phase(xi(k):xf(k+1)))
hold on;
end

xlim([0.667, 1.33])
set(gca,'FontName', 'Times New Roman', 'FontSize',16)
xlabel('Normalized Frequency ($\frac{f}{f_r}$)', 'Interpreter','Latex', 'FontName', 'Times New Roman', 'FontSize',16)

% ylim([0 1])
ylabel('Phase ($^o$)', 'Interpreter','Latex', 'FontName', 'Times New Roman', 'FontSize',16)

%%

load('BifurcationCoupling.mat')
x=find(isnan(freq));
xi=x+1;
xf=x-1;

for k=[2,3,4,5]
plot(freq(xi(k):xf(k+1))/150e3,db2mag(Vout(xi(k):xf(k+1)))/2.15)
hold on;
end
plot(freq(xi(k+1):end)/150e3,db2mag(Vout(xi(k+1):end))/2.15)

xlim([0.667, 1.33])
set(gca,'FontName', 'Times New Roman', 'FontSize',16)
xlabel('Normalized Frequency ($\frac{f}{f_r}$)', 'Interpreter','Latex', 'FontName', 'Times New Roman', 'FontSize',16)

ylim([0 1])
ylabel('Normalized Gain ($\frac{V}{V_{rated}}$)', 'Interpreter','Latex', 'FontName', 'Times New Roman', 'FontSize',16)

legend({'k=0.05','k=0.10','k=0.15','k=0.20','k=0.25'}, 'Interpreter','Latex', 'FontName', 'Times New Roman', 'FontSize',12)

%%

% load('BifurcationQuality.mat')
x=find(isnan(freq));
xi=x+1;
xf=x-1;
%%
for k=[2,3,4,5,6,7]
plot(freq(xi(k):xf(k+1))/150e3,db2mag(Vout(xi(k):xf(k+1)))/2.15)
hold on;
end
plot(freq(xi(k+1):end)/150e3,db2mag(Vout(xi(k+1):end))/2.15)

xlim([0.667, 1.33])
set(gca,'FontName', 'Times New Roman', 'FontSize',16)
xlabel('Normalized Frequency ($\frac{f}{f_r}$)', 'Interpreter','Latex', 'FontName', 'Times New Roman', 'FontSize',16)

ylim([0 1])
ylabel('Normalized Gain ($\frac{V}{V_{rated}}$)', 'Interpreter','Latex', 'FontName', 'Times New Roman', 'FontSize',16)

legend({'$Q_{Rx}$=16','$Q_{Rx}$=10.6','$Q_{Rx}$=8','$Q_{Rx}$=6.4','$Q_{Rx}$=5.3','$Q_{Rx}$=4.5',}, 'Interpreter','Latex', 'FontName', 'Times New Roman', 'FontSize',12)

%% for A
fourier_switch=[];
for D=0:0.01:1
fourier_series=[];
for k=1:1:6
    S=2*(sin(k*pi*D)./(k*pi));
    fourier_series=[fourier_series,S]; 
end
    fourier_switch=[fourier_switch;fourier_series];
end

fourier_switch=fourier_switch;

%% for motor current
D=0:0.01:1;
figure1 = figure;
set(gcf,'Position',[10 10 600 300])
for k=1:1:6
hold on;
plot(D,5*fourier_switch(:,k),'LineWidth',2)
end
ylabel({'Capacitor Current'},'FontSize',16,...
    'FontName','Times New Roman',...
    'Interpreter','latex');

xlabel('Duty Cycle','FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex');
set(gca,'FontName','Times New Roman','FontSize',16);
legend1=legend('1st','2nd','3rd','4th','5th');
set(legend1,...
    'Location','northeast',...
    'Interpreter','latex',...
    'FontSize',8,...
    'EdgeColor','none');
grid on;

%%

%% for A
fourier_switch2=[];
for D=0:0.01:1
fourier_series=[];
for k=1:1:6
    S=2*(sin(k*pi*D)./(k*pi));
    fourier_series=[fourier_series,S]; 
end
    fourier_switch2=[fourier_switch2;fourier_series];
end

D=0:0.01:1;

fourier_switch2=4.5*fourier_switch2;
fourier_left=[fourier_switch2/2 ,zeros(101,1)];
fourier_right=[zeros(101,1), fourier_switch2/2];

fourier_switch_IPT=fourier_left+fourier_right;
% fourier_switch_IPT(:,2)=fourier_switch_IPT(:,2)+fourier_switch2(:,1).*D';

fourier_switch_IPT_f=fourier_switch_IPT(:,1:end);

x=8
a=fourier_switch_IPT_f(:,x)-flip(fourier_switch_IPT_f(:,x));

plot(D,a)
hold on;
%% for motor current
D=0:0.01:1;
figure1 = figure;
set(gcf,'Position',[10 10 600 300])
for k=1:1:6
hold on;
plot(D,fourier_switch_IPT_f(:,k),'LineWidth',2)
end
ylabel({'Capacitor Current'},'FontSize',16,...
    'FontName','Times New Roman',...
    'Interpreter','latex');

xlabel('Duty Cycle','FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex');
set(gca,'FontName','Times New Roman','FontSize',16);
legend1=legend('1st','2nd','3rd','4th','5th');
set(legend1,...
    'Location','northeast',...
    'Interpreter','latex',...
    'FontSize',8,...
    'EdgeColor','none');
grid on;

D=0.15:0.01:0.85;
V_in=100*4*sin(D*pi)/pi;

y=50.3339*ones(size(D));

% plot(D,V_in/sqrt(2));
hold on;

Power=(V_in*0.3536).^2/8.3;
% 3889
% 3536
a1=area(D,Power);
a1.FaceAlpha=0.2
a2=area(D,y);
a2.FaceAlpha=0.5
ylabel('Power(Watt)','Interpreter','Latex','FontSize',15)
xlabel('Duty Cycle','Interpreter','Latex','FontSize',15)
ylim([0,400])
xlim([0.15 0.85])
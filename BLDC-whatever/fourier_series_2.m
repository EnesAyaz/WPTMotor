fx_A=[];
MagX_A=[];
PhaseX_A=[];
mx_A=[];
for ma=0:0.05:1
mx_A=[mx_A, ma ];
fundamental_freq=4000;
switching_frequency=40e3;
phase_fund=0;
phase_carrier=0;
phase_fund1=phase_fund*pi/180;
phase_carrier1=phase_carrier*pi/180;
[f, Mag, Phase]=SwitchingFunction(ma,fundamental_freq,switching_frequency,phase_fund1,phase_carrier1,2,5);

k=8;
j=19;
f=[f(1:2),f(k-2),f(k),f(k+2),f(j-4),f(j-2),f(j+2),f(j+4)];
Mag=[Mag(1:2),Mag(k-2),Mag(k),Mag(k+2),Mag(j-3),Mag(j-1),Mag(j+1),Mag(j+3)];
Phase=[Phase(1:2),Phase(k-2),Phase(k),Phase(k+2),Phase(j-3),Phase(j-1),Phase(j+1),Phase(j+3)];

fx_A=[fx_A ; f];
MagX_A=[MagX_A ; Mag ];
PhaseX_A=[PhaseX_A ; Phase];

end

fp_A=0:fundamental_freq:switching_frequency*2+5*fundamental_freq;
Magp_A=zeros([length(mx_A), length(fp_A)]);
Phasep_A=zeros([length(mx_A), length(fp_A)]);
for i=1:length(fp_A)
   
    for k=1:length(f)
       
        if fp_A(i)==f(k)
           Magp_A(:,i) = MagX_A(:,k);
           Phasep_A(:,i)=PhaseX_A(:,k);

        end
    end
    
end

fx_B=[];
MagX_B=[];
PhaseX_B=[];
mx_B=[];
for ma=0:0.05:1
mx_B=[mx_B, ma ];
fundamental_freq=4000;
switching_frequency=40e3;
phase_fund=120;
phase_carrier=30;
phase_fund1=phase_fund*pi/180;
phase_carrier1=phase_carrier*pi/180;
[f, Mag, Phase]=SwitchingFunction(ma,fundamental_freq,switching_frequency,phase_fund1,phase_carrier1,2,5);

k=8;
j=19;
f=[f(1:2),f(k-2),f(k),f(k+2),f(j-4),f(j-2),f(j+2),f(j+4)];
Mag=[Mag(1:2),Mag(k-2),Mag(k),Mag(k+2),Mag(j-3),Mag(j-1),Mag(j+1),Mag(j+3)];
Phase=[Phase(1:2),Phase(k-2),Phase(k),Phase(k+2),Phase(j-3),Phase(j-1),Phase(j+1),Phase(j+3)];

fx_B=[fx_B ; f];
MagX_B=[MagX_B ; Mag ];
PhaseX_B=[PhaseX_B ; Phase];

end

fp_B=0:fundamental_freq:switching_frequency*2+5*fundamental_freq;
Magp_B=zeros([length(mx_B), length(fp_B)]);
Phasep_B=zeros([length(mx_B), length(fp_B)]);
for i=1:length(fp_B)
   
    for k=1:length(f)
       
        if fp_B(i)==f(k)
           Magp_B(:,i) = MagX_B(:,k);
           Phasep_B(:,i)=PhaseX_B(:,k);

        end
    end
    
end
%%
f=[0 2 5 7 9 13 15 17 19 ];
color=['g','m','r','k','b','r','g','m','b'];
figure();
set(gcf,'Position',[100 100 400 300])
for i =1:length(f)
[X,Y] = meshgrid(f(i),mx_A);
if i>=2
stem3(X,Y,MagX_A(:,i)/sqrt(2),'Marker','^','MarkerSize',5,'LineWidth',1,'Color',color(i))
else
   stem3(X,Y,MagX_A(:,i),'Marker','^','MarkerSize',5,'LineWidth',1,'Color',color(i))
end
hold on;
% plot3(X,Y,MagX(:,i),'LineStyle','-','LineWidth',1,'Color',color(i))
end

% grid off;
xticks(f)
xticklabels({'DC','f_o','f_s-2f_o','f_s','f_s+2f_o','2f_s-3f_o','2f_s-f_o','2f_s+f_o','2f_s+3f_o'})

set(gca,'FontSize',8)
yticks(0:0.1:1)
zticks(0:0.2:1)
zlim([0 1])
view([45 45])
% view([0 0])
zlabel('$  |\frac{V_{l-n}}{V_{DC}} |$','interpreter','Latex','FontSize',12,'FontName','Times New Roman');
xlabel({'f'},'interpreter','Latex','FontSize',12,'Rotation',0, ...
    'Position',[9.89818216756021,-0.196474976972375,-0.135329018510841],'FontName','Times New Roman');
ylabel({'ma '},'Rotation',0,'interpreter','Latex','FontSize',10, ...
    'Position',[22.464183307203317,0.489928271915847,-0.094201787406924],'FontName','Times New Roman')
%%
f=[0 2 5 7 9 13 15 17 19 ];
color=['g','m','r','k','b','r','g','m','b'];
figure();
set(gcf,'Position',[100 100 400 300])
for i =1:length(f)
[X,Y] = meshgrid(f(i),mx_B);
if i>=2
A=MagX_A(:,i).^2+MagX_B(:,i).^2-2.*MagX_A(:,i).*MagX_B(:,i).*cos(PhaseX_A(:,i)-PhaseX_B(:,i));
A=sqrt(A)/sqrt(2);
stem3(X,Y,A,'Marker','^','MarkerSize',5,'LineWidth',1,'Color',color(i))
else 
A=MagX_A(:,i).*0;
stem3(X,Y,A,'Marker','^','MarkerSize',5,'LineWidth',1,'Color',color(i))  
end
hold on;
% plot3(X,Y,MagX(:,i),'LineStyle','-','LineWidth',1,'Color',color(i))
end

% grid off;
xticks(f)
xticklabels({'DC','f_o','f_s-2f_o','f_s','f_s+2f_o','2f_s-3f_o','2f_s-f_o','2f_s+f_o','2f_s+3f_o'})

set(gca,'FontSize',8)
yticks(0:0.1:1)
zticks(0:0.2:1)
zlim([0 1])
view([45 45])
% view([0 0])
zlabel('$  |\frac{V_{l-l}}{V_{DC}} |$','interpreter','Latex','FontSize',12,'FontName','Times New Roman');
xlabel({'f'},'interpreter','Latex','FontSize',12,'Rotation',0, ...
    'Position',[9.89818216756021,-0.196474976972375,-0.135329018510841],'FontName','Times New Roman');
ylabel({'ma '},'Rotation',0,'interpreter','Latex','FontSize',10, ...
    'Position',[22.464183307203317,0.489928271915847,-0.094201787406924],'FontName','Times New Roman')

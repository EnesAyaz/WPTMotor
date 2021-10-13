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
phase_carrier=0;
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
set(gcf,'Position',[100 100 650 450])
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

set(gca,'FontSize',12)
yticks(0:0.1:1)
zticks(0:0.2:1)
zlim([0 1])
view([45 45])
% view([0 0])
zlabel('$  |\frac{V_{l-n}}{V_{DC}} |$','interpreter','Latex','FontSize',20);
xlabel({'Frequency'},'interpreter','Latex','FontSize',15,'Rotation',-28, ...
    'Position',[12.703281936437467,-0.15802166654667,-0.207313666899804]);
ylabel({'Modulation Index'},'Rotation',25,'interpreter','Latex','FontSize',15, ...
    'Position',[21.8511,0.2825,-0.2192])
%%
f=[0 2 5 7 9 13 15 17 19 ];
color=['g','m','r','k','b','r','g','m','b'];
figure();
set(gcf,'Position',[100 100 650 450])
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

set(gca,'FontSize',12)
yticks(0:0.1:1)
zticks(0:0.2:1)
zlim([0 1])
view([45 45])
% view([0 0])
zlabel('$  |\frac{V_{l-l}}{V_{DC}} |$','interpreter','Latex','FontSize',20);
xlabel({'Frequency'},'interpreter','Latex','FontSize',15,'Rotation',-28, ...
    'Position',[12.703281936437467,-0.15802166654667,-0.207313666899804]);
ylabel({'Modulation Index'},'Rotation',25,'interpreter','Latex','FontSize',15, ...
    'Position',[21.8511,0.2825,-0.2192])

%% 
% f=[0 2 5 7 9 13 15 17 19 ];
% color=['g','m','r','k','b','r','g','m','b'];
% figure();
% set(gcf,'Position',[100 100 800 200])
% for i =1:length(f)
% [X,Y] = meshgrid(f(i),mx_A);
% if 180*Phase(i)/pi>180
%    Phase(i)=Phase(i)-2*pi;
% end
% 
% if Phase(i)>0
% stem3(X,Y,180*Phase(i)*ones(1,length(X))/pi,'Marker','^','LineWidth',1,'Color',color(i))
% hold on;
% plot3(X,Y,180*Phase(i)*ones(1,length(X))/pi,'LineStyle','-','LineWidth',1,'Color',color(i))
% elseif Phase(i)==0
% stem3(X,Y,180*Phase(i)*ones(1,length(X))/pi,'Marker','diamond','LineWidth',1,'Color',color(i))
% hold on;
% plot3(X,Y,180*Phase(i)*ones(1,length(X))/pi,'LineStyle','-','LineWidth',1,'Color',color(i))  
% else 
% stem3(X,Y,180*Phase(i)*ones(1,length(X))/pi,'Marker','v','LineWidth',1,'Color',color(i))
% hold on;
% plot3(X,Y,180*Phase(i)*ones(1,length(X))/pi,'LineStyle','-','LineWidth',1,'Color',color(i)) 
% end
% 
% end
% 
% % grid off;
% xticks(f)
% xticklabels({'DC','f_o','f_s-2f_o','f_s','f_s+2f_o','2f_s-3f_o','2f_s-f_o','2f_s+f_o','2f_s+3f_o'})
% xlim([0  19])
% for k=0:0.1:1
% line(2*xlim, [k,k], [0,0],'LineStyle','--', 'LineWidth', 0.2, 'Color', 'k');
% hold on;
% end
% set(gca,'FontSize',12)
% yticks(mx_A)
% zticks(-180:60:180)
% zlim([-180 180])
% view([10 30])
% view([0 0])
% zlabel('$  \angle\frac{V_{l-n}}{V_{DC}} $','interpreter','Latex','FontSize',20);
% xlabel({'Frequency'},'interpreter','Latex','FontSize',15,'Rotation',0, ...
%     'Position',[12.907725587724713,-0.190463999593486,-250]);
% ylabel({'Modulation Index'},'Rotation',65,'interpreter','Latex','FontSize',15, ...
%     'Position',[23,-0.1,23])
% 
% 
% %%
% f=[0 2 5 7 9 13 15 17 19 ];
% color=['g','m','r','k','b','r','g','m','b'];
% x=1;
% figure();
% set(gcf,'Position',[100 100 800 400])
% for i =1:length(f)
% if 180*Phase(i)/pi>180
%    Phase(i)=Phase(i)-2*pi;
% end
% 
% if Phase(i)>0
% % stem(f(i),180*Phase(i)/pi,'Marker','^','LineWidth',1,'Color',color(i))
% stem(f(i),180*Phase(i)/pi,'Marker','^','LineWidth',2,'Color',color(x))
% hold on;
% elseif Phase(i)<0
% % stem(f(i),180*Phase(i)/pi,'Marker','v','LineWidth',1,'Color',color(i))
% stem(f(i),180*Phase(i)/pi,'Marker','v','LineWidth',2,'Color',color(x))
% hold on;
% else 
% % stem(f(i),180*Phase(i)/pi,'Marker','diamond','LineWidth',1,'Color',color(i))
% stem(f(i),180*Phase(i)/pi,'Marker','diamond','LineWidth',2,'Color',color(x))
% hold on;
% 
% end 
% end
% 
% grid on;
% xticks(f)
% xticklabels({'DC','f_o','f_s-2f_o','f_s','f_s+2f_o','2f_s-3f_o','2f_s-f_o','2f_s+f_o','2f_s+3f_o'})
% yticks(-180:30:180)
% ylim([-180 180])
% xlabel({'Frequency'},'interpreter','Latex','FontSize',15);
% ylabel({'Phase(Degree)'},'interpreter','Latex','FontSize',15)
% 

% syms D; 
convolvedTotal2=[];
for D=0:0.01:1
fourier_series=[2*D-1]; % DC fs 2fs 3fs 4fs
for k=1:10

    Vin=4*D.*(sin(k*pi*D)./(k*pi*D)).*exp(-1i*k*pi.*D);
   
    fourier_series=[fourier_series,Vin];
    
end

    current=[5,1];
    convolved=conv(fourier_series,current);
    convolvedTotal2=[convolvedTotal2 ; convolved];
end
%%
 convolvedTotal=convolvedTotal2(:,2:k+1) ;
% figure();
% stem(fourier_series,'LineWidth',3);
% hold on;
% stem(current,'LineWidth',3);
% hold on;
% stem(convolved,'LineWidth',3);
% legend('Switching','Current','Convolved')
%%
% figure();
D=0:0.01:1;
x2=1:1:k;
[x,y] = meshgrid(x2,D);
% mesh(y,x,abs(convolvedTotal))


figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create stem3
stem3(x,y,abs(convolvedTotal),'Marker','.','LineWidth',2)

% Create zlabel
zlabel({'Nomalized ','Capacitor Current'},'FontSize',16,...
    'FontName','Times New Roman',...
    'Interpreter','latex');

% Create ylabel
ylabel({'Duty Cycle'},'FontSize',16,'FontName','Times New Roman',...
    'Rotation',-50,...
    'Interpreter','latex');

% Create xlabel
xlabel({'Switching Harmonics'},'FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex','Rotation',3);
xlim( [1 6])
view(axes1,[-15 30]);
grid(axes1,'on');
hold(axes1,'off');

%%
%%
% figure();
D=0:0.01:1;
x2=1:1:k;
[x,y] = meshgrid(x2,D);
% mesh(y,x,abs(convolvedTotal))


figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create stem3
stem3(x,y,abs(convolvedTotal),'Marker','.','LineWidth',2)

% Create zlabel
zlabel({'Nomalized ','Capacitor Current'},'FontSize',16,...
    'FontName','Times New Roman',...
    'Interpreter','latex');

% Create ylabel
ylabel({'Duty Cycle'},'FontSize',16,'FontName','Times New Roman',...
    'Rotation',-60,...
    'Interpreter','latex');

% Create xlabel
xlabel({'Switching Harmonics'},'FontSize',16,'FontName','Times New Roman',...
    'Interpreter','latex','Rotation',2);
xlim( [1 6])
view(axes1,[-10 30]);
grid(axes1,'on');
hold(axes1,'off');

L=5e-5;
R=0.1;

%%
figure1 = figure('OuterPosition',[209.8 285.8 574.4 509.6]);

% Create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.138928571428571 0.111904761904762 0.766071428571428 0.813095238095241]);
hold(axes1,'on');

% Create plot

plot(out.simout.time, out.simout.data,'LineWidth',2,'Color',[0 0 0]);


% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0.0112585 0.0113045]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 1.5]);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTick',zeros(1,0),'YTick',zeros(1,0));
% Create arrow
annotation(figure1,'arrow',[0.1375 0.940357142857143],...
    [0.111904761904762 0.111904761904762],'LineWidth',2);

% Create arrow
annotation(figure1,'arrow',[0.138928571428571 0.138928571428571],...
    [0.113809523809524 0.976666666666667],'LineWidth',2);

% Create line
annotation(figure1,'line',[0.338928571428572 0.337142857142857],...
    [0.662380952380953 0.813333333333334],'LineWidth',2,'LineStyle','--');

% Create line
annotation(figure1,'line',[0.548214285714285 0.548571428571429],...
    [0.665238095238097 0.813333333333334],'LineWidth',2,'LineStyle','--');

% Create line
annotation(figure1,'line',[0.491785714285713 0.492857142857143],...
    [0.628095238095241 0.731428571428572],'LineWidth',2,'LineStyle','--');

% Create textbox
annotation(figure1,'textbox',...
    [0.415642857142857 0.843333333333335 0.100428571428571 0.0419047619047629],...
    'String',{'Ts'},...
    'Interpreter','latex',...
    'FontSize',16,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create doublearrow
annotation(figure1,'doublearrow',[0.338928571428571 0.542857142857143],...
    [0.814761904761907 0.815238095238096]);

% Create doublearrow
annotation(figure1,'doublearrow',[0.341428571428571 0.482857142857143],...
    [0.721904761904762 0.723809523809524]);

% Create textbox
annotation(figure1,'textbox',...
    [0.367785714285714 0.749047619047622 0.100428571428571 0.0419047619047629],...
    'String','DTs',...
    'Interpreter','latex',...
    'FontSize',16,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.057071428571428 0.397619047619055 0.100428571428571 0.0419047619047629],...
    'String','SA',...
    'Interpreter','latex',...
    'FontSize',16,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');

ylim([0 1.5])
xlim([0.0112585, 0.0113045])

%%
figure1 = figure('OuterPosition',[535.4 268.2 574.4 509.6]);

% Create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.138928571428571 0.111904761904762 0.766071428571428 0.813095238095241]);
hold(axes1,'on');

% Create plot
plot(out.simout1.time, out.simout1.data,'LineWidth',2,'Color',[0 0 0]);
% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0.0112585 0.0113045]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 1.05]);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTick',zeros(1,0),'YTick',zeros(1,0));
% Create arrow
annotation(figure1,'arrow',[0.1375 0.940357142857143],...
    [0.111904761904762 0.111904761904762],'LineWidth',2);

% Create arrow
annotation(figure1,'arrow',[0.138928571428571 0.138928571428571],...
    [0.113809523809524 0.976666666666667],'LineWidth',2);

% Create textbox
annotation(figure1,'textbox',...
    [0.0599285714285709 0.551904761904769 0.100428571428571 0.0419047619047629],...
    'String','SB',...
    'Interpreter','latex',...
    'FontSize',16,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');


ylim([0 1.05])
xlim([0.0112585, 0.0113045])

%%

figure1 = figure('OuterPosition',[535.4 268.2 574.4 509.6]);

% Create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.138928571428571 0.111904761904762 0.766071428571428 0.813095238095241]);
hold(axes1,'on');

% Create plot
b=out.simout3.data+5*ones(length(out.simout3.data),1);
plot(out.simout3.time,b,'LineWidth',2,'Color',[0 0 0]);
% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0.0112585 0.0113045]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 1.05]);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTick',zeros(1,0),'YTick',zeros(1,0));
% Create arrow
annotation(figure1,'arrow',[0.1375 0.940357142857143],...
    [0.111904761904762 0.111904761904762],'LineWidth',2);

% Create arrow
annotation(figure1,'arrow',[0.138928571428571 0.138928571428571],...
    [0.113809523809524 0.976666666666667],'LineWidth',2);

% Create textbox
annotation(figure1,'textbox',...
    [0.0599285714285709 0.551904761904769 0.100428571428571 0.0419047619047629],...
    'String','SB',...
    'Interpreter','latex',...
    'FontSize',16,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');


ylim([0 12])
xlim([0.0112585, 0.0113045])
%%

figure1 = figure('OuterPosition',[535.4 268.2 574.4 509.6]);

% Create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.138928571428571 0.111904761904762 0.766071428571428 0.813095238095241]);
hold(axes1,'on');

% Create plot
% b=out.simout3.data+5*ones(length(out.simout3.data),1);
plot(out.simout4.time,out.simout4.data,'LineWidth',2,'Color',[0 0 0]);
% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0.0112585 0.0113045]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 1.05]);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTick',zeros(1,0),'YTick',zeros(1,0));
% Create arrow
annotation(figure1,'arrow',[0.1375 0.940357142857143],...
    [0.111904761904762 0.111904761904762],'LineWidth',2);

% Create arrow
annotation(figure1,'arrow',[0.138928571428571 0.138928571428571],...
    [0.113809523809524 0.976666666666667],'LineWidth',2);

% Create textbox
annotation(figure1,'textbox',...
    [0.0599285714285709 0.551904761904769 0.100428571428571 0.0419047619047629],...
    'String','SB',...
    'Interpreter','latex',...
    'FontSize',16,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');
yline(0,'Parent',axes1,'LineStyle','--','LineWidth',2);

ylim([-0.5 0.5])
xlim([0.0112585, 0.0113045])

%%


figure1 = figure('OuterPosition',[535.4 268.2 574.4 509.6]);

% Create axes
axes1 = axes('Parent',figure1,...
    'Position',[0.138928571428571 0.111904761904762 0.766071428571428 0.813095238095241]);
hold(axes1,'on');

% Create plot
b=out.simout3.data+5*ones(length(out.simout3.data),1)+2*out.simout4.data;
plot(out.simout3.time,b,'LineWidth',2,'Color',[0 0 0]);
% Uncomment the following line to preserve the X-limits of the axes
% xlim(axes1,[0.0112585 0.0113045]);
% Uncomment the following line to preserve the Y-limits of the axes
% ylim(axes1,[0 1.05]);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'XTick',zeros(1,0),'YTick',zeros(1,0));
% Create arrow
annotation(figure1,'arrow',[0.1375 0.940357142857143],...
    [0.111904761904762 0.111904761904762],'LineWidth',2);

% Create arrow
annotation(figure1,'arrow',[0.138928571428571 0.138928571428571],...
    [0.113809523809524 0.976666666666667],'LineWidth',2);

% Create textbox
annotation(figure1,'textbox',...
    [0.0599285714285709 0.551904761904769 0.100428571428571 0.0419047619047629],...
    'String','SB',...
    'Interpreter','latex',...
    'FontSize',16,...
    'FontName','Times New Roman',...
    'FitBoxToText','off',...
    'EdgeColor','none');


ylim([0 12])
xlim([0.0112585, 0.0113045])
%%
% time=linspace(0,5e-5,2000);
% w=time*5.0265e+05;
% len=length(time);
% SA=zeros(1,len);
% SB=zeros(1,len);
% SA_ground=0;
% SB_ground=-1.2;
% for i=1:len
%    if mod(w(i),2*pi)<3*pi/2
%         SA(i)=SA_ground+1;
%         SB(i)=SB_ground;
%         
%    else
%        SA(i)=SA_ground; 
%        SB(i)=SB_ground+1; 
%    end
%         
% end
% 
% %%
% 
% 
% plot(time,SA)
% hold on;
% plot(time,SB)
% hold on;




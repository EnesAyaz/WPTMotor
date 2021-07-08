load("data1.mat");
load("data2.mat");
%%
figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(out.simout.time, out.simout.data,'LineWidth',3,'Color',[0 0 0]);
xlim([0.0003078 0.0003297]);
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Color','none','XTick',zeros(1,0),'YTick',zeros(1,0));

%%
figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(out.simout.time, out.simout1.data,'LineWidth',3,'Color',[0 0 0]);
xlim([0.0003078 0.0003297]);

hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Color','none','XTick',zeros(1,0),'YTick',zeros(1,0));
%%
figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(out.simout.time, out.simout.data-out.simout1.data,'LineWidth',3,'Color',[0 0 0]);
xlim([0.0003078 0.0003297]);

hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Color','none','XTick',zeros(1,0),'YTick',zeros(1,0));

%%
figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(out.simout3.time, (out.simout3.data- 4.9280)*8+7,'LineWidth',3,'Color',[0 0 0]);
xlim([0.0003078 0.0003297]);
ylim([0 10])

hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Color','none','XTick',zeros(1,0),'YTick',zeros(1,0));
%%
figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(out.simout3.time, out.simout4.data*4,'LineWidth',3,'Color',[0 0 0]);
xlim([0.0003080 0.0003297]);

hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Color','none','XTick',zeros(1,0),'YTick',zeros(1,0));

%%


figure1=figure();

axes1 = axes('Parent',figure1);
hold(axes1,'on');

plot(out.simout3.time, (out.simout3.data- 4.9280)*8+7+out.simout4.data*4,'LineWidth',3,'Color',[0 0 0]);
xlim([0.0003080 0.0003297]);
ylim([0 10])
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'Color','none','XTick',zeros(1,0),'YTick',zeros(1,0));



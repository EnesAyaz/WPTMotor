rds=50e-3;
Eon=47.5e-6;
Eof=8e-6;
Im=15;
Iwpt=5;
f=150e3;

Pm_c=Im*Im*rds;
Pm_s=Eon*f+Eof*f;
Pwpt_c= Iwpt*Iwpt*rds;
Pwpt_s= Eof*f;
y=[Pm_c Pm_s Pwpt_c Pwpt_s];
labels = {'Motor conduction loss','Motor switching loss', ...
    'IPT conduction loss','IPT switching loss'};

t = tiledlayout(1,2,'TileSpacing','compact');

% Create pie charts
ax1 = nexttile;
pie(ax1,y)
title('Two converter')

Pm_c=Im*Im*rds;
Pm_s=Eon*f+Eof*f;
Pwpt_c= Iwpt*Iwpt*rds;
Pwpt_s=Eon*f+Eof*f;
y=[Pm_c Pm_s Pwpt_c Pwpt_s];
% B=arrayfun(@num2str,y,'un',0)
ax2 = nexttile;
pie(ax2,y)
title('Single converter')

lgd = legend(labels);
lgd.Layout.Tile = 'east';
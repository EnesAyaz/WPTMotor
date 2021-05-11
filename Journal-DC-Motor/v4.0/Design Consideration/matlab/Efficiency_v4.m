rds=50e-3;
Eon=47.5e-6;
Eof=8e-6;
Im=7;
Iwpt=1.74;
f=80e3;
%%
Pm_c=Im*Im*rds;
Pm_s=Eon*f+Eof*f;
Pwpt_c= Iwpt*Iwpt*rds;
Pwpt_s= Eof*f;
y1=[Pm_c Pm_s  Pwpt_c Pwpt_s];
% 12.1750W
%%
Pm_c=Im*Im*rds;
Pm_s=Eon*f+Eof*f;
Pwpt_c= Iwpt*Iwpt*rds;
Pwpt_s= (Eof+Eon)*f;
y2=[Pm_c Pm_s  Pwpt_c Pwpt_s];
y=[y1; y2];

%%
bar(y,'stacked')


%%
Vdc=48;
m=1; % carrier
n=2; % fundamental
ma=0:0.01:1;
mag_fsw=2*m*besselj(0,ma*pi/2)/pi;
mag_side=abs(2.*besselj(n,m*ma*pi/2)/(m*pi));
mag_fund=sqrt(3).*ma/2;
mag_fsw_carrier=[];
mag_side1_carrier=[];
mag_fund_carrier=[];
mag_side2_carrier=[];
theta_carrier=[];
for theta=0:1:360
    theta_carrier=[theta_carrier,theta];
    mag_fund_carrier=[ mag_fund_carrier ;mag_fund];
    mag_fsw_carrier= [mag_fsw_carrier ; mag_fsw*sqrt(2)*sqrt(1-cosd(theta))];
    mag_side1_carrier= [mag_side1_carrier ; mag_side*sqrt(2)*sqrt(1-cosd(theta-120))] ;
    mag_side2_carrier= [mag_side2_carrier ; mag_side*sqrt(2)*sqrt(1-cosd(theta+120))] ;
end

[X,Y] = meshgrid(ma,theta_carrier);
mag= sqrt(mag_fsw_carrier.^2+mag_side1_carrier.^2+mag_side2_carrier.^2);
%%
figure1=figure();
axes1 = axes('Parent',figure1);
hold(axes1,'on');

[c1,h1]=contourf(X,Y,mag_fsw_carrier,'LevelStep',0.1);
[c1,h1]=contourf(X,Y,mag_fund_carrier,'LevelStep',0.1);
[c1,h1]=contourf(X,Y,mag_side1_carrier/sqrt(2),'LevelStep',0.1);
[c1,h1]=contourf(X,Y,mag_side2_carrier/sqrt(2),'LevelStep',0.1);
[c1,h1]=contourf(X,Y,mag/sqrt(2),'LevelStep',0.1);
clabel(c1,h1);
colormap()
caxis([0 1])
ylabel('Carrier Phase ($^o$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
xlabel('Modulation Index ($ma$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
% title('Voltage for ($f_s$)' ...
%     ,'interpreter','Latex','FontName', ...
%     'Times New Roman','FontSize',15)


box(axes1,'on');
axis(axes1,'tight');
hold(axes1,'off');
% Set the remaining axes properties
set(axes1,'BoxStyle','full','Colormap',...
    [0.55 0.55 0.55;0.60 0.60 0.6;0.65 0.65 0.65; 0.70 0.70 0.70; 0.75 0.75 0.75; 0.80 0.80 0.80 ;
    0.85 0.85 0.85; 0.90 0.90 0.90; 0.95 0.95 0.95 ;1 1 1],...
    'Layer','top','YTick',[0 60 120 180 240 300 359],'YTickLabel',...
    {'0','60','120','180','240','300','360'});
% Create colorbar
colorbar(axes1,'Ticks',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1],...
    'TickLabels',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});

%%

figure1=figure();
axes1 = axes('Parent',figure1);
hold(axes1,'on');

[c1,h1]=contourf(X,Y,mag_side1_carrier/sqrt(2),'LevelStep',0.05);
clabel(c1,h1);
colormap()
caxis([0 1])
ylabel('Carrier Phase ($^o$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
xlabel('Modulation Index (ma)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
title('Voltage for ($f_s$)' ...
    ,'interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)


box(axes1,'on');
axis(axes1,'tight');
hold(axes1,'off');
% Set the remaining axes properties

set(axes1,'BoxStyle','full','Colormap',...
    [0.55 0.55 0.55;0.60 0.60 0.6;0.65 0.65 0.65; 0.70 0.70 0.70; 0.75 0.75 0.75; 0.80 0.80 0.80 ;
    0.85 0.85 0.85; 0.90 0.90 0.90; 0.95 0.95 0.95 ;1 1 1],...
    'Layer','top');
% set(axes1,'BoxStyle','full','Colormap',...
%     [0.3 0.3 0.3;0.301875106823502 0.301875106823502 0.301875106823502;0.303750213647004 0.303750213647004 0.303750213647004;0.305625320470507 0.305625320470507 0.305625320470507;0.307500427294009 0.307500427294009 0.307500427294009;0.309375534117511 0.309375534117511 0.309375534117511;0.311250640941013 0.311250640941013 0.311250640941013;0.313125747764515 0.313125747764515 0.313125747764515;0.315000854588018 0.315000854588018 0.315000854588018;0.31687596141152 0.31687596141152 0.31687596141152;0.318751068235022 0.318751068235022 0.318751068235022;0.320626175058524 0.320626175058524 0.320626175058524;0.322501281882026 0.322501281882026 0.322501281882026;0.324376388705529 0.324376388705529 0.324376388705529;0.326251495529031 0.326251495529031 0.326251495529031;0.328126602352533 0.328126602352533 0.328126602352533;0.330001709176035 0.330001709176035 0.330001709176035;0.331876815999537 0.331876815999537 0.331876815999537;0.33375192282304 0.33375192282304 0.33375192282304;0.335627029646542 0.335627029646542 0.335627029646542;0.337502136470044 0.337502136470044 0.337502136470044;0.339377243293546 0.339377243293546 0.339377243293546;0.341252350117048 0.341252350117048 0.341252350117048;0.343127456940551 0.343127456940551 0.343127456940551;0.345002563764053 0.345002563764053 0.345002563764053;0.346877670587555 0.346877670587555 0.346877670587555;0.348752777411057 0.348752777411057 0.348752777411057;0.350627884234559 0.350627884234559 0.350627884234559;0.352502991058062 0.352502991058062 0.352502991058062;0.354378097881564 0.354378097881564 0.354378097881564;0.356253204705066 0.356253204705066 0.356253204705066;0.358128311528568 0.358128311528568 0.358128311528568;0.360003418352071 0.360003418352071 0.360003418352071;0.361878525175573 0.361878525175573 0.361878525175573;0.363753631999075 0.363753631999075 0.363753631999075;0.365628738822577 0.365628738822577 0.365628738822577;0.367503845646079 0.367503845646079 0.367503845646079;0.369378952469582 0.369378952469582 0.369378952469582;0.371254059293084 0.371254059293084 0.371254059293084;0.373129166116586 0.373129166116586 0.373129166116586;0.375004272940088 0.375004272940088 0.375004272940088;0.37687937976359 0.37687937976359 0.37687937976359;0.378754486587093 0.378754486587093 0.378754486587093;0.380629593410595 0.380629593410595 0.380629593410595;0.382504700234097 0.382504700234097 0.382504700234097;0.384379807057599 0.384379807057599 0.384379807057599;0.386254913881101 0.386254913881101 0.386254913881101;0.388130020704604 0.388130020704604 0.388130020704604;0.390005127528106 0.390005127528106 0.390005127528106;0.391880234351608 0.391880234351608 0.391880234351608;0.39375534117511 0.39375534117511 0.39375534117511;0.395630447998612 0.395630447998612 0.395630447998612;0.397505554822115 0.397505554822115 0.397505554822115;0.399380661645617 0.399380661645617 0.399380661645617;0.401255768469119 0.401255768469119 0.401255768469119;0.403130875292621 0.403130875292621 0.403130875292621;0.405005982116123 0.405005982116123 0.405005982116123;0.406881088939626 0.406881088939626 0.406881088939626;0.408756195763128 0.408756195763128 0.408756195763128;0.411596736282106 0.411596736282106 0.411596736282106;0.414437276801084 0.414437276801084 0.414437276801084;0.417277817320062 0.417277817320062 0.417277817320062;0.42011835783904 0.42011835783904 0.42011835783904;0.422958898358018 0.422958898358018 0.422958898358018;0.425799438876996 0.425799438876996 0.425799438876996;0.428639979395974 0.428639979395974 0.428639979395974;0.431480519914952 0.431480519914952 0.431480519914952;0.43432106043393 0.43432106043393 0.43432106043393;0.437161600952908 0.437161600952908 0.437161600952908;0.440002141471886 0.440002141471886 0.440002141471886;0.442842681990864 0.442842681990864 0.442842681990864;0.445683222509842 0.445683222509842 0.445683222509842;0.44852376302882 0.44852376302882 0.44852376302882;0.451364303547798 0.451364303547798 0.451364303547798;0.454204844066776 0.454204844066776 0.454204844066776;0.457045384585754 0.457045384585754 0.457045384585754;0.459885925104732 0.459885925104732 0.459885925104732;0.46272646562371 0.46272646562371 0.46272646562371;0.465567006142688 0.465567006142688 0.465567006142688;0.468407546661667 0.468407546661667 0.468407546661667;0.471248087180645 0.471248087180645 0.471248087180645;0.474088627699623 0.474088627699623 0.474088627699623;0.476929168218601 0.476929168218601 0.476929168218601;0.479769708737579 0.479769708737579 0.479769708737579;0.482610249256557 0.482610249256557 0.482610249256557;0.485450789775535 0.485450789775535 0.485450789775535;0.488291330294513 0.488291330294513 0.488291330294513;0.491131870813491 0.491131870813491 0.491131870813491;0.493972411332469 0.493972411332469 0.493972411332469;0.496812951851447 0.496812951851447 0.496812951851447;0.499653492370425 0.499653492370425 0.499653492370425;0.502494032889403 0.502494032889403 0.502494032889403;0.505334573408381 0.505334573408381 0.505334573408381;0.508175113927359 0.508175113927359 0.508175113927359;0.511015654446337 0.511015654446337 0.511015654446337;0.513856194965315 0.513856194965315 0.513856194965315;0.516696735484293 0.516696735484293 0.516696735484293;0.519537276003271 0.519537276003271 0.519537276003271;0.522377816522249 0.522377816522249 0.522377816522249;0.525218357041227 0.525218357041227 0.525218357041227;0.528058897560205 0.528058897560205 0.528058897560205;0.530899438079183 0.530899438079183 0.530899438079183;0.533739978598161 0.533739978598161 0.533739978598161;0.536580519117139 0.536580519117139 0.536580519117139;0.539421059636117 0.539421059636117 0.539421059636117;0.542261600155095 0.542261600155095 0.542261600155095;0.545102140674073 0.545102140674073 0.545102140674073;0.547942681193051 0.547942681193051 0.547942681193051;0.55078322171203 0.55078322171203 0.55078322171203;0.553623762231008 0.553623762231008 0.553623762231008;0.556464302749986 0.556464302749986 0.556464302749986;0.559304843268964 0.559304843268964 0.559304843268964;0.562145383787942 0.562145383787942 0.562145383787942;0.565207304181033 0.565207304181033 0.565207304181033;0.568269224574124 0.568269224574124 0.568269224574124;0.571331144967216 0.571331144967216 0.571331144967216;0.574393065360307 0.574393065360307 0.574393065360307;0.577454985753398 0.577454985753398 0.577454985753398;0.58051690614649 0.58051690614649 0.58051690614649;0.583578826539581 0.583578826539581 0.583578826539581;0.586640746932672 0.586640746932672 0.586640746932672;0.589702667325763 0.589702667325763 0.589702667325763;0.592764587718855 0.592764587718855 0.592764587718855;0.595826508111946 0.595826508111946 0.595826508111946;0.598888428505038 0.598888428505038 0.598888428505038;0.601950348898129 0.601950348898129 0.601950348898129;0.60501226929122 0.60501226929122 0.60501226929122;0.608074189684311 0.608074189684311 0.608074189684311;0.611136110077403 0.611136110077403 0.611136110077403;0.614198030470494 0.614198030470494 0.614198030470494;0.617259950863585 0.617259950863585 0.617259950863585;0.620321871256677 0.620321871256677 0.620321871256677;0.623383791649768 0.623383791649768 0.623383791649768;0.626445712042859 0.626445712042859 0.626445712042859;0.629507632435951 0.629507632435951 0.629507632435951;0.632569552829042 0.632569552829042 0.632569552829042;0.635631473222133 0.635631473222133 0.635631473222133;0.638693393615225 0.638693393615225 0.638693393615225;0.641755314008316 0.641755314008316 0.641755314008316;0.644817234401407 0.644817234401407 0.644817234401407;0.647879154794499 0.647879154794499 0.647879154794499;0.65094107518759 0.65094107518759 0.65094107518759;0.654002995580681 0.654002995580681 0.654002995580681;0.657064915973773 0.657064915973773 0.657064915973773;0.660126836366864 0.660126836366864 0.660126836366864;0.663188756759955 0.663188756759955 0.663188756759955;0.666250677153047 0.666250677153047 0.666250677153047;0.669312597546138 0.669312597546138 0.669312597546138;0.672374517939229 0.672374517939229 0.672374517939229;0.67543643833232 0.67543643833232 0.67543643833232;0.678498358725412 0.678498358725412 0.678498358725412;0.681560279118503 0.681560279118503 0.681560279118503;0.684622199511594 0.684622199511594 0.684622199511594;0.687684119904686 0.687684119904686 0.687684119904686;0.690746040297777 0.690746040297777 0.690746040297777;0.693807960690868 0.693807960690868 0.693807960690868;0.69686988108396 0.69686988108396 0.69686988108396;0.699931801477051 0.699931801477051 0.699931801477051;0.702993721870142 0.702993721870142 0.702993721870142;0.706055642263234 0.706055642263234 0.706055642263234;0.709117562656325 0.709117562656325 0.709117562656325;0.712179483049416 0.712179483049416 0.712179483049416;0.715241403442508 0.715241403442508 0.715241403442508;0.718303323835599 0.718303323835599 0.718303323835599;0.72136524422869 0.72136524422869 0.72136524422869;0.724427164621782 0.724427164621782 0.724427164621782;0.727489085014873 0.727489085014873 0.727489085014873;0.730551005407964 0.730551005407964 0.730551005407964;0.733612925801056 0.733612925801056 0.733612925801056;0.736674846194147 0.736674846194147 0.736674846194147;0.739736766587238 0.739736766587238 0.739736766587238;0.742798686980329 0.742798686980329 0.742798686980329;0.745860607373421 0.745860607373421 0.745860607373421;0.748922527766512 0.748922527766512 0.748922527766512;0.751984448159603 0.751984448159603 0.751984448159603;0.755046368552695 0.755046368552695 0.755046368552695;0.758108288945786 0.758108288945786 0.758108288945786;0.761170209338877 0.761170209338877 0.761170209338877;0.764232129731969 0.764232129731969 0.764232129731969;0.76729405012506 0.76729405012506 0.76729405012506;0.770355970518151 0.770355970518151 0.770355970518151;0.773417890911243 0.773417890911243 0.773417890911243;0.776479811304334 0.776479811304334 0.776479811304334;0.779541731697425 0.779541731697425 0.779541731697425;0.782603652090517 0.782603652090517 0.782603652090517;0.785665572483608 0.785665572483608 0.785665572483608;0.788727492876699 0.788727492876699 0.788727492876699;0.79178941326979 0.79178941326979 0.79178941326979;0.794851333662882 0.794851333662882 0.794851333662882;0.797913254055973 0.797913254055973 0.797913254055973;0.800975174449065 0.800975174449065 0.800975174449065;0.804037094842156 0.804037094842156 0.804037094842156;0.807099015235247 0.807099015235247 0.807099015235247;0.810160935628338 0.810160935628338 0.810160935628338;0.81322285602143 0.81322285602143 0.81322285602143;0.816284776414521 0.816284776414521 0.816284776414521;0.819346696807612 0.819346696807612 0.819346696807612;0.822408617200704 0.822408617200704 0.822408617200704;0.825470537593795 0.825470537593795 0.825470537593795;0.828532457986886 0.828532457986886 0.828532457986886;0.831594378379978 0.831594378379978 0.831594378379978;0.834656298773069 0.834656298773069 0.834656298773069;0.83771821916616 0.83771821916616 0.83771821916616;0.840780139559252 0.840780139559252 0.840780139559252;0.843842059952343 0.843842059952343 0.843842059952343;0.846903980345434 0.846903980345434 0.846903980345434;0.849965900738526 0.849965900738526 0.849965900738526;0.853027821131617 0.853027821131617 0.853027821131617;0.856089741524708 0.856089741524708 0.856089741524708;0.859151661917799 0.859151661917799 0.859151661917799;0.862213582310891 0.862213582310891 0.862213582310891;0.865275502703982 0.865275502703982 0.865275502703982;0.868337423097073 0.868337423097073 0.868337423097073;0.871399343490165 0.871399343490165 0.871399343490165;0.874461263883256 0.874461263883256 0.874461263883256;0.877523184276347 0.877523184276347 0.877523184276347;0.880585104669439 0.880585104669439 0.880585104669439;0.88364702506253 0.88364702506253 0.88364702506253;0.886708945455621 0.886708945455621 0.886708945455621;0.889770865848713 0.889770865848713 0.889770865848713;0.892832786241804 0.892832786241804 0.892832786241804;0.895894706634895 0.895894706634895 0.895894706634895;0.898956627027987 0.898956627027987 0.898956627027987;0.902018547421078 0.902018547421078 0.902018547421078;0.905080467814169 0.905080467814169 0.905080467814169;0.908142388207261 0.908142388207261 0.908142388207261;0.911204308600352 0.911204308600352 0.911204308600352;0.914266228993443 0.914266228993443 0.914266228993443;0.917328149386535 0.917328149386535 0.917328149386535;0.920390069779626 0.920390069779626 0.920390069779626;0.923451990172717 0.923451990172717 0.923451990172717;0.926513910565808 0.926513910565808 0.926513910565808;0.9295758309589 0.9295758309589 0.9295758309589;0.932637751351991 0.932637751351991 0.932637751351991;0.935699671745082 0.935699671745082 0.935699671745082;0.938761592138174 0.938761592138174 0.938761592138174;0.941823512531265 0.941823512531265 0.941823512531265;0.944885432924356 0.944885432924356 0.944885432924356;0.947947353317448 0.947947353317448 0.947947353317448;0.951009273710539 0.951009273710539 0.951009273710539;0.95407119410363 0.95407119410363 0.95407119410363;0.957133114496722 0.957133114496722 0.957133114496722;0.960195034889813 0.960195034889813 0.960195034889813;0.963256955282904 0.963256955282904 0.963256955282904;0.966318875675996 0.966318875675996 0.966318875675996;0.969380796069087 0.969380796069087 0.969380796069087;0.972442716462178 0.972442716462178 0.972442716462178;0.975504636855269 0.975504636855269 0.975504636855269;0.978566557248361 0.978566557248361 0.978566557248361;0.981628477641452 0.981628477641452 0.981628477641452;0.984690398034543 0.984690398034543 0.984690398034543;0.987752318427635 0.987752318427635 0.987752318427635;0.990814238820726 0.990814238820726 0.990814238820726;0.993876159213817 0.993876159213817 0.993876159213817;0.996938079606909 0.996938079606909 0.996938079606909;1 1 1],...
%     'Layer','top');
% Create colorbar
colorbar(axes1,'Ticks',[0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1],...
    'TickLabels',{'0','0.1','0.2','0.3','0.4','0.5','0.6','0.7','0.8','0.9','1'});

%%
figure();
contourf(X,Y,Vdc*mag_side1_carrier/sqrt(2))
colormap(jet)
h=colorbar();
set(h,'Ticks',[0:10:300])
ylabel('Carrier Phase ($^o$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
xlabel('Modulation Index (ma)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
title('Voltage for ($f_s-2f_o$)' ...
    ,'interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)

%% 
figure();
contourf(X,Y,Vdc*mag_side2_carrier/sqrt(2))
colormap(jet)
h=colorbar();
set(h,'Ticks',[0:10:300])
ylabel('Carrier Phase ($^o$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
xlabel('Modulation Index (ma)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
title('Voltage for ($f_s-2f_o$)' ...
    ,'interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
%%
figure();
contourf(X,Y,mag/sqrt(2),'LevelStep',0.05)
colormap(jet)
h=colorbar();
% set(h,'Ticks',[0:5:100])
ylabel('Carrier Phase ($^o$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
xlabel('Modulation Index (ma)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
title({'A Equivalent Single Frequency  Voltage for','($f_s$) and ($f_s\pm2f_o$)'} ...
    ,'interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
%%
for N=35:1:45
 plot(ma,mag(N,:)*Vdc/sqrt(2))
 hold on
 
end
N=35:1:45;
str = string(N);
legend(str)
xlabel('modulation index( $m_a$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
ylabel('Voltage( $V_{rms}$)','interpreter','Latex','FontName', ...
    'Times New Roman','FontSize',15)
title('Voltage for various carrier phases')
%%
% plot(ma,a1)
% hold on;

% a=2*besselj(0,1*ma*pi/2)/pi;
% figure();

a=abs(2.*besselj(n,m*ma*pi/2)/(m*pi));
plot(ma,abs(a))
hold on;

%%
plot(ma,100*mag_fsw_carrier(41,:)/sqrt(2));
hold on; 
plot(ma,100*mag_side1_carrier(41,:)/sqrt(2));
hold on;
plot(ma,100*mag_side2_carrier(41,:)/sqrt(2));
hold on;
plot(ma,100*ma/2*sqrt(3));

legend('$f_s$','$f_s-2fo$','$f_s+2f_o$','$f_o$','interpreter','Latex','location','best')
ylabel('Voltage(V)','interpreter','Latex','FontSize',15)
xlabel('modulation index (ma)','interpreter','Latex','FontSize',15)



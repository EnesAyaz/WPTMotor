
mx=[];
V_lower=[];
V_sw=[];
V_higher=[];
for ma=0:0.05:1
    mx=[mx ma];
    V_lower_phi=[];
    V_sw_phi=[];
    V_higher_phi=[];
    Phix=[];
    for Phi=0:2.5:180
    V_lower_phi=[V_lower_phi (2/pi).* besselj(2,ma*pi/2).*sqrt(1-cosd(Phi+120))];
    V_sw_phi=[V_sw_phi, (2/pi).* besselj(0,ma*pi/2).*sqrt(1-cosd(Phi))];
    V_higher_phi=[V_higher_phi (2/pi).* besselj(2,ma*pi/2).*sqrt(1-cosd(Phi-120)) ];
    Phix=[Phix Phi];
    end
    V_lower=[V_lower ; V_lower_phi];
    V_sw=[V_sw ; V_sw_phi ];
    V_higher=[ V_higher ;V_higher_phi];
end
clear V_lower_phi V_sw_phi V_higher_phi ma Phi
%%
[X,Y] = meshgrid(Phix,mx);

figure();
contourf(X,Y,V_lower)


figure();
contourf(X,Y,V_higher)

figure();
contourf(X,Y,V_sw)

%%

figure();
contourf(X,Y,sqrt(V_sw.^2+V_higher.^2+V_lower.^2))










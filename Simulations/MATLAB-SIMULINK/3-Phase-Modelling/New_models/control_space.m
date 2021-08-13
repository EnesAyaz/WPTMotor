%%
m=1; % carrier
n=2; % fundamental
ma=0:0.01:1;
mag_fsw=2*m*besselj(0,ma*pi/2)/pi;
mag_side=abs(2.*besselj(n,m*ma*pi/2)/(m*pi));
mag_fsw_carrier=[];
mag_side1_carrier=[];
mag_side2_carrier=[];
theta_carrier=[];
for theta=0:1:180
    theta_carrier=[theta_carrier,theta];
    mag_fsw_carrier= [mag_fsw_carrier ; mag_fsw*sqrt(2)*sqrt(1-cosd(theta))];
    mag_side1_carrier= [mag_side1_carrier ; mag_side*sqrt(2)*sqrt(1-cosd(theta-120))] ;
    mag_side2_carrier= [mag_side2_carrier ; mag_side*sqrt(2)*sqrt(1-cosd(theta+120))] ;

end

%%
[X,Y] = meshgrid(ma,theta_carrier);

mag= sqrt(mag_fsw_carrier.^2+mag_side1_carrier.^2+mag_side2_carrier.^2);
figure();
contourf(X,Y,250*mag_fsw_carrier)
colormap(jet)
colorbar()

figure();
contourf(X,Y,250*mag_side1_carrier)
colormap(jet)
colorbar()

figure();
contourf(X,Y,250*mag_side2_carrier)
colormap(jet)
colorbar()
%%
figure();
contourf(X,Y,250*mag/sqrt(2),'LevelStep',10)
colormap(jet)
h=colorbar();
set(h,'Ticks',[0:10:300])

%%
for N=35:1:45
 plot(mag(N,:)*250/sqrt(2))
 hold on
 
end
%%
plot(ma,a1)
hold on;

% a=2*besselj(0,1*ma*pi/2)/pi;
% figure();

a=abs(2.*besselj(n,m*ma*pi/2)/(m*pi));
plot(ma,abs(a))
hold on;
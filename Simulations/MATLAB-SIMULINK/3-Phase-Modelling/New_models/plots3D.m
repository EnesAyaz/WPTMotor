%%
m=1; % carrier
n=2; % fundamental
ma=0:0.1:1;
mag_fsw=2*m*besselj(0,ma*pi/2)/pi;
mag_side=abs(2.*besselj(n,m*ma*pi/2)/(m*pi));
mag_fsw_carrier=[];
mag_side1_carrier=[];
mag_side2_carrier=[];
theta_carrier=[];
for theta=0:5:180
    theta_carrier=[theta_carrier,theta];
    mag_fsw_carrier= [mag_fsw_carrier ; mag_fsw*sqrt(2)*sqrt(1-cosd(theta))];
    mag_side1_carrier= [mag_side1_carrier ; mag_side*sqrt(2)*sqrt(1-cosd(theta-120))] ;
    mag_side2_carrier= [mag_side2_carrier ; mag_side*sqrt(2)*sqrt(1-cosd(theta+120))] ;
end

[X,Y] = meshgrid(ma,theta_carrier);
mag= sqrt(mag_fsw_carrier.^2+mag_side1_carrier.^2+mag_side2_carrier.^2);
%%
K=[];
avg=[];
mx=[];
mn=[];
for N=1:length(mag(:,1))

K= [ K 100*(max(mag(N,:))-min(mag(N,:)))/mean(mag(N,:)) ];

avg=[ avg mean(mag(N,:)) ];
mx=[ mx max(mag(N,:)) ];
mn=[ mn min(mag(N,:)) ];

end

yneg=avg-mn;
ypos=mx-avg;

errorbar(theta_carrier,avg/sqrt(2),yneg/sqrt(2),ypos/sqrt(2))
hold on;
plot(theta_carrier,mx/sqrt(2))
plot(theta_carrier,mn/sqrt(2))

%%
x2 = [theta_carrier, fliplr(theta_carrier)];
inBetween = [mx/sqrt(2), fliplr(mn/sqrt(2))];
fill(x2, inBetween, 'g');

% plot(theta_carrier,K)


% plot(mag(N,:))
% hold on;


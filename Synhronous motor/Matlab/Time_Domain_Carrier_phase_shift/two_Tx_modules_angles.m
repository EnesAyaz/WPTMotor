% figure1=figure(1);
% axes1 = axes('Parent',figure1);
% hold(axes1,'on');
% figure2=figure(2);
% hold on;
% axes2 = axes('Parent',figure2);
% hold(axes2,'on');
mx="0";
m=0.95;

theta_f1=0:0.001:2*pi;
dead_time=0.0;
% m=0;
n=0;
D1=(1+m*sin(theta_f1)+(n/6)*sawtooth(3*theta_f1+pi/2,1/2))/2;
D1(D1<dead_time)=dead_time;
D1(D1>(1-dead_time))=1-dead_time;
% S1=(2/pi)*sin(pi*D1)*cos(theta_c);
S1=(2/pi)*sin(pi*(D1));
theta_f2=theta_f1-2*pi/3;
D2=(1+m*sin(theta_f2)+(n/6)*sawtooth(3*theta_f2+pi/2,1/2))/2;
D2(D2<dead_time)=dead_time;
D2(D2>(1-dead_time))=1-dead_time;
D2=(1+m*sin(theta_f2)+(n/6)*sawtooth(3*theta_f2+pi/2,1/2))/2;
S2=(2/pi)*sin(pi*(D2));

theta_f3=theta_f1+2*pi/3;
D3=(1+m*sin(theta_f3)+(n/6)*sawtooth(3*theta_f3+pi/2,1/2))/2;
D3(D3<dead_time)=dead_time;
D3(D3>(1-dead_time))=1-dead_time;
D3=(1+m*sin(theta_f3)+(n/6)*sawtooth(3*theta_f3+pi/2,1/2))/2;
S3=(2/pi)*sin(pi*(D3));

alpha_x=[];
beta_x=[];
gamma_x=[];
S_updated=[];
theta_x=[];
figure();
plot(theta_f1,S1)
hold on;
plot(theta_f1,2*S2)
plot(theta_f1,S3)
plot(theta_f1,S2)
%%
figure();
for i=1:length(S1)
A=S1(i);
B=2*S2(i);
C=S3(i);
D=0.95;

if B-C ~= 0
    if D >= A-abs(B-C) && D <= A+abs(B-C)
     theta =acos((A^2-(B-C)^2+D^2)/(2*A*D));
    else
        theta=0;
    end
% elseif B<C
% 
%     if D > A+(B-C) && D < A-(B-C)
%         theta =acos((A^2+(C-B)^2-D^2)/(2*A*D))
%     else
%         theta=0;
%     end
%     

else
    
    theta=0;

end



XE=D*cos(theta);
YE=D*sin(theta);

% alpha=pi;
% beta= 2*atan2((A - B - C + D)*(-((A + B + C + D)*(A + B - C + D))/((A - B - C + D)^3*(A - B + C + D)))^(1/2));
% gamma=-2*atan2(((A - B - C + D)^2*(-((A + B + C + D)*(A + B - C + D))/((A - B - C + D)^3*(A - B + C + D)))^(1/2))/(A + B - C + D));

alpha=0;
beta=2*atan((((8*B^2*C*YE)/((A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2)*(A^2 - 2*A*B - 2*A*XE + B^2 + 2*B*XE - C^2 + XE^2 + YE^2)) + (4*B*C*((A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2)*(- A^2 + 2*A*XE + B^2 + 2*B*C + C^2 - XE^2 - YE^2))^(1/2))/((A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2)*(A^2 - 2*A*B - 2*A*XE + B^2 + 2*B*XE - C^2 + XE^2 + YE^2)))*(A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2))/(4*B*C));
gamma= -2*atan(((A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2)*(- A^2 + 2*A*XE + B^2 + 2*B*C + C^2 - XE^2 - YE^2))^(1/2)/(A^2 - 2*A*XE - B^2 + 2*B*C - C^2 + XE^2 + YE^2));

XE_1 = real(A*cos(alpha));
YE_1 = real(A*sin(alpha));

XE_2 = real(A*cos(alpha)+B*cos(alpha+beta));
YE_2 = real(A*sin(alpha)+B*sin(alpha+beta));

XE_3 = real(A*cos(alpha) + B*cos(alpha+beta) + C*cos(alpha+beta+gamma));
YE_3 = real(A*sin(alpha) + B*sin(alpha+beta) + C*sin(alpha+beta+gamma));

% figure;
hold on;
plot([0 XE_1], [0 YE_1],'r');
plot([XE_1 XE_2], [YE_1 YE_2],'g');
plot([XE_2 XE_3], [YE_2 YE_3],'b');
S_updated= [S_updated sqrt(XE_3^2+YE_3^2)];

alpha_x=[alpha_x alpha];
beta_x=[beta_x alpha+beta];
gamma_x=[gamma_x alpha+beta+gamma];
theta_x=[theta_x theta];
end

figure();
plot(theta_f1,S_updated,'k')
hold on;

figure();
% plot(theta_f1,alpha_x*180/pi,'-g')
hold on;
plot(theta_f1,beta_x*180/pi,'-r')
plot(theta_f1,gamma_x*180/pi,'-b')
plot(theta_f1,theta_x*180/pi,'-m')
legend( {'beta','gama','theta'})


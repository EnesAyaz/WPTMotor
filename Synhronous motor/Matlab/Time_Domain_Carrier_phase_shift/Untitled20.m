A=4;
B=4;
C=2;
D=6.5;
for D=0:0.1:9 
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
end
sqrt(XE_3^2+YE_3^2);
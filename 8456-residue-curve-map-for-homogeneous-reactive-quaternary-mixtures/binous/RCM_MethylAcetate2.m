% Residue Curve Map for Reactive Systems / Methyl Acetate Chemistry
% Author's Data: Housam BINOUS
% Department of Chemical Engineering
% National Institute of Applied Sciences and Technology
% Tunis, TUNISIA
% Email: binoushousam@yahoo.com 


function xdot=RCM_MethylAcetate2(t,x,flag)

if isempty(flag),

R=1.987;

P=1.013*1e+5;

T=x(6);

y1=x(5);


a(1,1)=0;
a(1,2)=2535.2019;
a(1,3)=1123.1444;
a(1,4)=237.5248;

a(2,1)=-547.5248;
a(2,2)=0;
a(2,3)=813.1843;
a(2,4)=107.3832;

a(3,1)=-696.5031;
a(3,2)=-31.1932;
a(3,3)=0;
a(3,4)=645.7225;

a(4,1)=658.0266;
a(4,2)=469.5509;
a(4,3)=1918.232;
a(4,4)=0;

V(1)=57.54;
V(2)=44.44;
V(3)=79.84;
V(4)=18.07;

A(1,1)=1;
A(2,1)=V(1)/V(2)*exp(-a(2,1)/(R*T));
A(3,1)=V(1)/V(3)*exp(-a(3,1)/(R*T));
A(4,1)=V(1)/V(4)*exp(-a(4,1)/(R*T));

A(2,2)=1;
A(1,2)=V(2)/V(1)*exp(-a(1,2)/(R*T));
A(3,2)=V(2)/V(3)*exp(-a(3,2)/(R*T));
A(4,2)=V(2)/V(4)*exp(-a(4,2)/(R*T));

A(3,3)=1;
A(2,3)=V(3)/V(2)*exp(-a(2,3)/(R*T));
A(1,3)=V(3)/V(1)*exp(-a(1,3)/(R*T));
A(4,3)=V(3)/V(4)*exp(-a(4,3)/(R*T));

A(4,4)=1;
A(2,4)=V(4)/V(2)*exp(-a(2,4)/(R*T));
A(3,4)=V(4)/V(3)*exp(-a(3,4)/(R*T));
A(1,4)=V(4)/V(1)*exp(-a(1,4)/(R*T));


G(1)=exp(1-x(1)*A(1,1)/(x(1)*A(1,1)+x(2)*A(1,2)+x(3)*A(1,3)+x(4)*A(1,4))...
    -x(2)*A(2,1)/(x(1)*A(2,1)+x(2)*A(2,2)+x(3)*A(2,3)+x(4)*A(2,4))...
    -x(3)*A(3,1)/(x(1)*A(3,1)+x(2)*A(3,2)+x(3)*A(3,3)+x(4)*A(3,4))...
    -x(4)*A(4,1)/(x(1)*A(4,1)+x(2)*A(4,2)+x(3)*A(4,3)+x(4)*A(4,4)))...
    /(x(1)*A(1,1)+x(2)*A(1,2)+x(3)*A(1,3)+x(4)*A(1,4));

G(2)=exp(1-x(1)*A(1,2)/(x(1)*A(1,1)+x(2)*A(1,2)+x(3)*A(1,3)+x(4)*A(1,4))...
    -x(2)*A(2,2)/(x(1)*A(2,1)+x(2)*A(2,2)+x(3)*A(2,3)+x(4)*A(2,4))...
    -x(3)*A(3,2)/(x(1)*A(3,1)+x(2)*A(3,2)+x(3)*A(3,3)+x(4)*A(3,4))...
    -x(4)*A(4,2)/(x(1)*A(4,1)+x(2)*A(4,2)+x(3)*A(4,3)+x(4)*A(4,4)))...
    /(x(1)*A(2,1)+x(2)*A(2,2)+x(3)*A(2,3)+x(4)*A(2,4));

G(3)=exp(1-x(1)*A(1,3)/(x(1)*A(1,1)+x(2)*A(1,2)+x(3)*A(1,3)+x(4)*A(1,4))...
    -x(2)*A(2,3)/(x(1)*A(2,1)+x(2)*A(2,2)+x(3)*A(2,3)+x(4)*A(2,4))...
    -x(3)*A(3,3)/(x(1)*A(3,1)+x(2)*A(3,2)+x(3)*A(3,3)+x(4)*A(3,4))...
    -x(4)*A(4,3)/(x(1)*A(4,1)+x(2)*A(4,2)+x(3)*A(4,3)+x(4)*A(4,4)))...
    /(x(1)*A(3,1)+x(2)*A(3,2)+x(3)*A(3,3)+x(4)*A(3,4));

G(4)=exp(1-x(1)*A(1,4)/(x(1)*A(1,1)+x(2)*A(1,2)+x(3)*A(1,3)+x(4)*A(1,4))...
    -x(2)*A(2,4)/(x(1)*A(2,1)+x(2)*A(2,2)+x(3)*A(2,3)+x(4)*A(2,4))...
    -x(3)*A(3,4)/(x(1)*A(3,1)+x(2)*A(3,2)+x(3)*A(3,3)+x(4)*A(3,4))...
    -x(4)*A(4,4)/(x(1)*A(4,1)+x(2)*A(4,2)+x(3)*A(4,3)+x(4)*A(4,4)))...
    /(x(1)*A(4,1)+x(2)*A(4,2)+x(3)*A(4,3)+x(4)*A(4,4));


A(1)=22.1001;A(2)=23.49989;A(3)=21.1520;A(4)=23.2256;
B(1)=-3654.62;B(2)=-3643.31362;B(3)=-2662.78;B(4)=-3835.18;
C(1)=-45.392;C(2)=-33.434;C(3)=-53.460;C(4)=-45.343;

Psat(1)=exp(A(1)+B(1)/(T+C(1)));
Psat(2)=exp(A(2)+B(2)/(T+C(2)));
Psat(3)=exp(A(3)+B(3)/(T+C(3)));
Psat(4)=exp(A(4)+B(4)/(T+C(4)));

Keq=exp(0.83983+782.98/T);

K=10^(-12.5454+3166/T);

y2=Psat(2)*G(2)*x(2)*1/P*1/(((2*(1-y1+sqrt((1+4*K*P*y1*(2-y1))))))/...
    ((2-y1)*(1+sqrt((1+4*K*P*y1*(2-y1))))));

y3=Psat(3)*G(3)*x(3)*1/P/(((2*(1-y1+sqrt((1+4*K*P*y1*(2-y1))))))/...
    ((2-y1)*(1+sqrt((1+4*K*P*y1*(2-y1))))));


Y1=y1+y3;
Y2=y2+y3;


xdot(1)=x(7)-(x(1)+x(3));
xdot(2)=x(8)-(x(2)+x(3));
xdot(3)=1-x(1)-x(2)-x(3)-x(4);
xdot(4)=G(1)*G(2)*x(1)*x(2)-G(3)*G(4)*x(3)*x(4)/Keq;
xdot(5)= y1-Psat(1)*G(1)*x(1)/((1+sqrt((1+4*K*Psat(1))))/...
    (1+sqrt((1+4*K*P*y1*(2-y1)))))*1/P;
xdot(6)=P-Psat(1)*G(1)*x(1)/(((1+sqrt((1+4*K*Psat(1))))/...
    (1+sqrt((1+4*K*P*y1*(2-y1))))))...
    -Psat(2)*G(2)*x(2)/(((2*(1-y1+sqrt((1+4*K*P*y1*(2-y1))))))/...
    ((2-y1)*(1+sqrt((1+4*K*P*y1*(2-y1))))))...
    -Psat(3)*G(3)*x(3)/(((2*(1-y1+sqrt((1+4*K*P*y1*(2-y1))))))/...
    ((2-y1)*(1+sqrt((1+4*K*P*y1*(2-y1))))))...    
    -Psat(4)*G(4)*x(4)/(((2*(1-y1+sqrt((1+4*K*P*y1*(2-y1))))))/...
    ((2-y1)*(1+sqrt((1+4*K*P*y1*(2-y1))))));
xdot(7)=-x(7)+Y1;
xdot(8)=-x(8)+Y2;

xdot = xdot';  % xdot must be a column vector

else
   
% Return M
   M = zeros(8,8);
      M(7,7) = 1;
      M(8,8)= 1;
     
   xdot = M;
end

function dx = stirred_model(t,x)

%x(1) = x1
%x(2) = x2
%x(3) = p1
%x(4) = p2
global A E

% particular solution0
dx(1) = A(1,1)*x(1)+A(1,2)*x(2)+A(1,3)*x(3)+A(1,4)*x(4)+E(1);
dx(2) = A(2,1)*x(1)+A(2,2)*x(2)+A(2,3)*x(3)+A(2,4)*x(4)+E(2);
dx(3) = A(3,1)*x(1)+A(3,2)*x(2)+A(3,3)*x(3)+A(3,4)*x(4)+E(3);
dx(4) = A(4,1)*x(1)+A(4,2)*x(2)+A(4,3)*x(3)+A(4,4)*x(4)+E(4);

% homogeneous solution1
dx(5)  = A(1,1)*x(5)+A(1,2)*x(6)+A(1,3)*x(7)+A(1,4)*x(8);
dx(6)  = A(2,1)*x(5)+A(2,2)*x(6)+A(2,3)*x(7)+A(2,4)*x(8);
dx(7)  = A(3,1)*x(5)+A(3,2)*x(6)+A(3,3)*x(7)+A(3,4)*x(8);
dx(8)  = A(4,1)*x(5)+A(4,2)*x(6)+A(4,3)*x(7)+A(4,4)*x(8);

% homogeneous solution1
dx(9)   = A(1,1)*x(9)+A(1,2)*x(10)+A(1,3)*x(11)+A(1,4)*x(12);
dx(10)  = A(2,1)*x(9)+A(2,2)*x(10)+A(2,3)*x(11)+A(2,4)*x(12);
dx(11)  = A(3,1)*x(9)+A(3,2)*x(10)+A(3,3)*x(11)+A(3,4)*x(12);
dx(12)  = A(4,1)*x(9)+A(4,2)*x(10)+A(4,3)*x(11)+A(4,4)*x(12);


dx = dx(:);
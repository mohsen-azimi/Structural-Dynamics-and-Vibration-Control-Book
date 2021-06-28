function f=f_dFcn(t,y)
% four first order equations are given by f
 
m=[100, 0, 0;       % Mass
     0,10, 0;
     0, 0,10];
 
c=[ 400,-200,   0;
   -200, 400,-200;
      0,-200, 200]; % Damping
 
k=1000*[8,-4, 0;    % Stiffness
       -4, 8,-4;
        0,-4, 4]; 
% Forces
force = 50*[1;1;1];
om = 5.0;
%% Four First Order Equations
f = zeros(6,1);

f(1)=y(2);
f(2)=force(1)*cos(om*t)-c(1,1)*y(2)/m(1,1)-c(1,2)*y(4)/m(1,1)...
-c(1,3)*y(6)/m(1,1)-k(1,1)*y(1)/m(1,1)-k(1,2)*y(3)/m(1,1)-k(1,3)*y(5)/m(1,1);
f(3)=y(4);
f(4)=force(2)*cos(om*t)-c(2,1)*y(2)/m(2,2)-c(2,2)*y(4)/m(2,2)...
-c(2,3)*y(6)/m(2,2)-k(2,1)*y(1)/m(2,2)-k(2,2)*y(3)/m(2,2)-k(2,3)*y(5)/m(2,2);
f(5)=y(6);
f(6)=force(3)*cos(om*t)-c(3,1)*y(2)/m(3,3)-c(3,2)*y(4)/m(3,3)...
-c(3,3)*y(6)/m(3,3)-k(3,1)*y(1)/m(3,3)-k(3,2)*y(3)/m(3,3)-k(3,3)*y(5)/m(3,3);

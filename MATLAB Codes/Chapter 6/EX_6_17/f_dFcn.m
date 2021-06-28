function f = f_dFcn(t,y)

    m = [1 0;0 2];    % Mass Matrix
    
    k = [5 -2;-2 3];  % Stiffness Matrix
    
    c = [4 -1;-1 2];  % Damping Matrix
    
    force=[1;2];      % Force Vector
    
    om = 3.0;
%% DE: 
% Four First Order Equations
f = zeros(4,1);

f(1) = y(2);
f(2) = force(1)*cos(om*t)-c(1,1)*y(2)/m(1,1)-c(1,2)*y(4)/m(1,1)...
       -k(1,1)*y(1)/m(1,1)-k(1,2)*y(3)/m(1,1);
f(3) = y(4);
f(4) = force(2)*cos(om*t)-c(2,1)*y(2)/m(2,2)-c(2,2)*y(4)/m(2,2)...
-k(2,1)*y(1)/m(2,2)-k(2,2)*y(3)/m(2,2);
    
 



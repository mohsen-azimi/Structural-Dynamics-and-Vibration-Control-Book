function f=dfunc1(t,y)
    % four first order equations are given by f
    f = zeros(4,1);
    % mass matrix
    m=[1 0;0 2];
    %stiffness matrix
    k=[5 -2;-2 3];
    % damping matrix
    c=[4 -1;-1 2];
    % force vector
    force=[1;2];
    
    om=3.0;
%%
    % four first order equations
f(1) = y(2);
f(2) = force(1)*cos(om*t)-c(1,1)*y(2)/m(1,1)-c(1,2)*y(4)/m(1,1)...
       -k(1,1)*y(1)/m(1,1)-k(1,2)*y(3)/m(1,1);
f(3) = y(4);
f(4) = force(2)*cos(om*t)-c(2,1)*y(2)/m(2,2)-c(2,2)*y(4)/m(2,2)...
-k(2,1)*y(1)/m(2,2)-k(2,2)*y(3)/m(2,2);
    
 



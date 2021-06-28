function f=f_dFcn(t,y)

   
    m = [1,0;0,1];   % Mass Matrix
    
    k = [5 -3;-3 5]; % Stiffness Matrix
    

    % Four First Order Equations
    f = zeros(4,1);
    ............
    f(1) = y(2);
    f(2) = -k(1,1)*y(1)/m(1,1)-k(1,2)*y(3)/m(1,1);
    f(3) = y(4);
    f(4) = -k(2,1)*y(1)/m(2,2)-k(2,2)*y(3)/m(2,2);

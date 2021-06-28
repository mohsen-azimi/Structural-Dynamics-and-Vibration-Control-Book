function f=dfunc1(t,y)
    
    m = [1,0;0,1]; % Mass matrix
    k = [5 -3;-3 5]; % Stiffness matrix
    
    % four first order equations
    f = [y(2)
        -k(1,1)*y(1)/m(1,1)-k(1,2)*y(3)/m(1,1)
    	y(4)
    	-k(2,1)*y(1)/m(2,2)-k(2,2)*y(3)/m(2,2)];

%% Functions

% The right hand side of the differential equation:  M(t,y)*y'=F(t,y) 
function yp = FF(t,y) 
    l1 = 1; 
    l2 = 1; 
    m2 = 5; 
    g  = 9.81; 
    w2 = m2*g; 
    yp = zeros(4,1);

    yp(1) = y(2); 
    yp(2) = -w2*sin(y(1))+ (m2*l2/2)*(y(4)^2)*sin(y(3)-y(1)); 
    yp(3) = y(4); 
    yp(4) = (-w2*l2*sin(y(3)))/2+(m2*l1*l2/2)*(y(2)^2)*sin(y(3)-y(1));
end
...................................

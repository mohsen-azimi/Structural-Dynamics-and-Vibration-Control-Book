
% mass matrix
function n = MM(t,y)
l1 = 1;
l2 = 1;
m2 = 5;
g  = 9.81;
w2 = m2*g;
n1 = [1 0 0 0];
n2 = [0 m2*l1 0 (m2*l2/2)*cos(y(3)-y(1))];
n3 = [0 0 1 0];
n4 = [0 (m2*l1*l2/2)*cos(y(3)-y(1)) 0 m2*l2*l2/3];
n  = [n1;n2;n3;n4];
end
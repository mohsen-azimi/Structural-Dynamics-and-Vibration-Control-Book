% the following function contains the mass matrix.
%it is separately stored in a file named, mass.m
function m = mass(t,y)
M1=5;
M2=5;
g=9.81;
l1=1;
l2=1;
m1=[1 0 0 0];
m2=[0 (M1+M2)*l1 0 M2*l2*cos(y(3)-y(1))];
m3=[0 0 1 0];
m4=[0 M2*l1*cos(y(3)-y(1)) 0 M2*l2];
m=[m1;m2;m3;m4];

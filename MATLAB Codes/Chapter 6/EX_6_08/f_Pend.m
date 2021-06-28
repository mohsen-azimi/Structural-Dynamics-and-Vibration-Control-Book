%differential equation of the form
%M(t,y)*y'=F(t,y)
%i.e. it contains F(t,y).it is also stored in a separate file named, pend.m.
function yp= pend(t,y)
M1=5;
M2=5;
g=9.81;
l1=1;
l2=1;
w2=M2*9.81;
w1=M1*9.81;
yp=zeros(4,1);
yp(1)=y(2);
yp(2)=-(w1+w2)*sin(y(1))+M2*l2*(y(4)^2)*sin(y(3)-y(1));
yp(3)=y(4);
yp(4)=-w2*sin(y(3))-M2*l1*(y(2)^2)*sin(y(3)-y(1));
%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 7-8: Eigenvalue Analysis and Mode Shapes
    
clc; clear; close all;
%% Parameters

m = [1 0 0;0 1 0;0 0 1];
disp(' Mass Matrix: ')
m

a = [.75 .5 .25;.5 1 .5;.25 .5 .75];  % Flexibility Matrix (-> k=[2 -1 0;-1 2 -1;0 -1 1],a=inv(k))
disp(' flexibility matrix')
a
c = a*m;
[ms,~] = size(m);
%% Eigenvalues & Vectors
[V,D] = eig(c);
for i=1:ms
    e(i) = 1/D(i,i);
end

Qh = max(e)+0.001;
Ql = 0;

for i=1:ms
    for j=1:ms
        if e(j) > Ql & e(j) < Qh
            kk=j;
            Qh=e(j);
        else
        end
    end
    Ql = Qh;
    Qh = max(e)+0.001;
    om1(i) = e(kk);
    omega(i) = sqrt(e(kk));
    for l=1:ms
        p1(l,i)=V(l,kk);
    end
end
%% Normalizing The Mode Shape
L = p1'*m*p1;
% Modal Matrix
for i=1:ms
    for j=1:ms
        p(i,j)=p1(i,j)/sqrt(L(j,j));
    end
end
disp(' Natural Frequencies (rad/s)')
disp(omega)
disp(' Normalized Modal Vector')
disp(p)
p'*m*p

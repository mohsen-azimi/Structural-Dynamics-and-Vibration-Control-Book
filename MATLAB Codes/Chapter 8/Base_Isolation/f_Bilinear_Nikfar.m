function [F2,up2,q2] = f_Bilinear_Nikfar(up1,q1,u2,Fy,k1,alpha)
%Bilinear hysteretic model
%Writen by Farzad Nikfar, McMaster Univ.
%--------------------------------------------------------------------------
% INPUT
%       [up1] :       Uplastic of step n=1                        [1,1]
%       [q1] :        Center of yielding for step n=1             [1,1]
%       [u2] :        expected disp for step n=2                  [1,1]
%       [Fy] :        Yielding strength. For FPS=WMu              [1,1]
%       [k1] :        Initial stiffness. or: Fy/uy                [1,1]
%       [alpha] :     k2/k1                                       [1,1]

%%
H=alpha*k1/(1-alpha);

F_tri=k1*(u2-up1);

xi_tri=F_tri-q1;

f_tri=abs(xi_tri)-Fy;

dGam=f_tri/(k1+H);

if f_tri<= 0
    F2=F_tri;
    up2=up1;
    q2=q1;
else
    F2=F_tri-k1*dGam*sign(xi_tri);
    up2=up1+dGam*sign(xi_tri);
    q2=q1+dGam*H*sign(xi_tri);
end
end
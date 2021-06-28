
 % 1=previous step; 2=current step; 3=next step
 % Simple Bouc Wen Model of MR damper using Runge Kutta 4th order method
function f_callMRdamper()
%%
global Z i MRdamper myStructure earthquake

%% Update from the previous state (call from the saved global variables)


     
    v1     = Z(1+myStructure.n,i-1);  
    v2     = Z(1+myStructure.n,i);    
    

................................................
dt = earthquake.dt;
................................................
c0A    = MRdamper.c0A;     
c0B    = MRdamper.c0B;     

alphaA = MRdamper.alphaA; 
alphaB = MRdamper.alphaB;  

gamma  = MRdamper.gamma;   
beta   = MRdamper.beta;   
A      = MRdamper.A; 
n      = MRdamper.n;
eta    = MRdamper.eta;     
................................................
z2  = MRdamper.z(i);                   
V   = MRdamper.V(i);

u      = MRdamper.u(i-1); 
uD     = -eta*( u  -  V );
u      =  uD*dt  +  u;

%%
      
% Damper constants computation                       
   c0    = c0A    + c0B.*u;  
   alpha = alphaA + alphaB.*u;
   %***********Determination of slopes using RK4***************
 
% y(i+1) = y(i)+dy
% dy     = 1/6 (k1+2K2+2k3+k4)h

...   k1=f(x(i),y(i))
...   k2=f(x(i)+h/2, y(i)+k1*h/2)
...   k3=f(x(i)+h/2, y(i)+k2*h/2)
...   k4=f(x(i)=h, y(i)+k3*h)
%     h=dt
%***********Determination of slopes using RK4 alt***************
 
kz1 = dt*(  -gamma.*abs(v1).*z2.*abs(z2).^(n-1) - beta.*(v1).*abs(z2).^n + A.*(v1) );

kz2 = dt*(  -gamma.*abs((v1+v2)/2).*(z2+kz1/2).*abs(z2+kz1/2).^(n-1)-beta.*( (v1+v2)/2 ).*abs(z2+kz1/2).^n + A.*( (v1+v2)/2 ) );
 

kz3 = dt*(  -gamma.*abs((v1+v2)/2).*(z2+kz2/2).*abs(z2+kz2/2).^(n-1) - beta.*( (v1+v2)/2 ).*abs(z2+kz2/2).^n + A.*( (v1+v2)/2 ) );
 


kz4 = dt*(  -gamma.*abs(v2).*(z2).*abs(z2).^(n-1)   -beta.* v2.*abs(z2+kz3).^n + A.* v2  );
 

                                                  
%Next value of  variable (z)and variable (y)
        dz = (kz1 + 2*kz2 + 2*kz3 + kz4)/6;
        
        z3 = z2 + dz;  

      

%************Damper force using Modified Bouc-Wen model****************
   
  
  F = alpha.*z3 +  c0.*v2;
  %******************end********************************************
%   F = min(max(-MRdamper.Fmax,F),MRdamper.Fmax);
  
  
  %% Save the current state for the next step
MRdamper.c0(i)     = c0; 
MRdamper.alpha(i)  = alpha; 

MRdamper.dz(i)     = dz;                  
MRdamper.z(i+1)    = z3;                  
                 

MRdamper.F(i)      = F; 

MRdamper.u(i)      = u;                  


end
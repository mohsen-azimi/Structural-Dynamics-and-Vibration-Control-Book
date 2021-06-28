

function MRdamper = f_MRdamperForce(MRdamper, dt, n, i,  Z_i)





%% Parameters are borrowed from "Time delay effect on larg-scale MR damper based semi-active control
 % Y-J Cha, A K Agrawal and S J Dyke  
 % DOI: 10.1088/0964-1726/22/1/015011f
 
 
 
 
% disp('Device:     MR-Damper "Dyke 2013 " (kN m)')

%% MRdamper Constant Parameters
% MRdamper.c0A    = 201.3;    % KN.s/m
% MRdamper.c0B    = 0.1229;   % KN.s/m
% MRdamper.c0C    = -109;     % KN.s/m
% MRdamper.c0D    = -2.116;   % KN.s/m
% 
% 
% MRdamper.c1A    = 100;       % KN.s/m
% MRdamper.c1B    = 15000;     % KN.s/m V
% 
% MRdamper.k0     = 0.0559;    % KN.s/m
% MRdamper.k1     = 0.0641;    % KN/m
% 
% 
% MRdamper.alphaA = 687.7;     % KN
% MRdamper.alphaB = 0.006;     % KN
% MRdamper.alphaC = -697.6;    % KN
% MRdamper.alphaD = -0.91;     % KN
% 
% MRdamper.gamma  = 3000;      % m^-2
% MRdamper.beta   = 3000;      % m^-2 
% MRdamper.A      = 336.5640; 
% MRdamper.n      = 2;
% % MRdamper.nu     = 195;     % s^-1
% MRdamper.x0     = 0.01;      % m 
% 
% MRdamper.maxVolt   = 0;      % Volt
% MRdamper.maxForce  = 200;    % kN

            c0A    = 201.3;    % KN.s/m
            c0B    = 0.1229;   % KN.s/m
            c0C    = -109;     % KN.s/m
            c0D    = -2.116;   % KN.s/m


            c1A    = 100;       % KN.s/m
            c1B    = 15000;     % KN.s/m V

            k0     = 0.0559;    % KN.s/m
            k1     = 0.0641;    % KN/m


            alphaA = 687.7;     % KN
            alphaB = 0.006;     % KN
            alphaC = -697.6;    % KN
            alphaD = -0.91;     % KN

            gamma  = 3000;      % m^-2
            beta   = 3000;      % m^-2 
            A      = 336.5640; 
            nMR      = 2;
            % MRdamper.nu     = 195;     % s^-1
            x0     = 0.01;      % m 

            maxVolt   = 0;      %#ok   % Volt
            maxForce  = 200;    %#ok   % kN       
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Extract data from previous and current steps
F     = MRdamper.F;
zdot  = MRdamper.zdot;
z     = MRdamper.z;  
ydot  = MRdamper.ydot;  
y     = MRdamper.y;
xdot  = MRdamper.xdot;
x     = MRdamper.x;

ii    = MRdamper.i;          % ii = current 

alpha = MRdamper.alpha; 
c0    = MRdamper.c0;  
c1    = MRdamper.c1;  


x(i)    = Z_i(1);
xdot(i) = Z_i(1+n);

%%

alpha(i) = alphaA*exp(alphaB*ii(i))+alphaC*exp(alphaD*ii(i));
c0(i)    = c0A*exp(c0B*ii(i))+c0C*exp(c0D*ii(i));
c1(i)    = c1A*sqrt(ii(i))+c1B;


    %% Determine Constants Based on the voltage

   
    
ydot(i)  = (1/(c0(i)+c1(i))) *  (alpha(i)*z(i-1) + k0*(x(i)-y(i-1)) + c0(i)*xdot(i)); % double chack this
y(i)   = ydot(i)*dt+y(i-1);


zdot(i)  = -gamma*abs(xdot(i)-ydot(i))*z(i-1)*abs((z(i-1)))^(nMR-1)  -  beta*(xdot(i)-ydot(i))*abs(z(i-1))^nMR  +  A*(xdot(i)-ydot(i));
z(i)   = zdot(i)*dt+z(i-1);


% F(i)=c1(i)*yD(i)+k1*(x(i)-x0); % Or, F(i)=alpha(i)*z(i)+c0(i)*(xD(i)-yD(i))+k0*(x(i)-y(i))+k1*(x(i)-x0) [eq-10 from Spencer 1997]
F(i)   = alpha(i)*z(i) + c0(i)*(xdot(i)-y(i)) + k1*(x(i)-x0);






%% Pack & Export the data from the current time step;
MRdamper.F       = F;
MRdamper.zdot    = zdot;
MRdamper.z       = z;  
MRdamper.ydot    = ydot;  
MRdamper.y       = y;
MRdamper.xdot    = xdot; 
MRdamper.x       = x; 
MRdamper.alpha   = alpha; 
MRdamper.c0      = c0;  
MRdamper.c1      = c1;  
MRdamper.i       = i;  

end


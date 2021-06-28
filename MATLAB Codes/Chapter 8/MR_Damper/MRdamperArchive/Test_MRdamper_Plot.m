%% Structural Dynamics and Vibration Control(M. Azimi et al.)
% This file plots MR damper response based on the given parameters
clear all; clc; close all;
%%
myStructure_ns = 1;
dt   = 0.001;
t    = 0:dt:2;
f = 1; %Hz
% w = 1/(2*pi())*f;
w=9.43;
Z = [  6*sin(w*t);           % cm
        40*cos(w*t)];        % cm/s
Z = 0.01*Z;  %cm to m;
  
%% Parameters are borrowed from "Modeling and control of magnetorheological dampers for seismic response reduction"

% References: 
web('https://scholar.google.com/citations?user=dfhewssAAAAJ&hl=en')
% Azimi, Mohsen. "Design of Structural Vibration Control Using Smart Materials and Devices for Earthquake-Resistant and Resilient Buildings." North Dakota State University: Fargo, ND, USA (2017).
% Azimi, Mohsen, and Asghar Molaei Yeznabad. "Swarm-Based Parallel Control of Adjacent Irregular Buildings Considering Soil–Structure Interaction." Journal of Sensor and Actuator Networks 9, no. 2 (2020): 18.
% 
%% MRdamper Constant Parameters
MRdamper_c0A    = 44;       % N.s/m
MRdamper_c0B    = 440;      % N.s/m . V

MRdamper_alphaA = 1087200;      % N/m
MRdamper_alphaB = 4691600;      % N/m . V

MRdamper_gamma  = 300;       % m^-2
MRdamper_beta   = 300;       % m^-2 
MRdamper_A      = 1.2; 
MRdamper_n      = 1;
MRdamper_eta    = 50;       % s^-1
MRdamper_x0     = 0;         % m 

%% Max. Capacity
MRdamper_Vmax     = 5;              % volt 
MRdamper_Fmax     = 50*10^3;            % N 

%% other Pre-allocations
MRdamper_c0     = [MRdamper_c0A,    zeros(1,max(size(t))-1)];               % Preallocations
MRdamper_alpha  = [MRdamper_alphaA, zeros(1,max(size(t))-1)];               % Preallocations

MRdamper_dz     = zeros(1,max(size(t)));                           % Preallocations
MRdamper_z      = zeros(1,max(size(t)));                           % Preallocations

MRdamper_F      = zeros(1,max(size(t)));                           % Preallocations
MRdamper_V      = 5*ones(1,max(size(t)));                          % Preallocations
MRdamper_u      = 1*ones(1,max(size(t)));                          % Preallocations

%% Parameters are borrowed from "Modeling and control of magnetorheological dampers for seismic response reduction"

for j = 1:4
    v = [0,1,3,5]; 
    MRdamper_V      = v(j)*ones(1,max(size(t)));                          % Preallocations
    
    colorMap = ['r','b','g','k'];

for i=2:numel(Z(1,:))
 %% f_callMRdamper()
 %% Update from the previous state (call from the saved global variables)
 
    v1     = Z(1+myStructure_ns,i-1);  
    v2     = Z(1+myStructure_ns,i);    
    

................................................
................................................
c0A    = MRdamper_c0A;     
c0B    = MRdamper_c0B;     

alphaA = MRdamper_alphaA; 
alphaB = MRdamper_alphaB;  

gamma  = MRdamper_gamma;   
beta   = MRdamper_beta;   
A      = MRdamper_A; 
n      = MRdamper_n;
eta    = MRdamper_eta;     
................................................
z2  = MRdamper_z(i);                   
V   = MRdamper_V(i);

u      = MRdamper_u(i-1); 
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
 
                                                
% Next value of  variable (z)and variable (y)
        dz = (kz1 + 2*kz2 + 2*kz3 + kz4)/6;
        
        z3 = z2 + dz;  

      

%************Damper force using Modified Bouc-Wen model****************
   

  F = alpha.*z3 +  c0.*v2;
  %******************end********************************************
%   F = min(max(-MRdamper_Fmax,F),MRdamper_Fmax);
  
  
  %% Save the current state for the next step
MRdamper_c0(i)     = c0; 
MRdamper_alpha(i)  = alpha; 
MRdamper_dz(i)     = dz;                  
MRdamper_z(i+1)    = z3;                               
MRdamper_F(i)      = F; 
MRdamper_u(i)      = u;                  

end

figure (2); set(figure(2),'position',[300 100 800 400]);
            subplot(1,2,1); grid on; hold on; box on
            
            plot(Z(1,100:end)*100, MRdamper_F(100:end)/1000,colorMap(j), 'LineWidth',2)

            xlabel('Displacement (cm)', 'fontsize',12,'fontname','Times New Roman','FontWeight','Bold')
            ylabel('MR Force (kN)', 'fontsize',12,'fontname','Times New Roman','FontWeight','Bold')
            axis([-8 8 -53 53])

            text(0.01,47,'v = 5 volt','fontsize',12,'fontname','Times New Roman')
            text(0.01,28,'v = 3 volt','fontsize',12,'fontname','Times New Roman')
            text(0.01,9,'v = 1 volt','fontsize',12,'fontname','Times New Roman')
            text(0.01,1,'v = 0 volt','fontsize',12,'fontname','Times New Roman')
            set(gca, 'YTick',[-40, -20,0,20, 40],...
                     'XTick',[-5, 0,5],...
                     'FontWeight','bold','fontname','Times New Roman',...
                     'fontsize',12,...
                      'LineWidth',1);
            ..................................................

            subplot(1,2,2); hold on; box on; grid on;

            plot(Z(2,100:end)*100, MRdamper_F(100:end)/1000,colorMap(j), 'LineWidth',2)


            xlabel('Velocity (cm/s)', 'fontsize',12,'fontname','Times New Roman','FontWeight','Bold')
            ylabel('MR Force (kN)', 'fontsize',12,'fontname','Times New Roman','FontWeight','Bold')
            axis([-40 40 -53 53])

            text(21,47,'v = 5 volt','fontsize',12,'fontname','Times New Roman')
            text(21,28,'v = 3 volt','fontsize',12,'fontname','Times New Roman')
            text(21,9,'v = 1 volt','fontsize',12,'fontname','Times New Roman')
            text(21,1,'v = 0 volt','fontsize',12,'fontname','Times New Roman')

             set(gca, 'YTick',[-40, -20,0,20, 40],...
                      'XTick',[-40, -20,0,20, 40],...
                      'FontWeight','bold','fontname','Times New Roman',...
                      'FontSize',12,...
                      'LineWidth',1);

end

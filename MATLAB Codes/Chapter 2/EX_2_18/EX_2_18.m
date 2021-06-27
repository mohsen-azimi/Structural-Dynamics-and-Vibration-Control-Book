%% Example 2-18: Plot The Response (Displacement, Velocity, and Acceleration) of A Damped SDOF 

clear; close all; clc;
%% Parameters
m  = 2;          % Mass 
k  = 8;          % Stiffness 
wn = sqrt(k/m);
c1 = 1;          % Damping coefficient
 
% Initial conditions - displacement and velocity
x(1)    = 0.3;
xdot(1) = 0.5;
xddot(1)=(-c1*xdot(1)-k*x(1))/m;
%% Calculate the Response & Plot
cc    = 2*sqrt(k*m);
rho   = c1/cc;
wd    = wn*sqrt(1-rho^2);
wba   = rho*wn;
rhoba = rho/sqrt(1-rho^2);
b0    = 2.0*rho*wn;
b1    = wd^2-wba^2;
b2    = 2.0*wba*wd;
dt    = 0.02;
t(1)  = 0;

for i = 2:1500
    t(i) = (i-1)*dt;
    s = exp(-rho*wn*t(i))*sin(wd*t(i));
    c = exp(-rho*wn*t(i))*cos(wd*t(i));
    
    sdot  = -wba*s+wd*c;
    cdot  = -wba*c-wd*s;
    sddot = -b1*s-b2*c;
    cddot = -b1*c+b2*s;
    
    a1 = c+rhoba*s;
    a2 = s/wd;
    a3 = cdot+rhoba*sdot;
    a4 = sdot/wd;
    a5 = cddot+rhoba*sddot;
    a6 = sddot/wd;
    
    x(i)     = a1*x(1)+a2*xdot(1);
    xdot(i)  = a3*x(1)+a4*xdot(1);
    xddot(i) = a5*x(1)+a6*xdot(1);
end

%% Plot Displacement
figure(1);  set(figure(1), 'Position', [100   100   800   600])
            subplot(3,1,1)
            plot(t,x,'-k','LineWidth',2); ylim([-.4 .4]);
                set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
                ylabel('Displacement', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
            
%% Plot Velocity
            subplot(3,1,2)
            plot(t,xdot,'--k','LineWidth',2); ylim([-.8 .8]);
                set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
                ylabel('Velocity', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
            
%% Plot Acceleration
            subplot(3,1,3)
            plot(t,xddot,':k','LineWidth',2); ylim([-2 2]);
                set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
                xlabel('Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
                ylabel('Acceleration', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
print('EX_2_18','-dpng')
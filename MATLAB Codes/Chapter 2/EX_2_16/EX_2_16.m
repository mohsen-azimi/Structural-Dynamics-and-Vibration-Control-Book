%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 2-16: Plot The Response of A SDOF with Coulomb Damping-1

clear; close all; clc;
%% Parameters
m      = 600;       % Mass
k      = 200000;    % Stiffness
mus    = 0.15;      % Static Friction Coefficient
muk    = 0.10;      % Kinetic Friction Coefficient
x0     = 1.5;       % Initial Displacement
t0     = 0;
deltat = 0.005;     % Time Increment
wn     = sqrt(k/m); % Natural Frequency
fd     = 100*muk*m*9.81/k;
N      = ceil(0.5*((x0-(1+mus/muk)*fd)/fd+1)); % Half cycles
t      = []; 
u      = [];
%%
if N>0
    for n = 1:N
        t1 = [t0:deltat:t0+pi/wn];
        x1 = (x0-(2*n-1)*fd)*cos(wn*t1)+fd*(-1)^(n+1);
        t  = [t t1];
        u  = [u x1];
        t0 = t0+pi/wn;
    end
end
%% Plot
figure(1);  set(figure(1), 'Position', [200   100   883   300])
            hold on; grid on; box on;

            plot(t,u,'-k','LineWidth',2);
              plot(t,fd*ones(length(t)),':k','LineWidth',2);
              plot(t,-fd*ones(length(t)),':k','LineWidth',2);

            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
            xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel('{\it{u}} [cm]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Print 
print('EX_2_16','-dpng')
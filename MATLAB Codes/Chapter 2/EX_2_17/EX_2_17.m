%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 2-17: Plot The Response of A SDOF with Coulomb Damping-2

clear; close all; clc;
%% Parameters
tspan = [0 2];  % Time span
y0    = [0;0];  % Initial State

%% Calculate the Response
[t,y] = ode45(@f_coulomb, tspan, y0);

%% Plot
figure(1);  set(figure(1), 'Position', [200   100   883   300])
            hold on; grid on; box on;

            plot(t,y(:,1),'-k','LineWidth',2);
            plot(t,y(:,2),'-.k','LineWidth',2);

            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
            xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel('\theta', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
            legend({'$\theta$';'$\dot{\theta}$'}, 'interpreter','latex')

%% Print
print('EX_2_17','-dpng')

%% Functions
function yp =f_coulomb(t, y)
    g  = 9.81;
    mu = 0;
    l  = 0.25;
    k1 = 1+mu*sin(y(1));
    k2 = mu*cos(y(1))*(y(2)^2);
    k3 = cos(y(1))*(1-mu^2);
    k4 = mu*sin(y(1));
    yp = [y(2);((g/l)*((k3-k4)/k1)-(k2/k1))];
end
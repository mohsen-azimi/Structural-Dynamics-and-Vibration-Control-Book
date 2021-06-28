%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 2-9: Plot Response of An Underdamped SDOF with Different Damping Ratios 

clear; close all; clc;
%% Parameters
wn  = 5;                % Natural frequency [rad/s]
x0  = 0;                % Initial displacement
v0  = 60;               % Initial velocity [cm/s]
t0  = 0;                % Initial time
deltat = 0.01;          % Time step
tf  = 6;                % Final time
t   = [t0:deltat:tf];   % Time vector

%% Calculate Response & Plot
figure(1); set(figure(1), 'Position', [200   100   883   400])
           hold on; grid on; box on;

           Legends = {'\zeta = 0.05';'\zeta = 0.10';'\zeta = 0.20'};
           Lines   = {'-k';          '--k';         ':k'};

i = 0;
for zeta = [0.05,0.1,0.2]
    wd = sqrt(1-zeta^2)*wn; % Damped frequency
    x  = exp(-zeta*wn*t).*(((zeta*wn*x0+v0)/wd)*sin(wd*t)+ x0*cos(wd*t));

        i = i+1;
        plot(t,x,Lines{i},'LineWidth',2);  ylim([-15 15]);
end

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('Displacement [cm]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        legend(Legends,'location','northeast', 'orientation','horizontal')

%% Print
print('EX_2_9','-dpng')
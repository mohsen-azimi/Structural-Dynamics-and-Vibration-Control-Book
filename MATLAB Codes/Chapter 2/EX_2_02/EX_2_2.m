%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 2-2: Displacement Response of An Undamped SDOF

clear; close all; clc;
%% Initial conditions
v0 = 1;
vdot0 = 1;

%% Period and frequency
T = 1;
omega = 2*pi/T;

%% Time vector 
t = linspace(0,5,500);  % [0 - 5] seconds

%% Displacement
v = (vdot0/omega)*sin(omega*t) + v0*cos(omega*t);

%% Plot 
figure(1);  set(figure(1), 'Position', [200   100   883   400])
            hold on; grid on; box on;
            plot(t,v,'LineWidth',2,'Color',[0 0 0]);
            
            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
            xlabel({'Time [s]'}, 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel('Displacement [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    
%% Print
   print('EX_2_2','-dpng')
%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 3-11: Response of a Damped SDOF under Harmoinc Loading-1

clear; close all; clc;
%% Parameters & Response Calculation 
tspan = [0 5]; 
y0    = [0.02;0]; 
[t,y] = ode45(@f_forced,tspan,y0); 

%% Plot
figure(1);  set(figure(1), 'Position', [200   100   883   400])
            hold on; grid on; box on;

            plot(t,y(:,1),'-k','LineWidth',2);

            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
            xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel('Displacement [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
print('EX_3_11','-dpng')

%% Functions
function yp = f_forced(t,y) 
    P_0 = 100;
    k   = 100;
    m   = 1; 
    omega_n=10;
    zeta= 0.1;
    c = 2*zeta*omega_n*m;

    yp = [y(2);(((P_0/m)*sin(2*omega_n*t))-((c/m)*y(2))-((k/m)*y(1)))]; 
end
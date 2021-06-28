%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 2-6: Plot Response of A Simple Pendulum 

clear; close all; clc;
%% Parameters
tspan = [0 5];
y0    = [1.57;0];

%% Canlculate The Response & Plot
figure(1); set(figure(1), 'Position', [200   100   883   400])
           hold on; grid on; box on;

% Linear 
[t,y] = ode45(@f_linear,tspan,y0);
        plot(t,y(:,1),'k','LineWidth',2);
        axis([0 1 -2 2])
        
% Nonlinear
[t,y] = ode45(@f_nonlinear,tspan,y0);
        plot(t,y(:,1),'--k','LineWidth',2);

        legend({'Linear','Nonlinear'},'location','northeast', 'orientation','horizontal')
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('Rotation (\theta)', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
   print('EX_2_6','-dpng')
   
%% Functions
function yp = f_linear(t,y)
       % yp = [y(2);((-g/l)   *(y(1)))]; 
         yp = [y(2);((-196.2) *(y(1)))]; 
end

function yp = f_nonlinear(t,y)
         yp = [y(2);((-196.2)*sin(y(1)))]; 
end
%% Example 2-8: Plot Response of An Underdamped SDOF 

clear; close all; clc;
%% Parameters
tspan = [0 4];
y0    = [0.02;0];

%% Calculate the Response & Plot
figure(1); set(figure(1), 'Position', [200   100   883   400])
           hold on; grid on; box on;

[t,y] = ode45(@f_unforced,tspan,y0);
        plot(t,y(:,1),'k','LineWidth',2);
        ylim([-0.02 0.02]);
    
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        xlabel('Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('Displacement (m)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

%% Print 
print('EX_2_8','-dpng')

%% Functions
function yp = f_unforced(t,y)

     zeta = 0.1; m=1; k=100;
     c    = 2*zeta*m*sqrt(k/m); 
     yp   = [y(2);(-((c/m)*y(2))-((k/m)*y(1)))];
end
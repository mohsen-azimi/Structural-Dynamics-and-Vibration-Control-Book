%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 2-10: Plot Displacemetn Response of An Underdamped/Overdamped SDOF with Different Damping Ratios 

clear; close all; clc;
%% Parameters
tspan = linspace(0, 1, 1000);  % Time span

%% Calculate ،he Response & Plot
figure(1); set(figure(1), 'Position', [200   100   883   400])
           hold on; grid on; box on;
           
           Legends = {'\zeta = 0.00';'\zeta = 0.10';'\zeta = 0.40';'\zeta = 1.00';'\zeta = 2.50'};
           Lines   = {'-k';          '--k';         '-.k';         '-r';          ':k'};

i = 0;
for zeta  = [0.0, 0.10, 0.40, 1.0, 2.5]
    
    [t, v] = ode45(@f_DLSDOF, tspan, [1 0]', [], zeta);
    i = i+1;
             plot(t,v(:,1),Lines{i},'LineWidth',2); axis([0,1.0,-1.5,1.5]);

end
            
            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
            xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel('Displacement [in]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
            legend(Legends,'location','northeast', 'orientation','horizontal')

%% Print
print('EX_2_10','-dpng')

%% Functions
function v = f_DLSDOF(t,v,zeta)
    v= [v(2); -2*27.8*zeta*v(2)-27.8*27.8*v(1)];
end

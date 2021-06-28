%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-14: Response of a two-DOF Gear System under Torsional Excitation

clc; clear; close all;
%%  Parameters
M0 = 1;   % Amplitude of The Moment
L  = 1;   % Length of Shaft
GJ = 1;   % Torsional Stiffness
n  = 3;   % Gear Ratio

r  = [0:0.01:3]; % Frequency Ratio
thetab = (M0*L*n)./(GJ*(1+(n.^n))*(1-r.^2)); % amplitude

%%  Plot
figure(1); set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;
        plot1 = plot(r,thetab);

        set(plot1(1),'LineStyle','-','LineWidth',2,'Color',[0 0 0]);
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel('\omega/\omega_n', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('\theta_b', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
print('EX_6_14','-dpng')



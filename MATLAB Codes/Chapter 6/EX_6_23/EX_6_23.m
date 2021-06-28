%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-23: Response of a two-DOF System using 'step',3
    
clc; clear; close all;
%% System Parameters

num1 = [1 0 7.5 0 0];
den1 = [2 0 105 0 900];

t = 0:0.02:5;

%% Calculate and Plot The Response

figure(1); set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;

    x = step(num1, den1, t);

    plot(t,x,'*k','LineWidth',2);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('{\itu}_1', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
 print('EX_6_23','-dpng')


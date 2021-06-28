%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-22: Response of a two-DOF System using 'step',3
    
clc; clear; close all;

%% System Parameters

num = [3.5 0 37.5 0 0];
den = [2 0 105 0 900];

t = 0:0.01:12;

%% Calculate and Plot The Response
figure(1); set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;

    x = step(num,den,t);

    plot(t,x,'-k','LineWidth',2);

    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Amplitude', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
 print('EX_6_22','-dpng')
%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-20: Response of a two-DOF System using 'step'
    
clc; clear; close all;
%% System Parameters
num = [1 4 4];
den = [1 8 4];

t = 0:0.01:6;


%% Calculate and Plot the Response
figure(1); set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;

    x = step(num,den,t);

    plot(t,x,'-k','LineWidth',2);

    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               

    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Amplitude', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
 print('EX_6_20','-dpng')


 
%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 4-7: Response of A Damped SDOF to Impact Load (using step function)

clear; close all; clc
%% 
num = [0.15 0.79 0];
den = [1 5 5];

t=0:0.01:6;

%%
figure(1)
    set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;

x = step(num,den,t);


plot(t,x,'-k','LineWidth',2);

set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               

xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
ylabel('Amplitude', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
% title('Response of spring mass-damper system to initial condition', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')






%%
 print('EX_4_7','-dpng')
%% Example 4-8: Response of a damped SDOF using step function

clear; close all; clc
%% 
num = [0 0 6];
den = [1 5 40];

t=0:0.01:6;

%%
figure(1)
    set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;

x = step(num,den,t);

plot(t,x,'-k','LineWidth',2);

set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               

xlabel('Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
ylabel('Amplitude', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

%%
 print('EX_4_8','-dpng')
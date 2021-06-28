%% Example 6-20: Response of a damped 2DOF system using 'step'

clear; close all; clc;
%% 
num = [1 4 4];
den = [1 8 4];

t=0:0.01:6;

%% Plot
figure(1)
    set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;

x = step(num,den,t);

plot(t,x,'-k','LineWidth',2);

set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
xlabel('Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
ylabel('Amplitude', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

%% Save
print('EX_6_20','-dpng')

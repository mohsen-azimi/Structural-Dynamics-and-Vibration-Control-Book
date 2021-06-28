%% Example 6-21: Response of an undamped 2DOF shear frame using 'step'-2

clear; close all; clc;
%% 
num = [3.5 0 37.5 0 0];
den = [2 0 105 0 900];
t = 0:0.01:12;

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
print('EX_6_22','-dpng')
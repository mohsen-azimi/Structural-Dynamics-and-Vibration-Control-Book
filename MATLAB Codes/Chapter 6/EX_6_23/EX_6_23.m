%% Example 6-21: Response of an undamped 2DOF shear frame using 'step'-2

clear; close all; clc;
%% 
num1 = [1 0 7.5 0 0];
den1 = [2 0 105 0 900];
t = 0:0.02:5;

%% Plot
figure(1)
    set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;

x = step(num1,den1,t);

plot(t,x,'*k','LineWidth',2);

set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               

xlabel('Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
ylabel('{\itu}_1', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

%% Save
print('EX_6_23','-dpng')
%% Example 3-5: Response of An Undamped SDOF at Resonance Frequency

clear; close all; clc;
%% Parameters
omega = 2*pi;
t     = 0:0.01:5.0;

R    = 0.5*omega.*t.*cos(omega*t);  % Dot product
Rmax = max(R) 

%% Plot
figure(1);  set(figure(1), 'Position', [200   100   883   400])
            hold on; grid on; box on;
            plot(t,R,'-k','LineWidth',2); xlim([0 5])

            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
            xlabel('Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel('Response Ratio, R(t)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
   print('EX_3_5','-dpng')
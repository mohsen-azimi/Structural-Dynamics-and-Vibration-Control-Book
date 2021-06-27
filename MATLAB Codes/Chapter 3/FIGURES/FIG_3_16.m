%% Figure 3-16: Response of a SDOF at Resonance Frequency

clear; close all; clc;
%% Parameters
f_n  = [1];  % Hz
f    = 0.2;  % Hz
f0   = 1000; % Hz
zeta = 0.1;
w   = 2*pi*f;
t   = 0:0.01:40;   % Time vector
    

R = 1/(2*zeta)*(exp(-zeta*w*t)-1).*cos(w*t);

%% Plot
figure(1);  set(figure(1), 'Position', [200   100   883   400])
            hold on; grid on; box on;

            plot(t,R,'-k','LineWidth',2); grid on
            line([0 40], [5 5],'Color','k','LineStyle','--','LineWidth',2)
            line([0 40], -[5 5],'Color','k','LineStyle','--','LineWidth',2)

            ylim([-6 6])
            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',12)               
            xlabel('Time (s)', 'fontsize',14, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel('R(t)', 'fontsize',14, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
print('FIG_3_16','-dpng')

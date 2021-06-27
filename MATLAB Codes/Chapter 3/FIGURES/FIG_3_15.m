%% Figure 3-15: Steady-state and Total Response of Damped SDOF Harmonic Loading

clear; close all; clc;
%% Parameters




    f_n = [1];  % Hz
    f = 0.2; % Hz
    f0  = 1000; % Hz
    zeta = 0.05;
    
    
    w_n = 2*pi*f_n;
    w   = 2*pi*f;

        u0 = 0; v0 = f0/w_n;

    beta   = w/w_n;
    t   = 0:0.01:20;   % Set the time vector
    
    A1 = u0;
    A2 = v0/w_n;
    A3 = f0 *(w_n^2-w^2)/((w_n^2-w^2)^2+(2*zeta*w_n*w)^2);
    A4 = f0 *(2*zeta*w_n*w)/((w_n^2-w^2)^2+(2*zeta*w_n*w)^2);
    
    A = f0/(2*w_n)*t;
    
    
    w_d = w_n*sqrt(1-zeta^2);
    
    y_transient   = exp(-zeta*w_n*t).*(A1*cos(w_d*t)+A2*sin(w_d*t));
    y_steadystate = A3*cos(w*t) + A4*sin(w*t);

    
figure(1);  set(figure(1), 'Position', [200   100   883   400])
            hold on; grid on; box on;

            plot(t,y_steadystate,'--r','LineWidth',2); grid on
            plot(t,y_steadystate+y_transient,'-k','LineWidth',2); grid on

            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',12)               
            xlabel('Time (s)', 'fontsize',14, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel('Displacement', 'fontsize',14, 'fontname','Times New Roman','FontWeight','Bold')
            legend('Steady-state','Total','location','north','numcolumns',2,'edgecolor','k')

%% Print
print('FIG_3_15','-dpng')

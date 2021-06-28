%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 3-7: Response of An Undamped SDOF at Beating Frequency (Harmonic Loading)

clear; close all; clc;
%% Parameters
f       = 2.0;       % Frequency, Hz
ff      = 2.08;
omega   = 2*pi*f;    % Frequency
p       = 2*pi*ff;
vstatic = 1;
beta    = p/omega;

t       = 0:0.01:14; % Time vector

y = (vstatic/(1-beta^2))*(sin(p*t)-beta*sin(omega*t));

DeltaOmega = (omega-p)/2;
wr = omega/DeltaOmega;
yy = (0.5*vstatic*wr).*sin(DeltaOmega*t).*cos(omega*t); % Dot product

%% Plot
figure(1);  set(figure(1), 'Position', [200   100   883   400])
            hold on; grid on; box on;

            plot(t,y,'-k','LineWidth',2);
            plot(t,yy,':k','LineWidth',2);

            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
            xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel('Displacement', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
            legend({'Mehtod 1';'Method 2'},'location','northeast', 'orientation','horizontal')

%% Print
print('EX_3_7','-dpng')

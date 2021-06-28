%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Figure 3-11: Response of An Undamped SDOF at Beating Frequency (Harmonic Loading)

clear; close all; clc;
%% Plot
figure(1);  set(figure(1), 'Position', [100   100   900   600])
%% Subplot 1
            subplot(2,1,1)
            hold on; grid on; box on;

            i = 0;
            for f = [0.2] % 2, 0.2
                i = i+1;

                f0      = 0.4; % 2.2, .4
                w_n     = 2*pi*f;
                w       = 2*pi*f0;
                ystatic = 1;
                beta    = w/w_n;
                t       = 0:0.01:20;   % Time vector

                Scale = 500;
                y     = Scale*(2*f0)/(w^2-w_n^2) .*  sin((w-w_n)*t/2).*sin((w+w_n)*t/2);
                yEnv  = Scale*(2*f0)/(w^2-w_n^2) .*  sin((w-w_n)*t/2);



                plot(t,y,'-k','LineWidth',2); grid on
                plot(t,yEnv,'--r','LineWidth',2); grid on

                set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
                ylabel('Displacement', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
                title(['f_n = ',num2str(f,'%.1f'),' Hz,  f_0 = ',num2str(f0,'%.1f'),' Hz'], 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
                legend('Total response','Envelope','location','north','numcolumns',2,'edgecolor','k')
            end

%% Subplot 2
                subplot(2,1,2)
                hold on; grid on; box on;


                for f = [2] % 2, 0.2
                    i = i+1;

                    f0  = 2.2; % 2.2, .4
                    w_n = 2*pi*f;
                    w   = 2*pi*f0;
                    ystatic= 1;
                    beta   = w/w_n;
                    t   = 0:0.01:20;   % Set the time vector

                    Scale = 500;
                    y     = Scale*(2*f0)/(w^2-w_n^2) .*  sin((w-w_n)*t/2).*sin((w+w_n)*t/2);
                    yEnv  = Scale*(2*f0)/(w^2-w_n^2) .*  sin((w-w_n)*t/2);

                    plot(t,y,'-k','LineWidth',2); grid on
                    plot(t,yEnv,'--r','LineWidth',2); grid on

                    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
                    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
                    ylabel('Displacement', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
                    title(['f_n = ',num2str(f,'%.1f'),' Hz,  f_0 = ',num2str(f0,'%.1f'),' Hz'], 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
                    legend('Total response','Envelope','location','north','numcolumns',2,'edgecolor','k')
                end

%% Print
print('FIG_3_11','-dpng')

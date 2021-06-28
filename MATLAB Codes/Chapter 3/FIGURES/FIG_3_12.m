%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Figure 3-12: Response of An Undamped SDOF at Different Frequencies (Harmonic Loading)

clear; close all; clc;
%% Calculate and Plot The Reseponse
figure(1);  set(figure(1), 'Position', [100   100   900   600])
i = 0;
for f = [2.06, 2.04, 2.02, 2.000000001]
    i = i+1;
    
    ff      = 2.00;
    w_n     = 2*pi*f;
    w       = 2*pi*ff;
    ystatic = 1;
    beta    = w/w_n;
    t       = 0:0.01:50;   % Time vector
    y       =(ystatic/(1-beta^2))*(sin(w*t)-beta*sin(w_n*t));
    
    DeltaOmega = (w_n-w)/2;
    wr      = w_n/DeltaOmega;
        
    subplot(4,1,i)
        plot(t,y,'-k','LineWidth',2); grid on
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        ylabel('Displ.', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        title(['\beta = ',num2str(beta,'%.3f')], 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

    if i==4
        xlabel('Time [s]', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
    end
end

%% Print
print('FIG_3_12','-dpng')

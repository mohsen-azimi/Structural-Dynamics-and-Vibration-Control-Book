%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 3-14: Response of a Damped SDOF with Unbalanced mass

clear; close all; clc
%% Calculate the response and plot
    Legend   = {'\zeta = 0.05';'\zeta = 0.10';'\zeta = 0.25';'\zeta = 0.50';'\zeta = 1.00';'\zeta = 1.25';'\zeta = 1.50'};
    LineType = {'-k';          '--k';         '-.k';         ':k';          '-k';          '--k';         '-.k';':k';};

r = [0:0.01:3]; % Frequency ratios

figure(1);  set(figure(1), 'Position', [200   100   883   400])
            hold on; grid on; box on;
            
i = 0;
for zeta = [0.05,0.1,0.15,0.25,0.5,1,1.25,1.5]
    
    i = i+1;
    G = (r.^2)./sqrt((1-r.^2).^2+(2*zeta*r).^2);

    plot(r,G,LineType{i},'LineWidth',i/3);
end

    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    xlabel('\beta', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('\itu_{max}', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    legend(Legend)
    
%% Print
print('EX_3_14','-dpng')

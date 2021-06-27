%% Example 3-10: Response Modification Factor for a SDOF with Different Damping Ratios

clear; close all; clc;
%% Calculate and Plot
beta = 0.0:0.01:3.0;
    Legend   = {'\zeta = 0.001';'\zeta = 0.100';'\zeta = 0.200';'\zeta = 0.700';'\zeta = 1.000'};
    LineType = {'-k';           '--k';          '-.k';          ':k';           '-k'};
    
i = 0;
for zeta = [0.001, 0.1, 0.2, 0.7, 1.0]
    i = i+1;
    denom1 = (1-beta.*beta).^ 2;
    denom2 = (2*zeta*beta) .^ 2;
    denom  = sqrt(denom1+denom2);

    Rd = 1./denom;

    figure(1);  set(figure(1), 'Position', [200   100   883   400])
                hold on; grid on; box on;
                plot(beta,Rd,LineType{i},'LineWidth',i/2,'Color',[0 0 0]);
end

%% Plot settings
            axis([0 3 0 6]); %set xy limits for the plot
            legend(Legend)
            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
            xlabel('\beta', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel('R_d', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
print('EX_3_10','-dpng')

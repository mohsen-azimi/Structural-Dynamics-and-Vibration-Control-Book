%% Figure 3-17: Response Modification Factor and Phase Angle for Different Damping Ratios

clear; close all; clc;
%% Parameters
beta1  = 0.0:0.01:.99;
beta2  = 1.01:0.01:3.0;

Legend = {'\zeta = 0.001';'\zeta = 0.100';'\zeta = 0.200';'\zeta = 0.700';'\zeta = 1.000'};
Lines  = {'-k';           '--k';          '-.k';          ':k';           '-k';          };

%% Calculate the Response and Plot
i = 0;
for zeta = [0.001, 0.1, 0.2, 0.7, 1.0]
    i = i+1;
    z = zeta;
    Rd = [1./sqrt((1-beta1.*beta1).^ 2+(2*zeta*beta1).^ 2),...
          1./sqrt((1-beta2.*beta2).^ 2+(2*zeta*beta2).^ 2)];

    phi = [atand(2*zeta.*beta1./(1-beta1.*beta1)),...
           atand(2*zeta.*beta2./(1-beta2.*beta2))+180];

   
figure(1);  set(figure(1), 'Position', [200   100   883   400])
            subplot(1,2,2); hold on; grid on; box on;
                plot([beta1 beta2],Rd,Lines{i},'LineWidth',i/2,'Color',[0 0 0]); axis([0 3 0 6]); 
                
                legend(Legend)
                set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
                xlabel('\beta', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
                ylabel('R_d', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
            .............................................................
            subplot(1,2,1); hold on; grid on; box on;
                plot([beta1 beta2],phi,Lines{i},'LineWidth',i/2,'Color',[0 0 0]);
                
                set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
                xlabel('\beta', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
                ylabel('\phi', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
end
%
%% Print
print('FIG_3_17','-dpng')

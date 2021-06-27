%% Example 3-18: Response of a SDOF to the base harmonic excitation

clear; close all; clc
%%
% zeta = [0.05, 0.1, 0.15, 0.25, 0.5, 1.25, 1.5]; % damping factors

r = [0:0.01:3]; %frequency ratio
i = 0;


figure(1)
set(figure(1), 'Position', [200   100   883   300])
    LineType = {'-';'--';'-.';':';'-';'--';'-.';':'};

for zeta = [0.05, 0.1, 0.15, 0.25, 0.5, 1.25, 1.5]
    i = i+1;
    
    G(i,:)  = sqrt((1+(2*zeta*r).^2)./((1-r.^2).^2+(2*zeta*r).^2));
    subplot(1,2,1)
      hold on; grid on; box on;
      plt = plot(r, G(i,:));
      set(plt,'LineStyle',LineType{i}, 'LineWidth',i/3, 'DisplayName',['\zeta = ',num2str(zeta,'%1.2f')],'Color',[0 0 0]);
     
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        xlabel('\omega/\omega_n', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('|x (i\omega)|/A', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
legend('show')

............................................................
    phi(i,:)= atan2(2*zeta*r.^3,1-r.^2+(2*zeta*r).^2);
    subplot(1,2,2)
      hold on; grid on; box on;
      plt = plot(r, phi(i,:));
      set(plt,'LineStyle',LineType{i}, 'LineWidth',i/3, 'DisplayName',['\zeta = ',num2str(zeta,'%1.2f')],'Color',[0 0 0]);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        xlabel('\omega/\omega_n', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('\phi (\omega)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
legend('show')

end


print('EX_3_18','-dpng')

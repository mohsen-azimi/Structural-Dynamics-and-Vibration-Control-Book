%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 3.18: Plot Response of An SDOF to Base Excitation

clear; close all; clc
%% Calculate and Plot The Response

beta = [0:0.01:3]; % Frequency Ratio
i = 0;


figure(1)
set(figure(1), 'Position', [200   100   883   300])
    LineType = {'-';'--';'-.';':';'-';'--';'-.';':'};

for zeta = [0.05, 0.1, 0.15, 0.25, 0.5, 1.25, 1.5]
    i = i+1;
    
    G(i,:)  = sqrt((1+(2*zeta*beta).^2)./((1-beta.^2).^2+(2*zeta*beta).^2));
    subplot(1,2,2)
        hold on; grid on; box on;
        plt = plot(beta, G(i,:));
        set(plt,'LineStyle',LineType{i}, 'LineWidth',i/3, 'DisplayName',['\zeta = ',num2str(zeta,'%1.2f')],'Color',[0 0 0]);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel('\omega/\omega_n', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('|x (i\omega)|/A', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        legend('show')

............................................................
    phi(i,:)= atan2(2*zeta*beta.^3,1-beta.^2+(2*zeta*beta).^2);
    subplot(1,2,1)
        hold on; grid on; box on;
        plt = plot(beta, phi(i,:));
        set(plt,'LineStyle',LineType{i}, 'LineWidth',i/3, 'DisplayName',['\zeta = ',num2str(zeta,'%1.2f')],'Color',[0 0 0]);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel('\omega/\omega_n', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('\phi (\omega)', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        legend('show')

end

%% Print
print('EX_3_18','-dpng')

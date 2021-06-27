%% Example 3-19: Base-isolation from vibrating system

clear; close all; clc
%%

f0 = 1.5:0.01:3.0;
% zeta = [0.02, 0.04, 0.06, 0.08, 0.10];
%
beta = f0./3.0;
%
%
i = 0;

figure(1)
set(figure(1), 'Position', [200   100   400   300])
    LineType = {'-';'--';'-.';':';'-';'--';'-.';':'};

for zeta = [0.02, 0.04, 0.06, 0.08, 0.10]
    i = i+1;
Rd(i,:)=1./(((1-beta.*beta).^2)+((2*zeta*beta).^2));

maxAcc(i,:)=0.15.*Rd(i,:).*beta.^2;

      hold on; grid on; box on;
      plt = plot(f0,maxAcc(i,:));
      set(plt,'LineStyle',LineType{i}, 'LineWidth',i/3, 'DisplayName',['\zeta = ',num2str(zeta,'%1.2f')],'Color',[0 0 0]);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        xlabel('Dancing frequency (Hz)', 'fontsize',11, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('Max. accel. (in/s^2)', 'fontsize',11, 'fontname','Times New Roman','FontWeight','Bold')
legend('show','location','northwest')

      
end


print('EX_3_19','-dpng')


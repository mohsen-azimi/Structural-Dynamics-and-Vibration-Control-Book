%% Example 6-24: Response of an undamped 2DOF shear frame using 'impulse'

clear; close all; clc
%%
t   = 0:0.1:10;
num = [0 0 1];

den =[[1 0.2 1]    % den1
      [1 0.4 1]    % den2
      [1 0.6 1]    % den3
      [1 0.8 1]    % den4
      [1 1.0 1]    % den5
      [1 1.2 1]    % den6
      [1 1.4 1]    % den7
      [1 1.6 1]    % den8
      [1 1.8 1]    % den9
      [1 2.0 1]];  % den10

%% Plot
Legend   = {'\zeta = 0.1';'\zeta = 0.3';'\zeta = 0.5';'\zeta = 0.7';'\zeta = 1.0';'\zeta = 1.0';'\zeta = 1.0';'\zeta = 1.0';'\zeta = 1.0';'\zeta = 1.0'};
LineType = {'-k';'--k';'-.k';':k';'-k';'--k';'-.k';':k';'-k';'--k';'-.k';':k';};

figure(1)
    set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;
    
for i = 1:10
    x = impulse(num,den(i,:),t);
    plot(t,x,LineType{i},'LineWidth',i/4);
end

set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
xlabel('Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
ylabel('Amplitude', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
% title('Impulse-response curve for G(s) = 1/[s^2+2(zeta)s+1]', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

legend(Legend)
%% Save
print('EX_6_24','-dpng')
%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-24: Response of a two-DOF System using 'impulse'
    
clc; clear; close all;
%% Syatem Parameters
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

%% Calculate and Plot The Response
Legend   = {'\zeta = 0.1';'\zeta = 0.3';'\zeta = 0.5';'\zeta = 0.7';'\zeta = 1.0';'\zeta = 1.0';'\zeta = 1.0';'\zeta = 1.0';'\zeta = 1.0';'\zeta = 1.0'};
LineType = {'-k';'--k';'-.k';':k';'-k';'--k';'-.k';':k';'-k';'--k';'-.k';':k';};

figure(1); set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;
    
for i = 1:10
    x = impulse(num,den(i,:),t);
    plot(t,x,LineType{i},'LineWidth',i/4);
end


set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
ylabel('Amplitude', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

legend(Legend)

%% Print
 print('EX_6_24','-dpng')







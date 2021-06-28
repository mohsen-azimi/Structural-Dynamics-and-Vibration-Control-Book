%% Example 6-10: Solving coupled differential equations

clear; close all; clc
%% Solve coupled differential equation using RK method
tspan = [0:.01:20];

% Initial conditions( displacements and velocities)
y0 = [1.0;0.0;0.0;0.0];

% Use RK method of order 4 and 5 combined
[t,y] = ode45('dfunc1',tspan,y0);

%% Plot
figure(1)
set(figure(1), 'Position', [1   200   1600   250])

    subplot(1,2,1)
    hold on; grid on; box on;
        plot(t,y(:,1),'k','LineWidth',2);
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        xlabel({'Time (s)'}, 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('{\itx}_1', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        ylim([-1 1])
... ......................................................................
    subplot(1,2,2)
    hold on; grid on; box on;
        plot(t,y(:,3),'k','LineWidth',2);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        xlabel({'Time (s)'}, 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('{\itx}_2', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        ylim([-1 1])
%%
print('EX_6_10','-dpng')






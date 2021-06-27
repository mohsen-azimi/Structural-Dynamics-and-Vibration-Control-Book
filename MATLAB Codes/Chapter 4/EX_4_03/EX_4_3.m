%% Example 4-3: Response of a simply supported beam under triangular dynamic load

clear; close all; clc
%%
tspan  = linspace(0,1,10000);
[t, v] = ode45(@f_DLSDOFP, tspan, [0 0]', []);

%%
figure(1)
set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;
    plot(t,v(:,1),'-k','LineWidth',2);

set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
xlabel('Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
ylabel('Displacement (in)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

%
% Display maximum value of displacement response
    X=xlim; Y=ylim;
    text(X(2)/2,Y(2)/1.3,['Max. value = ',num2str(max(v(:,1)),'%1.2f')],...
        'HorizontalAlignment','center','fontsize',10,...
        'fontname','Times New Roman','FontWeight','Bold',...
        'EdgeColor','k','BackgroundColor','w','LineWidth',1)


%%
print('EX_4_3','-dpng')

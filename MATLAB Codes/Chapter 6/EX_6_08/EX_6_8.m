%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-8: Two-DOF Hanged Double Pendulum Using ODE113

clc; clear; close all;
%% Parameters

tspan  = [0 10];
y0     = [0.5233;0;0.5233;0];
options= odeset('mass','M(t,y)');
[t,y]  = ode113('f_ind_ode', tspan, y0, options);

%%
figure(1); set(figure(1), 'Position', [1   200   1600   250])

    subplot(1,2,1)
    hold on; grid on; box on;
        plot(t,y(:,1),'k','LineWidth',2);
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        ylabel('\theta_1', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        xlabel({'Time [s]'}, 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylim([-1 1])
... ......................................................................
    subplot(1,2,2)
    hold on; grid on; box on;
        plot(t,y(:,3),'k','LineWidth',2);
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel({'Time [s]'}, 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('\theta_2', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylim([-1 1])
%% Print
print('EX_6_8','-dpng')

%% Put Subplots Closer
SF = 0.15;
a = 1; b = 2;
......................................................
for i = 1:a*b
    h = subplot(a,b,i); % Get handle to subplot #i.
    if i ~= 1; set(h,'YTickLabel',[]); end

    pos1 = get(h, 'Position');
    pos2 = [pos1(1)-SF/2*pos1(1),  pos1(2),   pos1(3)*(1+SF),   pos1(4)];
    
    set(h, 'Position', pos2);
end




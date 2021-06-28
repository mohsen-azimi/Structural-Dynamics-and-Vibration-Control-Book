%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-17: Response of a two-DOF System under Harmonic Loading-2
... (Coupled Differential Equation)
    
clc; clear; close all;
%% Parameters
tspan = [0:.01:20];
y0 = [0.2; 1.0; 0.0; 0.0]; % Initial State

%% 
[t,y] = ode45('f_dFcn',tspan,y0);  % Use RK Method, order 4 and 5 combined

%% Plot
figure(1); set(figure(1), 'Position', [1   200   1600   250])

    subplot(1,2,1)
    hold on; grid on; box on;
        plot(t,y(:,1),'k','LineWidth',2);
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel({'Time [s]'}, 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('{\itx}_1', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
                ylim([-.4 .4])

... ......................................................................
    subplot(1,2,2)
    hold on; grid on; box on;
        plot(t,y(:,3),'k','LineWidth',2);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel({'Time [s]'}, 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('{\itx}_2', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylim([-.4 .4])

%% Print
print('EX_6_17','-dpng')

%% Make Subplots Bigger
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







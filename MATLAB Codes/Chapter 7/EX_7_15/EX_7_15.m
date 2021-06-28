%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 7-15: Forced Vibration Response of a 3-story frame, Using RK Method
    
clc; clear; close all;
%% Parameters
tspan = [0:.01:10];
y0    = [0;0;0;0;0;0];            % Initial State
[t,y] = ode45('f_dFcn',tspan,y0);

%% Plot Displacement Response
figure(1); 
set(figure(1), 'Position', [100   100   1000   600])

subplot(3,1,1)
    plot(t,y(:,1),'k','LineWidth',2);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    ylabel('{\itx}_1 ({\itt})', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
%% Plot Velocity Response
subplot(3,1,2)
    plot(t,y(:,3),'--k','LineWidth',2);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    ylabel('{\itx}_2 ({\itt})', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Plot Acceleration Response
subplot(3,1,3)
    plot(t,y(:,5),':k','LineWidth',2);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    xlabel({'Time [s]'}, 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('{\itx}_3 ({\itt})', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
print('EX_7_15','-dpng')


%% Make Subplots Bigger
SF = 0.12;
a = 3; b = 1;
......................................................
for i = 1:a*b
    h = subplot(a,b,i); % Get handle to subplot #i.
    if i ~= a*b; set(h,'YTickLabel',[]); end

    pos1 = get(h, 'Position');
    pos2 = [pos1(1)-SF*pos1(1),  pos1(2),   pos1(3)*(1+SF),   pos1(4)*(1+SF)];
    
    set(h, 'Position', pos2);
end



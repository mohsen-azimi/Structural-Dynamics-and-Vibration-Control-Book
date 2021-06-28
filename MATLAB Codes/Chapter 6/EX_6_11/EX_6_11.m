%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-11: Response of a two-DOF System 
... (Beating)

clc; clear; close all;
%%

t = [0:.01:30];
x1 = 1/2 * (cos(1.304*t) + cos(1.517*t));
x2 = 1/2 * (cos(1.304*t) - cos(1.517*t));


%%
figure(1); set(figure(1), 'Position', [1   200   1600   250])

    subplot(1,2,1)
    hold on; grid on; box on;
        plot(t,x1,'k','LineWidth',2);
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel({'Time [s]'}, 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('{\itx}_1', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylim([-1 1])
... ......................................................................
    subplot(1,2,2)
    hold on; grid on; box on;
        plot(t,x2,'k','LineWidth',2);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel({'Time [s]'}, 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('{\itx}_2', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylim([-1 1])
%%
print('EX_6_11','-dpng')


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





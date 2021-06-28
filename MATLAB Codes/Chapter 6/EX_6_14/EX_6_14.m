%% Example 6-14: Response of 2DOF gears system under torsional loading

clear; close all; clc;
%%
M0 = 1;   % amplitude of the moment
L  = 1;   % length of shaft
GJ = 1;   % torsional stiffness
n  = 3;   % gear ratio
r  = [0:0.01:3]; % frequency ratio
thetab = (M0*L*n)./(GJ*(1+(n.^n))*(1-r.^2)); % amplitude

%% Plot
figure(1)
set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;
plot1=plot(r,thetab);

    set(plot1(1),'LineStyle','-','LineWidth',2,'Color',[0 0 0]);

    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
%     title('Response to torque', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
    xlabel('\omega/\omega_n', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('\theta_b', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

%% make subplots closer
SF = 0.15;
a = 1; b = 1;
......................................................
for i = 1:a*b
    h = figure(1);%subplot(a,b,i); % Get handle to subplot #i.
%     if i ~= 1; set(h,'YTickLabel',[]); end
    pos1 = get(h, 'Position');
    pos2 = [pos1(1)-SF/2*pos1(1),  pos1(2),   pos1(3)*(1+SF),   pos1(4)];
    
    set(h, 'Position', pos2);
end


%% Save
print('EX_6_15','-dpng')

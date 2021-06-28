%% Example 6-7: Identification and Response of 2DOF Hanged Bar

clear; clf; close all; clc;
%% Eigen values and the eigen vectors. 
l1 = 1; 
l2 = 1; 
m2 = 5; 
g  = 9.81; 
w2 = m2*g; 
M  = [m2*l1^2     (m2*l1*l2)/2
     (m2*l1*l2)/2 (m2*l1^2)/3 ]; 
K  = [l1*w2           0
      0       (w2*l2)/2]; 
[phi,~] = eig(K,M);
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tspan = [0 30]; 
y0 = [0.5233;  0; 1.0467; 0];      % Arbitrary Initial condition 
x01 = [phi(1,1); 0; phi(2,1); 0];  % Low Frequency mode initial Condition 
x02 = [phi(1,2); 0; phi(2,2); 0];  % High frequency mode initial Condition 
options = odeset('mass','M(t,y)');

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1)
set(figure(1), 'Position', [100   100   800   600])

    [t,x02]=ode113('indmot_ode',tspan,x02,options); 
    
    subplot(2,1,1)
    hold on; grid on; box on;
        plot(t,x02(:,1),'k','LineWidth',2);
        
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        ylabel('\phi', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        title('High frequency mode initial condition', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
... ......................................................................
    subplot(2,1,2)
    hold on; grid on; box on;
        plot(t,x02(:,3),'k','LineWidth',2);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        xlabel({'Time (s)'}, 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('\theta', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
print('EX_06_07_a','-dpng')
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2)
set(figure(2), 'Position', [100   100   800   600])

    [t,x01]=ode113('indmot_ode',tspan,x01,options); 
    
    subplot(2,1,1)
    hold on; grid on; box on;
        plot(t,x01(:,1),'k','LineWidth',2);
        
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        ylabel('\phi', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        title('Low frequency mode initial condition', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
... ......................................................................
    subplot(2,1,2)
    hold on; grid on; box on;
        plot(t,x01(:,3),'k','LineWidth',2);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        xlabel({'Time (s)'}, 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('\theta', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

print('EX_06_07_b','-dpng')
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3)
set(figure(3), 'Position', [100   100   800   600])

    [t,y0]=ode113('indmot_ode',tspan,y0,options); 
    
    subplot(2,1,1)
    hold on; grid on; box on;
        plot(t,y0(:,1),'k','LineWidth',2);
        
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        ylabel('\phi', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        title('Arbitrary initial condition', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
... ......................................................................
    subplot(2,1,2)
    hold on; grid on; box on;
        plot(t,y0(:,3),'k','LineWidth',2);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        xlabel({'Time (s)'}, 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('\theta', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')


print('EX_06_07_c','-dpng')










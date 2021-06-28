%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-7: Two-DOF Hanged Bar System 

clc; clear; close all;
%% 
% Find The Eigen Values & Vectors. 
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tspan = [0 30]; 
y0  = [0.5233;  0; 1.0467; 0];     % Initial State (Arbitrary)
x01 = [phi(1,1); 0; phi(2,1); 0];  % Initial State (Low Frequency Mode)
x02 = [phi(1,2); 0; phi(2,2); 0];  % Initial State (High frequency Mode)  
options = odeset('mass','M(t,y)');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1); set(figure(1), 'Position', [100   100   800   600])

    [t,x02]=ode113('f_ind_ode',tspan,x02,options); 
    
    subplot(2,1,1)
    hold on; grid on; box on;
        plot(t,x02(:,1),'k','LineWidth',2);
        
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        ylabel('\phi', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        title('High Freq. Mode Initial State', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
... ......................................................................
    subplot(2,1,2)
    hold on; grid on; box on;
        plot(t,x02(:,3),'k','LineWidth',2);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel({'Time [s]'}, 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('\theta', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
print('EX_6_7 a','-dpng')
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(2); set(figure(2), 'Position', [100   100   800   600])

    [t,x01]=ode113('f_ind_ode',tspan,x01,options); 
    
    subplot(2,1,1)
    hold on; grid on; box on;
        plot(t,x01(:,1),'k','LineWidth',2);
        
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        ylabel('\phi', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        title('Low Freq. Mode Initial State', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
... ......................................................................
    subplot(2,1,2)
    hold on; grid on; box on;
        plot(t,x01(:,3),'k','LineWidth',2);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel({'Time [s]'}, 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('\theta', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

print('EX_6_7 b','-dpng')
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(3); set(figure(3), 'Position', [100   100   800   600])

    [t,y0]=ode113('f_ind_ode',tspan,y0,options); 
    
    subplot(2,1,1)
    hold on; grid on; box on;
        plot(t,y0(:,1),'k','LineWidth',2);
        
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        ylabel('\phi', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        title('Arbitrary Initial State', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
... ......................................................................
    subplot(2,1,2)
    hold on; grid on; box on;
        plot(t,y0(:,3),'k','LineWidth',2);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel({'Time [s]'}, 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('\theta', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
print('EX_6_7 c','-dpng')


%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-9: Response of a two-DOF Disks System to Initial Excitations

clc; clear; close all;

%% Parameters
I = 1;              % inertia
k = 1;              % = GJ/L stiffness
M = I*[1 0;0 1];    % mass
K = k*[2 -1;-1 1];  %stiffness
[u,W] = eig(K,M);   % Eigenvalue Problem
                    % W = Eigenvalues
                    
u(:,1) = u(:,1)/max(u(:,1));    % Normalization
u(:,2) = u(:,2)/max(u(:,2));
[w(1),I1] = min(max(W));        % Relabeling
[w(2),I2] = max(max(W));
w(1) = sqrt(w(1));              % Lowest Natural freq.
w(2) = sqrt(w(2));              % Highest Natural freq.
U(:,1) = u(:,I1);               % Relabelling
U(:,2) = u(:,I2);
x0 = [0;2];                     % Initial displacement
v0 = [2*sqrt(k/I);0];           % Initial velocity
t  = [0:0.1:20];                % Time span

% Displacements
x1 = (((U(2,2)*x0(1)-U(1,2)*x0(2))*cos(w(1)*t)+(U(2,2)*v0(1)-U(1,2)*v0(2))*sin(w(1)*t)/w(1))*U(1,1)+((U(1,1)*x0(2)-U(2,1)*x0(1))*cos(w(2)*t)+(U(1,1)*v0(2)-U(2,1)*v0(1))*sin(w(2)*t)/w(2))*U(1,2))/det(U);
x2 = (((U(2,2)*x0(1)-U(1,2)*x0(2))*cos(w(1)*t)+(U(2,2)*v0(1)-U(1,2)*v0(2))*sin(w(1)*t)/w(1))*U(2,1)+((U(1,1)*x0(2)-U(2,1)*x0(1))*cos(w(2)*t)+(U(1,1)*v0(2)-U(2,1)*v0(1))*sin(w(2)*t)/w(2))*U(2,2))/det(U);

%% Plot 
figure(1); set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;
    plot1 = plot(t,x1,t,x2);

    set(plot1(1),'LineStyle','--','DisplayName','\theta_{1}(t)','LineWidth',2,'Color',[0 0 0]);
    set(plot1(2),'LineStyle','-','DisplayName','\theta_{2}(t)','LineWidth',2,'Color',[0 0 0]);

    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('\theta_1({\itt}), \theta_2({\itt})', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    legend('show')
    
%% Print    
print('EX_6_9','-dpng')







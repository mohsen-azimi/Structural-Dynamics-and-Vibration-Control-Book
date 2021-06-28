%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-13: Response of a two-DOF Disks

clc; clear; close all;
%%
I = 1;              % Mass
k = 1;              % Torsional Stiffness (= GJ/L)
M = I*[1 0;0 1];    % Mass Matrix
K = k*[2 -1;-1 1];  % Stiffness Matrix

%%
[u,W] = eig(K,M);   % Eigenvalue 
                    % W =  Eigenvalues
                    
u(:,1) = u(:,1)/max(u(:,1));    % normalization
u(:,2) = u(:,2)/max(u(:,2));

[w(1),I1] = min(max(W));        % Relabeling 
[w(2),I2] = max(max(W));

w(1) = sqrt(w(1));  % Lowest wn
w(2) = sqrt(w(2));  % Highest wn

U(:,1) = u(:,I1);   % Relabelling 
U(:,2) = u(:,I2);

m1 = U(:,1)'*M*U(:,1);          % Mass Quantities
m2 = U(:,2)'*M*U(:,2);

T = 0.01;           % Sampling Period
N = 2000;           % Sampling Times
M2 = 1;             % Second Disk Torque Amplitude

alpha = 1;
n = [1:N];

N1 = U(:,1)'*[zeros(1,N);M2*exp(-alpha*n*T)]; % Modal Forces
N2 = U(:,2)'*[zeros(1,N);M2*exp(-alpha*n*T)];

g1 = T*sin((n-1)*w(1)*T)/(m1*w(1));      % Discrete Time Impulse Responses
g2 = T*sin((n-1)*w(2)*T)/(m2*w(2));

c1 = conv(N1,g1);   % Convolution Sum
c2 = conv(N2,g2);

theta = U(:,1)*c1(1:N)+U(:,2)*c2(1:N);        % N Samples for Plotting
n = [0:N-1];

%% Plot 
figure(1); set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;
    plot1  =  plot(n,theta(1,:),n,theta(2,:));

    set(plot1(1),'LineStyle','--','DisplayName','\theta_{1}(n)','LineWidth',2,'Color',[0 0 0]);
    set(plot1(2),'LineStyle','-','DisplayName','\theta_{2}(n)','LineWidth',2,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    xlabel('\itn', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('\theta_1({\itn}), \theta_2({\itn})', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

    legend('show')


%% Print
print('EX_6_13','-dpng')


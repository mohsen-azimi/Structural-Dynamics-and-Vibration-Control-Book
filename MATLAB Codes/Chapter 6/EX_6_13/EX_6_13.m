%% Example 6-13: Response of 2DOF disks system under harmonic loading

clear; close all; clc;
%%
I = 1;              % mass
k = 1;              % torsional stiffness (= GJ/L)
M = I*[1 0;0 1];    % mass matrix
K = k*[2 -1;-1 1];  %stiffness matrix
[u,W] = eig(K,M);   % eigenvalue problem
                    % W =  eigenvalues
u(:,1) = u(:,1)/max(u(:,1));    % normalization
u(:,2) = u(:,2)/max(u(:,2));
[w(1),I1] = min(max(W));        % relabeling of the eigenvalues
[w(2),I2] = max(max(W));
w(1) = sqrt(w(1));  % Lowest natural frequency
w(2) = sqrt(w(2));  % highest natural frequency
U(:,1) = u(:,I1);   % relabelling of the eigenvectors
U(:,2) = u(:,I2);
m1 = U(:,1)'*M*U(:,1);          % mass quantities
m2 = U(:,2)'*M*U(:,2);
T = 0.01;           % sampling period
N = 2000;           % sampling times
M2 = 1;             % second disk torque amplitude
alpha = 1;
n = [1:N];
N1 = U(:,1)'*[zeros(1,N);M2*exp(-alpha*n*T)]; % modal forces
N2 = U(:,2)'*[zeros(1,N);M2*exp(-alpha*n*T)];
g1 = T*sin((n-1)*w(1)*T)/(m1*w(1));           % discrete time impulse responses
g2 = T*sin((n-1)*w(2)*T)/(m2*w(2));
c1 = conv(N1,g1);   % convolution sum
c2 = conv(N2,g2);
theta = U(:,1)*c1(1:N)+U(:,2)*c2(1:N);        % N samples for plotting
n = [0:N-1];

%%
figure(1)
set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;
    plot1  =  plot(n,theta(1,:),n,theta(2,:));

    set(plot1(1),'LineStyle','--','DisplayName','\theta_{1}(n)','LineWidth',2,'Color',[0 0 0]);
    set(plot1(2),'LineStyle','-','DisplayName','\theta_{2}(n)','LineWidth',2,'Color',[0 0 0]);

    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
%     title('Response by the Convolution Sum', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
    xlabel('\itn', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('\theta_1({\itn}), \theta_2({\itn})', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

    legend('show')

print('EX_6_13','-dpng')

     %% make subplots closer
SF = 0.1;
a = 1; b = 1;
......................................................
for i = 1:a*b
    h = subplot(a,b,i); % Get handle to subplot #i.
%     if i ~= 1; set(h,'YTickLabel',[]); end

    pos1 = get(h, 'Position');
    pos2 = [pos1(1)-SF/2*pos1(1),  pos1(2),   pos1(3)*(1+SF),   pos1(4)];
    
    set(h, 'Position', pos2);
end



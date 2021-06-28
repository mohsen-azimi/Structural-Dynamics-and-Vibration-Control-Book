%% Example 6-9: Response of a 2SOF to initial excitations
clear; close all; clc;
%%
clf
I = 1;                          % inertia
k = 1;                          % = GJ/L stiffness
M = I*[1 0;0 1];                % mass
K = k*[2 -1;-1 1];              %stiffness
[u,W] = eig(K,M);               % eigenvalue problem
                                % W = matrix of eigenvalues
u(:,1) = u(:,1)/max(u(:,1));    % normalization
u(:,2) = u(:,2)/max(u(:,2));
[w(1),I1] = min(max(W));        % relabeling
[w(2),I2] = max(max(W));
w(1) = sqrt(w(1));              % lowest natural frequency
w(2) = sqrt(w(2));              % highest natural frequency
U(:,1) = u(:,I1);               % relabelling
U(:,2) = u(:,I2);
x0 = [0;2];                     % Initial displacement
v0 = [2*sqrt(k/I);0];           % initial velocity
t  = [0:0.1:20];                 % initial time, time increment, final time

% displacement
x1 = (((U(2,2)*x0(1)-U(1,2)*x0(2))*cos(w(1)*t)+(U(2,2)*v0(1)-U(1,2)*v0(2))*sin(w(1)*t)/w(1))*U(1,1)+((U(1,1)*x0(2)-U(2,1)*x0(1))*cos(w(2)*t)+(U(1,1)*v0(2)-U(2,1)*v0(1))*sin(w(2)*t)/w(2))*U(1,2))/det(U);
x2 = (((U(2,2)*x0(1)-U(1,2)*x0(2))*cos(w(1)*t)+(U(2,2)*v0(1)-U(1,2)*v0(2))*sin(w(1)*t)/w(1))*U(2,1)+((U(1,1)*x0(2)-U(2,1)*x0(1))*cos(w(2)*t)+(U(1,1)*v0(2)-U(2,1)*v0(1))*sin(w(2)*t)/w(2))*U(2,2))/det(U);

%%
figure(1)
set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;
plot1 = plot(t,x1,t,x2);

    set(plot1(1),'LineStyle','--','DisplayName','\theta_{1}(t)','LineWidth',2,'Color',[0 0 0]);
    set(plot1(2),'LineStyle','-','DisplayName','\theta_{2}(t)','LineWidth',2,'Color',[0 0 0]);

    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
    xlabel('Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('\theta_1({\itt}), \theta_2({\itt})', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

    legend('show')
   
%% make subplots closer
SF = 0.1;
a = 1; b = 1;
......................................................
for i = 1:a*b
    h = subplot(a,b,i); % Get handle to subplot #i.
    if i ~= 1; set(h,'YTickLabel',[]); end

    pos1 = get(h, 'Position');
    pos2 = [pos1(1)-SF/2*pos1(1),  pos1(2),   pos1(3)*(1+SF),   pos1(4)];
    
    set(h, 'Position', pos2);
end
    
print('EX_6_9','-dpng')







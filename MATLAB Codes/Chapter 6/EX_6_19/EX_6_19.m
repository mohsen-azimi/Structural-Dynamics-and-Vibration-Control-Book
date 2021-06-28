%% Example 6-19: Response of a damped 2DOF shear frame under rectangular pulse load

clear; close all; clc;
%%
M = [1 0;
    0 2];               % Mass 
C = [1.6 -0.8; -0.8 0.8]; % Damping
K = [5 -4;-4 4];          % Stiffness 
A = [zeros(size(M)) eye(size(M));-inv(M)*K -inv(M)*C];
B = [zeros(size(M)); inv(M)];
TO = 4;  % Rise time of Force
N = 600;
T = 0.1; % Sampling Period
NO = TO/T;
phi = eye(size(A))+T*A+T^2*A^2/2+T^3*A^3/6;
gamma = inv(A)*(phi-eye(size(A)))*B;
x(:,1)=zeros(2*length(M),1);
for k=1:N
    if k <= NO+1; f(k) = 1;
    else; f(k) = 0;end
    F(:,k) = [0;1]*f(k); % Force is only applied to mass m
    x(:,k+1) = phi*x(:,k) + gamma*F(:,k);
end
k = [0:N];

%% Plot
figure(1)
set(figure(1), 'Position', [200   100   883   400])
hold on; grid on; box on;

plot(k,x(1,:),'-k','LineWidth',2);


set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)
xlabel('\itn', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
ylabel('{\itx}_1({\itn})', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

%% Save
print('EX_6_19','-dpng')
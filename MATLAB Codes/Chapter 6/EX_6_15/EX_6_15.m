%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-15: Response of a two-DOF System 

clc; clear; close all;
%% Parameters
m = 30;     % Mass
k = 20000;  % Stiffness
c = 150;    % Damping

% 4 x 4 matrices
disp('Mass Matrix: ');
mt = [0, 0,  m,   0;
      0, 0,  0, 2*m;
      m, 0,  0,   0;
      0, 2*m,0,   c]
disp('Stiffness Matrix: ');
kt = [-m,   0,    0,   0;
       0,-2*m,    0,   0;
       0,   0,  3*k,-2*k;
       0,   0, -2*k, 2*k]
Z = inv(mt)*kt;
%% Eigenvalues
[V,D] = eig(Z);
disp('Eigenvalues: ');
V
disp('Initial State: ');
x0 = [0;0;0.005;0]
disp('Integration Constants');
S = inv(V)*x0
tk = linspace(0,2,1001);
%% Time dependent response (x1 = y3 and x2 = y4)

for k = 1:1001
    t = tk(k);
    for i = 3:4
        x(k,i-2) = 0;
        for j = 1:4
            x(k,i-2) = x(k,i-2)+(real(S(j))*real(V(i,j))-imag(S(j))*imag(V(i,j)))*cos(imag(D(j,j))*t);
            x(k,i-2) = x(k,i-2)+(imag(S(j))*real(V(i,j))-real(S(j))*imag(V(i,j)))*sin(imag(V(i,j))*t);
            x(k,i-2) = x(k,i-2)*exp(-real(D(j,j))*t);
        end
    end
end

%% Plot
figure(1); set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;
    plot1 = plot(tk,x(:,1),tk,x(:,2));

    set(plot1(1),'LineStyle','-','DisplayName','{\itx}_{1}(t)','LineWidth',2,'Color',[0 0 0]);
    set(plot1(2),'LineStyle','--','DisplayName','{\itx}_{2}(t)','LineWidth',2,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('{\itx} [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    legend('show')

%% Print
print('EX_6_15','-dpng')
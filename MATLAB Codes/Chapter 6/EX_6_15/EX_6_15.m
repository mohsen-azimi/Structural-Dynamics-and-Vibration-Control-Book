%% Example 6-15: Free vibrartion response of a damped 2DOF system

clear; close all; clc;
%%
m = 30;     % Mass
k = 20000;  % Stiffness
c = 150;    % Damping

% 4 x 4 matrices
disp('4 x 4 Mass matrix');
mt = [0,0,m,0;0,0,0,2*m;m,0,0,0;0,2*m,0,c]
disp('4 x 4 stiffness matrix');
kt = [-m,0,0,0;0,-2*m,0,0;0,0,3*k,-2*k;0,0,-2*k,2*k]
Z = inv(mt)*kt;
[V,D] = eig(Z);
disp('Eigenvalues');
V
disp('Initial conditions');
x0 = [0;0;0.005;0]
disp('Integration constants');
S = inv(V)*x0
tk = linspace(0,2,1001);

% Evaluation of time dependent response
% Recall that x1 = y3 and x2 = y4
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
figure(1)
set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;
    plot1 = plot(tk,x(:,1),tk,x(:,2));

    set(plot1(1),'LineStyle','-','DisplayName','{\itx}_{1}(t)','LineWidth',2,'Color',[0 0 0]);
    set(plot1(2),'LineStyle','--','DisplayName','{\itx}_{2}(t)','LineWidth',2,'Color',[0 0 0]);

    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
    xlabel('Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('{\itx} (m)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

    legend('show')

%% Save
print('EX_6_15','-dpng')
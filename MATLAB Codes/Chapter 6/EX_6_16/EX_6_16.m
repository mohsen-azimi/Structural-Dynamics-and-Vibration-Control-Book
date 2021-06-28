%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-16: Response of a two-DOF System under Harmonic Loading-1

clc; clear; close all;
%% Parameters
syms t tau
m = 25;
k = 12500;
c = 80;
F0 = 60;
alpha = 1.5;

mt = [0,   0, m,   0;
      0,   0, 0, 2*m;
      m,   0, 0,   0;
      0, 2*m, 0,   c];
  
kt = [-m,    0,   0,   0;
       0, -2*m,   0,   0;
       0,    0, 3*k,-2*k;
       0,    0,-2*k, 2*k];

z = inv(mt)*kt;
%% Eigenvalues
[V,D] = eig(z);
L = conj(V)'*mt*V;
for j = 1:4
    ss = 1/sqrt(L(j,j));
    for i = 1:4
        P(i,j) = V(i,j)*ss;
    end
end

F = [0;0;0;F0*exp(-alpha*tau)];
G = P'*F;
G = vpa(G);

% Convolution Integral Solution
for i = 1:4
    f(i) = G(i)*exp(-D(i,i)*(t-tau));
    p(i) = int(f(i),tau,0,t);
end

disp('Solution for Modal Coordinates: ')
p = [p(1);p(2);p(3);p(4)]; disp(p)
y = P*p;
disp('Response: ')
disp('(x1 = y3, x2 = y4)')
y = vpa(y)
%% Calculate and Plot The Response

time = linspace(0,1.5,101);
for k = 1:101
    x1a = subs(y(3),t,time(k));
    x2a = subs(y(4),t,time(k));
    x1b(k) = vpa(real(x1a));
    x2b(k) = vpa(real(x2a));
end
x1 = double(x1b);
x2 = double(x2b);


%%
figure(1); set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;

        plot(time,x1,'-k','LineWidth',2);
        plot(time,x2,':k','LineWidth',2);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('Response [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        legend('{\itx}_1(t)','{\itx}_2(t)')


%% Print
print('EX_6_16','-dpng')
%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 5-4: Constant Acceleration Method

clc; clear; close all;
%% Parameters

ma = 110000;
k = 10075582;
wn = sqrt(k/ma);
r = 0.07;
c = 2.0*r*sqrt(k*ma);
u(1) = 0;
v(1) = 0;
tt = 3;
n  = 300;
n1 = n+1;
dt = tt/n;
td = 0.75;
jk = td/dt;

%% Loading
p = zeros(1, n+1);
jk1 = jk+1;

for n=1:jk1
    t = (n-1)*dt;
    p(n) = 450000*(1-t/td)*exp(-2.0*t/td);
end

an(1) = (p(1)-c*v(1)-k*u(1))/ma;
kh = k+4.0*ma/(dt*dt)+2.0*c/dt;

for i=1:n1
    s(i) = (i-1)*dt;
end

for i=2:n1
    ww = p(i)-p(i-1)+(4.0*ma/dt+2.0*c)*v(i-1)+2.0*ma*an(i-1);
    xx = ww/kh;
    yy = (2/dt)*xx-2.0*v(i-1);
    zz = (4.0/(dt*dt))*(xx-dt*v(i-1))-2.0*an(i-1);
    
    u(i) = u(i-1)+xx;
    v(i) = v(i-1)+yy;
    an(i) = an(i-1)+zz;
end

%% Plot
figure(1); set(figure(1), 'Position', [100   100   800   600])

    subplot(2,2,1); grid on; hold on; box on;
    plot(s,p,'-k','LineWidth',2);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Force [N]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Displacement
    subplot(2,2,2); grid on; hold on; box on;
    plot(s,u,'-k','LineWidth',2);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Displacement [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylim([-.06 0.06])

%% Velocity
    subplot(2,2,3); grid on; hold on; box on;
    plot(s,v,'-k','LineWidth',2);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Velocity [m/s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylim([-.31 0.31])

%% Acceleration
    subplot(2,2,4); grid on; hold on; box on;
    plot(s,an,'-k','LineWidth',2);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Acceleration [m/s^2]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylim([-4 4])

%% Print
    print('EX_5-4','-dpng')





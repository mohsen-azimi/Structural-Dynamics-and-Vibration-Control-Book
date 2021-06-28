%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 5-3: Dynamic Response of SDOF to External Loading, using RK
    
clc; clear; close all;
%% Parameters 
ma = 13608.5;
k  = 17500000;
wn = sqrt(k/ma);
r  = 0.02;
c  = 2.0*r*sqrt(k*ma);
u(1) = 0;
v(1) = 0;
tt   = 0.5;
n  = 50;
n1 = n+1;
dt = tt/n;
td = 0.1;
jk = td/dt;
%% Loading
p = zeros(n1,1); 
p(1:10) = [ 0       ;
            267000.0;
            445000.0;
            364000.0;
            284000.0;
            213000.0;
            142000.0;
            89000.0 ;
            53400.0 ;
            26700.0 ];
an(1) = (p(1)-c*v(1)-k*u(1))/ma;


for i=2:n1
    ui = u(i-1);
    vi = v(i-1);
    ai = an(i-1);
    d(1) = vi;
    q(1) = ai;
    for j=2:3
        l = 0.5;
        x = ui+l*dt*d(j-1);
        d(j) = vi+l*dt*q(j-1);
        q(j) = (p(i)-c*d(j)-k*x)/ma;
    end
    j = 4;
    l = 1;
    x = ui+l*dt*d(j-1);
    d(j) = vi+l*dt*q(j-1);
    q(j) = (p(i)-c*d(j)-k*x)/ma;
    u(i) = u(i-1)+dt*(d(1)+2.0*d(2)+2.0*d(3)+d(4))/6.0;
    v(i) = v(i-1)+dt*(q(1)+2.0*q(2)+2.0*q(3)+q(4))/6.0;
    an(i) = (p(i)-c*v(i)-k*u(i))/ma;
end

for i=1:n1
    s(i) = (i-1)*dt;
end
%% Plot
figure(1); set(figure(1), 'Position', [100   100   800   600])

%% Force
subplot(2,2,1); grid on; box on; hold on
    plot(s,p,'-k','LineWidth',2);
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('Force [N]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        xlim([0 .5])
%% Displacement
subplot(2,2,2); grid on; box on; hold on
    plot(s,u,'-k','LineWidth',2);
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('Displacement [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        xlim([0 .5])
%% Velocity
subplot(2,2,3); grid on; box on; hold on
    plot(s,v,'-k','LineWidth',2);
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('Velocity [m/s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        xlim([0 .5])
%% Acceleration
subplot(2,2,4); grid on; box on; hold on
    plot(s,an,'-k','LineWidth',2);
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('Acceleration [m/s^2]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        xlim([0 .5])
%% Print
 print('EX_5_3','-dpng')






%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 2-3: Plot Displacement, Velocity, and Acceleration Response of an Inverted Pendulum

clear; close all; clc;
%% Parameters
m = 2;          % [kg]
k = 8;          % [N/m]
dt= 0.001;
w = sqrt(k/m);
y = dsolve('D2y=-2^2*y','y(0)=3','Dy(0)=5','x');
simplify(y)

%% Response
for i=1:15000
    t(i) = (i-1)*dt;
    z(i) =  3*cos(w*t(i))     + 5*sin(w*t(i))/w;
    v(i) = -3*w*sin(w*t(i))   + 5*cos(w*t(i));
    a(i) = -3*w^2*cos(w*t(i)) - 5*w*sin(w*t(i));
end
%% Plot Displacement
figure(1); set(figure(1), 'Position', [100   100   800   600])

subplot(3,1,1)
    plot(t,z,'k','LineWidth',2);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    ylabel('Displacement [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    
%% Plot Velocity
subplot(3,1,2)
    plot(t,v,'--k','LineWidth',2);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    ylabel('Velocity [m/s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Plot Acceleration
subplot(3,1,3)
    plot(t,a,':k','LineWidth',2);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    xlabel({'Time [s]'}, 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Acceleration [m/s^{2}]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    
%% Print
   print('EX_2_3','-dpng')
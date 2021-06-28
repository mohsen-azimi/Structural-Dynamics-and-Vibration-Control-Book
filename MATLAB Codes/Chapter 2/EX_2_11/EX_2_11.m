%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 2-11: Plot The Response Envelope Curve

clear; close all; clc;
%% Parameters
v0    = 1;                  % Initial State
vdot0 = 1;                  % Initial State
T     = 1;                  % Period
omega = 2*pi/T;             % Frequency
t     = linspace(0,5,1000); % Time span

%% Calculate The Response & Plot
figure(1); set(figure(1), 'Position', [200   100   883   300])

i = 0;
for zeta  = [0.05, 0.5]
   
    i = i+1;
    omegad= omega*sqrt(1-zeta^2);
    arg1  = exp(-zeta*omega*t);
    
    R   = sqrt(((vdot0+v0*zeta*omega)/omegad)^2 + v0^2);
    phi = atan((vdot0+v0*zeta*omega)/(omegad*v0));
    
    Env = R.*arg1;                  % use dot product
    v   = Env.*cos(omegad*t-phi);   % use dot product

    % Subplots
    subplot(1,2,3-i)
        hold on; grid on; box on;
        plot(t,v,'-k','LineWidth',2);
        plot(t,+Env,':k','LineWidth',2);
        plot(t,-Env,':k','LineWidth',2);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('Displacement [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        legend({'Response';'Env.'},'location','northeast', 'orientation','horizontal')

        Y = ylim; X = xlim;
        text(0.8*X(2), .8*Y(1),['\zeta = ',num2str(zeta)], 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)
end

%% Print
print('EX_2_11','-dpng')
%% Example 3-11: Response of a Damped under Harmoinc Loading-2

clear; close all; clc
%% Parameters
    m    = 6;       % Mass
    k    = 8;       % Stiffness
    wn   = sqrt(k/m);
    c1   = 2;       % Damping coefficient
    u(1) = 0.25;    % Initial conditions - displacement and velocity
    udot(1) = 0.5;

    f = 4;          % Magnitude of harmonic force
    w = 1;          % Excited frequency of the force
    
    beta = w/wn;
    cc   = 2*sqrt(k*m);
    rho  = c1/cc;
    wd   = wn*sqrt(1-rho^2);
    wba  = rho*wn;
    rhoba= rho/sqrt(1-rho^2);
    b0   = 2.0*rho*wn;
    b1   = wd^2-wn^2;
    b2   = 2.0*wba*wd;
    dt   = 0.02;
    
%% Response Calculation
t(1) = 0;
for i = 2:1500
    t(i) = (i-1)*dt;
    
    s = exp(-rho*wn*t(i))*sin(wd*t(i));
    c = exp(-rho*wn*t(i))*cos(wd*t(i));
    
    sdot = -wba*s+wd*c;
    cdot = -wba*c-wd*s;
    sddot= -b1*s-b2*c;
    cddot= -b1*c+b2*s;
    
    a1 = c+rhoba*s;
    a2 = s/wd;
    
    d = -2.0*f*(rho*beta)/(k*(1-beta^2)^2+(2*rho*beta)^2);
    e = f*(1-beta^2)/(k*(1-beta^2)^2+(2*rho*beta)^2);
    
    u(i) = a1*u(1)+a2*udot(1)-d*(c+wba*s/wd)-e*w*s/wd;
    v(i) = d*(cos(w*t(i)))+e*sin(w*t(i));
    x(i) = u(i)+v(i);
end

%% Plot
figure(1);  set(figure(1), 'Position', [200   100   883   400])
            hold on; grid on; box on;

            plot(t,x,'-k','LineWidth',2);

            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
            xlabel('Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel('Displacement (m)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
print('EX_3_12','-dpng')

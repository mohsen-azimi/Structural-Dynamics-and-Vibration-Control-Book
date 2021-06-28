%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 5-5: Wilson-theta Method, Earthquake Loading
    
clc; clear; close all;
%% parameters
ma = 1;
k  = 90.829;
wn = sqrt(k/ma);
tn = 6.283/wn;
theta = 1.42;
r = 0.02;
c = 2.0*r*sqrt(k*ma);
u(1) = 0;
v(1) = 0;
tt = 31.18;
n  = 1559;
n1 = n+1;
dt = tt/n;

EQ = load('Elcentro.txt');

for i = 1:n1
    ug(i) = EQ(i,2);
    p(i)  = -ug(i)*9.81;
end

an(1) = (p(1)-c*v(1)-k*u(1))/ma;
kh = k+3.0*c/(theta*dt)+6.0*ma/(theta*dt)^2;
a = 6.0*ma/(theta*dt)+3.0*c;
b = 3.0*ma+theta*dt*c/2.0;

for i = 1:n1
    s(i)=(i-1)*dt;
end

for i = 2:n1
ww = (p(i)-p(i-1))*theta+a*v(i-1)+b*an(i-1);
xx = ww/kh;
zz = (6.0*xx/((theta*dt)^2)-6.0*v(i-1)/(theta*dt)-3.0*an(i-1))/theta;
yy = dt*an(i-1)+dt*zz/2.0;
v(i) = v(i-1)+yy;
an(i) = an(i-1)+zz;
vv = dt*v(i-1)+dt*dt*(3.0*an(i-1)+zz)/6.0;
u(i) = u(i-1)+vv;
end

% Total Acceleration
for i=1:n1
    an(i)=an(i)+ug(i)*9.81;
end


%% Plot
figure(1); set(figure(1), 'Position', [100   100   1100   600])

subplot(2,2,1); grid on; box on; hold on
    plot(s,u,'LineWidth',1,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14) 
    ylabel('Displacement [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')


subplot(2,2,2); grid on; box on; hold on
    plot(s,v,'LineWidth',1,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14) 
    ylabel('Velocity [m/s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

    
subplot(2,2,3); grid on; box on; hold on
    plot(s,an,'LineWidth',1,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14) 
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Acceleration [m/s^2]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    
    
subplot(2,2,4); grid on; box on; hold on
    plot(s,ug,'LineWidth',1,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14) 
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Ground acceleration [g]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    
    
%% Print 
print('EX_5_8','-dpng')

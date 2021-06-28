%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 5-1: Response of SDOF Using Wilson Recurrent Formula
   ... (Newmark)
clc; clear; close all;

%% Parameters
m  = 45412.8;
k  = 40913000;
wn = sqrt(k/m);
r  = 0.05;
u(1) = 0;
v(1) = 0;
tt = 0.50;
n  = 100;
n1 = n+1;
dt = tt/n;
td = 0.05;
jk = td/dt;

p = zeros(n1,1);

t = -dt;

%% External Load
for m = 1:jk+1
    t = t+dt;
    p(m) = 445500*(td-t)/td;
end

wd = wn*sqrt(1-r^2);
a  = exp(-r*wn*dt)*(r*sin(wd*dt)/sqrt(1-r^2)+cos(wd*dt));
b  = exp(-r*wn*dt)*(sin(wd*dt))/wd;
c2 = ((1-2*r^2)/(wd*dt)-r/sqrt(1-r^2))*sin(wd*dt)-(1+2*r/(wn*dt))*cos(wd*dt);
c  = (1/k)*(2*r/(wn*dt)+exp(-r*wn*dt)*(c2));
d2 = exp(-r*wn*dt)*((2.0*r^2-1)/(wd*dt)*sin(wd.*dt)+2.0*r/(wn*dt)*cos(wd*dt));
d  = (1/k)*(1-2.0*r/(wn*dt)+d2);
ad = -exp(-r*wn*dt)*wn*sin(wd*dt)/(sqrt(1-r^2));
bd = exp(-r*wn*dt)*(cos(wd*dt)-r*sin(wd*dt)/sqrt(1-r^2));
c1 = exp(-r*wn*dt)*((wn/sqrt(1-r^2)+r/(dt*sqrt(1-r^2)))*sin(wd*dt)+cos(wd*dt)/dt);
cd = (1/k)*(-1/dt+c1);
d1 = exp(-r*wn*dt)*(r*sin(wd*dt)/sqrt(1-r^2)+cos(wd*dt));
dd = (1/(k*dt))*(1-d1);

for m = 2:n1
    u(m) = a*u(m-1)+b*v(m-1)+c*p(m-1)+d*p(m);
    v(m) = ad*u(m-1)+bd*v(m-1)+cd*p(m-1)+dd*p(m);
end

for m=1:n1
    s(m)=(m-1)*dt;
end

%% Plot
figure(1); set(figure(1), 'Position', [100   100   800   600]);     hold on; grid on; box on;

subplot(2,1,1); hold on; grid on; box on    
    plot(s,u,'LineStyle','-','LineWidth',2,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    ylabel('Displacement [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

subplot(2,1,2); hold on; grid on; box on    
    plot(s,v,'LineStyle','-','LineWidth',2,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Velocity [m/s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
print('EX_5_1','-dpng')

%% Make Subplots Bigger
SF = 0.1;
a = 2; b = 1;
......................................................
for i = 1:a*b
    h = subplot(a,b,i); % Get handle to subplot #i.
%     if i ~= 1; set(h,'YTickLabel',[]); end

    pos1 = get(h, 'Position');
    pos2 = [pos1(1)-SF/2*pos1(1),  pos1(2)-SF/2*pos1(2),   pos1(3)*(1+SF),   pos1(4)*(1+SF)];
    
    set(h, 'Position', pos2);
end


% %% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 5-2: Response of SDOF Using Central Differece Method
   ... (Newmark)
clc; clear; close all;
%% Parameters
ma = 26065;
k  = 2369904.0;
wn = sqrt(k/ma);
r  = 0.02;
c  = 2.0*r*sqrt(k*ma);
u(1) = 0;
v(1) = 0;
tt = 5;
n  = 100;
n1 = n+1;
dt = tt/n;
td = 0.9;
jk = td/dt;
%% Loading
p = zeros(n1,1);

t = -dt;
for m = 1:8
    t = t+dt;
    p(m) = 20000;
end
p(9) = 16000.0;

for m = 10:12
    t = t+dt;
    p(m) = 12000.0;
end

for m=13:19
    t = t+dt;
    p(m) = 12000.0*(1-(t-0.6)/.3);
end
%%
an(1)=(p(1)-c*v(1)-k*u(1))/ma;
up = u(1)-dt*v(1)+dt*dt*an(1)/2;
kh = ma/(dt*dt)+c/(2.0*dt);
a  = ma/(dt*dt)-c/(2.0*dt);
b  = k-2.0*ma/(dt*dt);
f(1) = p(1)-a*up-b*u(1);
u(2) = f(1)/kh;

for m = 2:n1
    f(m) = p(m)-a*u(m-1)-b*u(m);
    u(m+1) = f(m)/kh;
end
v(1)=(u(2)-up)/(2.0*dt);

for m = 2:n1
    v(m) = (u(m+1)-u(m-1))/(2.0*dt);
    an(m)= (u(m+1)-2.0*u(m)+u(m-1))/(dt*dt);
end

n1p=n1+1;

for m = 1:n1p
    s(m) = (m-1)*dt;
end

for m = 1:n1
    x(m) = (m-1)*dt;
end

%% Plot
figure(1); set(figure(1), 'Position', [100   100   800   700]);     hold on; grid on; box on;

subplot(3,1,1);    
    plot(s,u,'LineStyle','-','LineWidth',2,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    ylabel('Displacement [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    xlim([0 5])

subplot(3,1,2);    
    plot(x,v,'LineStyle','-','LineWidth',2,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    ylabel('Velocity [m/s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

subplot(3,1,3);    
    plot(x,an,'LineStyle','-','LineWidth',2,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14) 
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Acceleration [m/{s^2}]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Print
print('EX_5_2','-dpng')

%% Make Subplots Bigger
SF = 0.1;
a = 3; b = 1;
......................................................
for i = 1:a*b
    h = subplot(a,b,i); % Get handle to subplot #i.
%     if i ~= 1; set(h,'YTickLabel',[]); end

    pos1 = get(h, 'Position');
    pos2 = [pos1(1)-SF/2*pos1(1),  pos1(2)-SF/2*pos1(2),   pos1(3)*(1+SF),   pos1(4)*(1+SF)];
    
    set(h, 'Position', pos2);
end



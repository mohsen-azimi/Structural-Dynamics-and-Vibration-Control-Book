%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 5-5: Wilson’s general Method
    
clc; clear; close all;

%% Parameters
ma = 0.065;
k  = 7.738;
wn = sqrt(k/ma);
r  = 0.07;
wd = wn*sqrt(1-r^2);
c = 2.0*r*sqrt(k*ma);
wnb = wn*r;
rb = r/sqrt(1-r^2);
tt = 3.0;
n = 300;
n1 = n+1;
dt = tt/n;
td = .75;
jk = td/dt;
a0 = 2.0*r/(wn*dt);
a1 = 1+a0;
a2 = -1/dt;
a3 = -rb*a1-a2/wd;
a4 = -a1;
a5 = -a0;
a6 = -a2;
a7 = -rb*a5-a6/wd;
a8 = -a5;
a9 = wd^2-wn^2;
a10 = 2.0*wnb*wd;
u(1) = 0;
v(1) = 0;
%% Load
for m = 1:n1
    pa(n) = 0.0;
    p(m) = 0.0;
end

jk1=jk+1;

for n=1:jk1
    t = (n-1)*dt;
    pa(n) = 10.0*(1-t/td)*exp(-2.0*t/td);
    p(n) = pa(n)/ma;
end

s = exp(-r*wn*dt)*sin(wd*dt);
c = exp(-r*wn*dt)*cos(wd*dt);
sd = -wnb*s+wd*c;
cd = -wnb*c-wd*s;
sdd = -a9*s-a10*c;
cdd = -a9*c+a10*s;
ca1 = c+rb*s;
ca2 = s/wd;
ca3 = (a1+a2*dt+a3*s+a4*c)/(wn^2);
ca4 = (a5+a6*dt+a7*s+a8*c)/(wn^2);
ca5 = cd+rb*sd;
ca6 = sd/wd;
ca7 = (a2+a3*sd+a4*cd)/(wn^2);
ca8 = (a6+a7*sd+a8*cd)/(wn^2);
ca9 = cdd+rb*sdd;
ca10 = sdd/wd;
ca11 = (a3*sdd+a4*cdd)/(wn^2);
ca12 = (a7*sdd+a8*cdd)/(wn^2);
an(1)= (p(1)-2.0*r*wn*v(1)-(wn^2)*u(1));

for i = 1:n1
    ti(i) = (i-1)*dt;
end

for i = 2:n1
    u(i) = ca1*u(i-1)+ca2*v(i-1)+ca3*p(i-1)+ca4*p(i);
    v(i) = ca5*u(i-1)+ca6*v(i-1)+ca7*p(i-1)+ca8*p(i);
    an(i) = an(i-1)+ca9*u(i-1)+ca10*v(i-1)+ca11*p(i-1)+ca12*p(i);
end


%% Plot
figure(1); set(figure(1), 'Position', [100   100   900   600])

subplot(2,2,1); grid on; box on; hold on
    plot(ti,u,'LineWidth',2,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14) 
    ylabel('Displacement [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')


subplot(2,2,2); grid on; box on; hold on
    plot(ti,v,'LineWidth',2,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14) 
    ylabel('Velocity [m/s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

    
subplot(2,2,3); grid on; box on; hold on
    plot(ti,an,'LineWidth',2,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14) 
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Acceleration [m/s^2]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    
    
subplot(2,2,4); grid on; box on; hold on
    plot(ti,p,'LineWidth',2,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14) 
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Excitation Force [N]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
 
%% Print
print('EX_5_9','-dpng')
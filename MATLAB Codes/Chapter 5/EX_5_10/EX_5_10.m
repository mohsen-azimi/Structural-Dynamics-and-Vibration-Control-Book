%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 5-10: Nonlinear Response of SDOF Using Elasto-Plastic Hysteresis
   ... (Newmark)
clc; clear; close all;

%% Parameters
k = 1897251;   % N/m
m = 43848;     % kg
c = 34605.4;   % Ns/m


%         [elasto-plastic,  elastic]
for  Rm = [66825.6,        6682500.6]  % N
 
    if Rm == 66825.6
        Legend = 'Elasto-Plastic';LineStyle = '-.';
    else
        Legend = 'Elastic'; LineStyle = '-';
    end
    
tend = 6.0;
h = 0.001;
nfor = 1500;


loading = xlsread('Force.xlsx');
% data = load('force.txt');
% p = interp1(data(:,1), data(:,2), [0:h:tend]');

%%
for i=1:nfor
     tt(i)=loading(i,1);
     ft(i)=loading(i,2);
end

ic=1;

for t=0:h:tend
    for i=1:nfor-1
        if (t >= tt(i)) && (t < tt(i+1))
            p(ic)=ft(i)+(ft(i+1)-ft(i))*(t-tt(i))/(tt(i+1)-tt(i));
            ic=ic+1;
            continue
        end
        continue
    end
end

x(1) = 0;
x1(1)= 0;
x2(1)= p(1)/m;
xel  = Rm/k;
xlim = xel;
xmin = -xel;
a1 = 3/h;
a2 = 6/h;
a3 = h/2;
a4 = 6/(h^2);
kelas = k+a4*m+a1*c;
kplas = a4*m+a1*c;
ic = 2;
loop = 1;

for t = h:h:tend-30*h
    if loop == 1
        [x,x1] = Respond(kelas,p,x,x1,x2,m,c,ic,a2,a3,a1);
        r = -Rm-(xmin-x(ic))*k;
        x2(ic) = (p(ic)-c*x1(ic)-r)/m;
        if x(ic) >= xlim
            loop = 2;
        end
        ic = ic+1;
        continue
    elseif(loop==2)
        loop;
        [x,x1]=Respond(kplas,p,x,x1,x2,m,c,ic,a2,a3,a1);
        r = Rm;
        x2(ic) = (p(ic)-c*x1(ic)-r)/m;
        if x1(ic)<=0
            loop=3;
            xmax = x(ic);
            xlim = x(ic)-2*xel;
        end
        ic = ic+1;
        continue
    elseif(loop==3)
        loop;
        [x,x1] = Respond(kelas,p,x,x1,x2,m,c,ic,a2,a3,a1);
        r = Rm-(xmax-x(ic))*k;
        x2(ic) = (p(ic)-c*x1(ic)-r)/m;
        if x(ic)<=xlim
            loop = 4;
        end
        ic = ic+1;
        continue
    elseif(loop==4)
        loop;
        [x,x1]=Respond(kplas,p,x,x1,x2,m,c,ic,a2,a3,a1);
        r = -Rm;
        x2(ic)=(p(ic)-c*x1(ic)-r)/m;
        if x1(ic)>=0
            loop=1;
            xlim = x(ic)+2.0*xel;
            xmin = x(ic);
        end
        ic = ic+1;
        continue
    end
end

ic = ic-1;

for i=1:ic
    tx(i) = (i-1)*h;
    xx(i) = x(i);
end

%% Plot
figure(1); set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;

plot(tx,xx,'linestyle',LineStyle,'LineWidth',2,'Color',[0 0 0],'displayname',Legend)

    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Displacement [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')


end % Rm

legend('show','location','southwest')


%% Print
 print('EX_5-10','-dpng')

%% Functions
function [x,x1] = Respond(k,p,x,x1,x2,m,c,ic,a2,a3,a1)
         dps = p(ic)-p(ic-1)+x1(ic-1)*(a2*m+3*c)+x2(ic-1)*(3*m+a3*c);
         dx = dps/k;
         dx1 = a1*dx-3*x1(ic-1)-a3*x2(ic-1);
         x(ic) = x(ic-1)+dx;
         x1(ic) = x1(ic-1)+dx1;
end


 
 
 
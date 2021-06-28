%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 4-2: Response of An Undamped SDOF undel Triangular Dynamic Load

clear; close all; clc
%%
styles = {'-';'--'; ':';'-.';'-'};
ii = 0;
for r = [0.25 0.5 0.75 1 1.25]
    ii = ii+1;
T  = 1.0;
w_n  = 2*pi/T;
td = T*r;
p0 = 1;
k  = 1;
%
n  = 1000;
t  = linspace(0,3,n);
%%   

    for i=1:n
        if t(i) <= td
            u(i)=(p0/k) * (sin(w_n*t(i))/(w_n*td) - cos(w_n*t(i))-t(i)/td + 1);
            udot(i)=(p0*w_n/k) * (cos(w_n*t(i))/(w_n*td) + sin(w_n*t(i))-1/(w_n*t(i)));
            
            u_td = u(i);
            udot_td = udot(i);
        else
            
            u(i) = udot_td/w_n  *sin(w_n*(t(i)-td)) + u_td*cos(w_n*(t(i) - td));
        end
    end

figure(1)
set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;

    
    plot(t,u,'LineWidth',1.5,'Color',[0 0 0],'linestyle',styles{ii},'displayname',['t_d/T_n = ',num2str(r,'%1.2f')]);


    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
     xlabel('t/T_n', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
     ylabel('Response ratio', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
     ylim([-2 2])
     
     legend('show','location','south','NumColumns',5)
end


%% Print
print('EX_4_2','-dpng')

clear; close all; clc
%%
styles = {'-';'--'; ':';'-.';'-'};
ii = 0;
for r = [1/8, 1/4, 1/2, 1, 1.5, 2, 2.5, 3]
    ii = ii+1;
Tn  = 1.0;
wn  = 2*pi/Tn;
td = Tn*r;
w = pi/td;
p0 = 1;
k  = 1;
beta = w/wn;
%
n  = 1000;
t  = linspace(0,2*td,n);
%%   

    for i=1:n
        if t(i) <= td
            
           u(i) = (p0/(k*(1-beta^2))) ...
                * (sin(pi*t(i)/td) - beta*sin(2*pi*t(i)/td));
        udot(i) = (p0/(k*(1-beta^2)))...
                * (  pi/td*cos(pi*t(i)/td) - (beta*2*pi/td)*cos(2*pi*t(i)/td)  );
            
            u_td = u(i);
            udot_td = udot(i);
        else
            u(i) = u_td *  cos(  wn*(t(i)-td)  )  + udot_td/wn * sin(  wn*(t(i)-td)  )  ;
        end
    end

figure(1)
set(figure(1), 'Position', [100   100   800   600])
subplot(4,2,ii); grid on; hold on; box on

    
    plot(t,u,'LineWidth',1.5,'Color',[0 0 0],'linestyle','-','displayname',['t_d/T_n = ',num2str(r,'%1.2f')]);
clear u

    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
%      xlabel('t/T_n', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
%      ylabel('Response ratio', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
     
     legend('show','location','south','NumColumns',5)
end
%%


%%

print('EX_4_1_b','-dpng')

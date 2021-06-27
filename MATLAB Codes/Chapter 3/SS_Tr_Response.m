clear; close all; clc
%%
A = 0.0042;
B = 0.015;

wn = 27.89;
w = 10;
beta = w/wn;

u_static = 100/3500;

t = 0:0.01:2;


u_SS = A*sin(wn*t) + B*cos(wn*t);
u_Tr = u_static*sin(w*t)/(1-beta^2);
u_total = u_SS + u_Tr;





%% Plot
figure(1)
    set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;

plot(t,u_SS,'--k','LineWidth',2,'displayname','Free vibration');
plot(t,u_total,'-k','LineWidth',2, 'displayname','Total response');


legend('show')
set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
xlabel('Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
ylabel('Displacement (m)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')






print('SS_TR_Reponse','-dpng')



%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Fig. 4-2: Response of An SDOF to Rectangular Impact Load

clear; close all; clc
%%
ii = 0;
for r = [1/8, 1/4, 1/2, 1, 1.25, 1.5, 1.75, 2]
    ii = ii+1;
T  = 1.0;
w  = 2*pi/T;
td = T*r;
p0 = 1;
k  = 1;
%
n  = 1000;
t  = linspace(0,2*td,n);
%%  Calculate and Plot The Response
    for i=1:n
        if t(i) <= td
            v(i)=(p0/k)*(1-cos(w*t(i)));
        else
            arg1=(1-cos(w*td))*cos(w*(t(i)-td));
            arg2=sin(w*td)*sin(w*(t(i)-td));
            v(i) = (p0/k)*(arg1+arg2);
        end
    end
................................................
figure(1); set(figure(1), 'Position', [100   100   800   750])
        subplot(4,2,ii); grid on; hold on; box on

            plot(t,v,'LineWidth',2,'Color',[0 0 0]);
            line([0 r r],[1 1 0],'LineWidth',2,'linestyle','--','Color',[0 0 0]);
            line([0 2*td],[0 0],'LineWidth',1,'linestyle','-','Color',[0 0 0]);

            ylim([-2.1 2.1])
            X=xlim; Y=ylim;
            text(X(2)/2,1*Y(1)/1.5,['t_d/T = ',num2str(r,'%1.3f')],...
                'HorizontalAlignment','center','fontsize',12,...
                'fontname','Times New Roman','FontWeight','Bold',...
                'EdgeColor','k','BackgroundColor','w','LineWidth',1)

set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',12)               
end
%% Labels
for subp = 7:8
    subplot(4,2,subp)
    xlabel('t/T_n', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
end

for subp = 1:2:8
        subplot(4,2,subp)

    ylabel('u(t)/(u_{st})_0', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
end


%% Print
print('FIG_4_2','-dpng')

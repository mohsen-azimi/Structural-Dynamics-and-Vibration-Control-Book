%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 4-1: Response of An SDOF to Rectangular Impact Load

clear; close all; clc
%%
ii = 0;
for r = [0.25, 0.5, 1, 2]
    ii = ii+1;
T  = 1.0;
w  = 2*pi/T;
td = T*r;
p0 = 1;
k  = 1;
%
n  = 1000;
t  = linspace(0,5*T,n);
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
figure(1); set(figure(1), 'Position', [100   100   800   600])
   
    subplot(2,2,ii); grid on; hold on; box on

    plot(t,v,'LineWidth',2,'Color',[0 0 0]);

    axis([0 5.1 -2.5 2.5]);

    X=xlim; Y=ylim;
    text(X(2)/2,Y(1)/1.3,['t_d/T = ',num2str(r,'%1.2f')],...
        'HorizontalAlignment','center','fontsize',16,...
        'fontname','Times New Roman','FontWeight','Bold',...
        'EdgeColor','k','BackgroundColor','w','LineWidth',1)

set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
end

%% Labels
for subp = 3:4
    subplot(2,2,subp)
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
end

for subp = 1:2:4
        subplot(2,2,subp)

    ylabel('Displ. or Amp.', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
end

%% Print
print('EX_4_1','-dpng')

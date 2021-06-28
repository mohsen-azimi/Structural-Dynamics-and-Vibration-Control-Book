%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 4-3: Response of An SDOF Beam to Triangular Impact Load

clear; close all; clc
%% Solver
tspan  = linspace(0,1,10000);
[t, v] = ode45(@f_DLSDOFP, tspan, [0 0]', []);

%% Calculate and Plot The Response
figure(1); 
    set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;
    plot(t,v(:,1),'-k','LineWidth',2);

    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
    xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    ylabel('Displacement [in]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%% Display Max. Value of Displacement Response
    X=xlim; Y=ylim;
    text(X(2)/2,Y(2)/1.3,['Max. value = ',num2str(max(v(:,1)),'%1.2f')],...
        'HorizontalAlignment','center','fontsize',16,...
        'fontname','Times New Roman','FontWeight','Bold',...
        'EdgeColor','k','BackgroundColor','w','LineWidth',1)


%% Print
print('EX_4_3','-dpng')

%% Functions
function v = f_DLSDOFP(t, v)
    % define the forcing function
    m=0.0124;
    if t<=0.1
      P=(-384*t+38.4)/m;
    else
      P=0;
    end
    omega=159.3;
    
    v= [v(2); -omega*omega*v(1)+P];
end
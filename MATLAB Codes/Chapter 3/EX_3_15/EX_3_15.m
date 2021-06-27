%% Example 3-15: Plot response modification factor, transmisibility, and machine with imbalance

clear; close all; clc
%% Select and calculate y-axis function
yAxis   = menu('Select the y axis','MF','MX/me','TR');
yLabels = {'MF', 'MX/me', 'TR'};

for i = 1:6
    zeta  = i*0.2;
    z(i) = zeta;
    for j=1:61
        x(j)=(j-1)*0.1;
        
        % select y according to:
        switch yAxis     
            case 1      % 1- for harmonic force
              y(j,i)=1/(sqrt((1-x(j)^2)^2+(2*zeta*x(j))^2)); 
          
            case 2      % 2- when the machine running with imbalance mass with speed omega
              y(j,i)=x(j)^2/(sqrt((1-x(j)^2)^2+(2*zeta*x(j))^2));
          
            case 3      % 3- Transmissibility
              y(j,i)=sqrt(1+(2.0*zeta*x(j))^2)/(sqrt((1-x(j)^2)^2+(2*zeta*x(j))^2));
          
        end
    end
    
end

%%

figure(1);  set(figure(1), 'Position', [200   200   883   300])
            subplot(1,2,1)

            plot1 = plot(x,y(:,1),x,y(:,2),x,y(:,3),x,y(:,4),x,y(:,5),x,y(:,6));
            LineType = {'-';'--';'-.';':';'-';'--';'-.';':'};

            for i = 1:6
            set(plot1(i),'LineStyle',LineType{i}, 'LineWidth',i/3, 'DisplayName',['\zeta = ',num2str(0.2*i,'%1.2f')],'Color',[0 0 0]);
            end

            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
            xlabel('\beta', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel(yLabels{yAxis}, 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
            legend('show')


........................................................
figure(1);  subplot(1,2,2); hold on; grid on; box on;

            mesh(z,x,y,'edgecolor','k'); zlim([0 2.8])
            
            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
            xlabel('\zeta', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel('\beta', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
            zlabel(yLabels{yAxis}, 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
            view(-45,45)
            % Print            
print('EX_3_15','-dpng')

%%
figure(2)
set(figure(2), 'Position', [200   100   883   400])
    hold on; grid on; box on;

plot1 = plot(x,y(:,1),x,y(:,2),x,y(:,3),x,y(:,4),x,y(:,5),x,y(:,6));
    LineType = {'-';'--';'-.';':';'-';'--';'-.';':'};

for i = 1:6
set(plot1(i),'LineStyle',LineType{i}, 'LineWidth',i/3, 'DisplayName',['\zeta = ',num2str(0.2*i,'%1.2f')],'Color',[0 0 0]);
end


set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
xlabel('\beta', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
ylabel(yLabels{yAxis}, 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')


legend('show')






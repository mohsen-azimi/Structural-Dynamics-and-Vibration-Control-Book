%% Example 6-24: Frequency response of a damped 2DOF system under harmonic load

clear; close all; clc
%%
f  = linspace(0,0.7,50);    % Frequency vector
m  = [1 0;0 2];             % Mass matrix
k  = [2 -1;-1 1];           % Stiffness matrix
c  = [0.002 -0.001;-0.001 0.001]; % Damping matrix
fi = [1;1];                 % Excitation force

%% Calculate the amplitude and the phase for each frequency defined by the frequency vector
for i = 1:50
    omega(i)  = 2*pi*f(i);          % Omega in terms of frequency
    omega2(i) = omega(i)*omega(i);  % Squaring omega
    a11 = -omega2(i)*m+k;           % Representing the left hand…
    a12 = omega(i)*c;               % Matrix of the single matrix…
    a21 = -omega(i)*c;              % Equation
    a22 = -omega2(i)*m+k;
    a = [a11 a12;a21 a22];
    b = inv(a);
    c1 = [0;0;fi];
    d(1,i) = b(1,:)*c1;
    d(2,i) = b(2,:)*c1;
    d(3,i) = b(3,:)*c1;
    d(4,i) = b(4,:)*c1;
    x(1,i) = sqrt(abs(d(1,i))^2+abs(d(3,i))^2);
    x(2,i) = sqrt(abs(d(2,i))^2+abs(d(4,i))^2);
    p(1,i) = atan(d(1,i)/d(3,i))*180/pi;
    if p(1,i)<0                     % Whether the angle is negative or not.
        p(1,i) = 180+p(1,i);
    else
        p(1,i) = p(1,i);
    end
    p(2,i) = atan(d(2,i)/d(4,i))*180/pi;
    if p(2,i)<0
        if d(4,i)<0
            p(2,i)  =  -180 + p(2,i);
        else
            p(2,i) = 180+p(2,i);
        end
    else
        p(2,i) = p(2,i);
    end
end

%% Plot
for i  =  1:2
    figure(1)
    set(figure(1), 'Position', [100   100   1200   600])
    subplot(2,2,i); hold on; grid on; box on;
    plot(f,x(i,:),'LineWidth',2,'Color',[0 0 0]);
    title(['Mass ',num2str(i)],'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
    
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)

    if i==1
        ylabel(['Amplitude'],'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
    end
    subplot(2,2,i+2); hold on; grid on; box on;
    plot(f,p(i,:),'LineWidth',2,'Color',[0 0 0]);
    
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)
    xlabel('Frequency','fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
    if i==1
        ylabel(['Phase'],'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
    end
    
end

%% Save
print('EX_6_18','-dpng')


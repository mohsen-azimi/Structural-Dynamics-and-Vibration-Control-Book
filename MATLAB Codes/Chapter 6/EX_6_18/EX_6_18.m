%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-18: Frequency Response of a Two-DOF System 
    
clc; clear; close all;
%% Parameters
f  = linspace(0,0.7,50);
m  = [1 0;0 2];
k  = [2 -1;-1 1];
c  = [0.002 -0.001;-0.001 0.001];
fi = [1;1];
%% Amplitude &  Phase for Each Frequency

for i = 1:50
    w(i)  = 2*pi*f(i);   % Omega (Frequency)
    a11 = -(w(i))^2*m+k; % The left hand…
    a12 = w(i)*c;        % The Single Matrix
    a21 = -w(i)*c;       % The Equation
    a22 = -(w(i))^2*m+k; 
    
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
    
    if p(1,i)<0          % Whether The Angle is Negative or Not.
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
    figure(1);  set(figure(1), 'Position', [100   100   1200   600])
    
    subplot(2,2,i); hold on; grid on; box on;
    plot(f,x(i,:),'LineWidth',2,'Color',[0 0 0]);
    title(['Mass ',num2str(i)],'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)
    if i==1
       ylabel(['Amplitude'],'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    end
    
    subplot(2,2,i+2); hold on; grid on; box on;
    plot(f,p(i,:),'LineWidth',2,'Color',[0 0 0]);
    set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)
    xlabel('Frequency','fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    if i==1
       ylabel(['Phase'],'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
    end
    
end

%% Print
print('EX_6_18','-dpng')

%% Make Subplots Bigger
SF = 0.15;
a = 2; b = 2;
......................................................
for i = 1:a*b
    h = subplot(a,b,i); % Get handle to subplot #i.
%     if i ~= 1; set(h,'YTickLabel',[]); end
      
    pos1 = get(h, 'Position');
    pos2 = [pos1(1)-SF/2*pos1(1),  pos1(2),   pos1(3)*(1+SF),   pos1(4)];
    
    set(h, 'Position', pos2);
end



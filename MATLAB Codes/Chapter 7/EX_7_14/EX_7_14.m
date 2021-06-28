%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 7-14: Response of a 3-story frame, Free Vibration
    
clc; clear; close all;
%% Parameters

digits(5)                 % Precision

m = [40000 0        0;    % Mass Matrix
     0     20000    0;
     0     0    20000];  

[ms,ns] = size(m);


c = [0  0       0;        % Damping Matrix
     0 -8000 8000;
     0 -8000 8000];


k = [30000 -10000      0; % Stiffness Matrix
    -10000  20000 -10000;
     0     -10000  10000];

z = zeros(ms);
MT = [z m;
      m c];
KT = [-m z;
       z k];

[V,D] = eig(inv(MT)*(KT));

for i=1:2*ms
    DS(i)=D(i,i);
end


%%

x0 = [0;0;0;0;0.01;0.05]; % Initial State

% Constants of Integration
S  = inv(V)*x0;
tk = linspace(0,40,1001);

% Ttime-dependent Response (x1=y4; x2=y5; x3=y6)
for k=1:1001
    t=tk(k);
    for i=ms+1:2*ms
        x(k,i-ms)=0;
        for j=1:2*ms
            x(k,i-ms)=x(k,i-ms)+(real(S(j))*real(V(i,j))-...
                imag(S(j))*imag(V(i,j)))*cos(imag(D(j,j))*t);
            x(k,i-ms)=x(k,i-ms)+(imag(S(j))*real(V(i,j))-...
                real(S(j))*imag(V(i,j)))*sin(imag(V(j,j))*t);
            x(k,i-ms)=x(k,i-ms)*exp(-real(D(j,j))*t);
        end
    end
end
%% Plot
figure(1); set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;


plot1=plot(tk,x(:,1),tk,x(:,2),tk,x(:,3));
    set(plot1(1),'LineStyle','-.','LineWidth',2,'Color',[0 0 0]);
    set(plot1(2),'LineStyle',':','LineWidth',1.5,'Color',[0 0 0]);
    set(plot1(3),'LineStyle','-','LineWidth',2,'Color',[0 0 0]);
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel('Time [s]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('Displacement (m)', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

legend ('\itx_1','\itx_2','\itx_3')

%% Print
print('EX_7_14','-dpng')


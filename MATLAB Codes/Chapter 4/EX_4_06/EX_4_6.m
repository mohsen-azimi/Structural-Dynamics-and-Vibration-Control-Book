%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 4-8: Response of A Damped SDOF to Trapezoidic Impact Load 

clear; close all; clc
%%

m  = 25;    % Mass
c  = 30;    % Damping
k  = 6000;  % Stiffness
F0 = 300;   % Force amplitude
T  = 0.1;
wn = sqrt(k/m);         % Natural frequency
zeta = c/(2*sqrt(m*k)); % Damping factor
Ts = 0.001;             % Sampling period
N  = 301;               % Sampling times
wd=wn*sqrt(1-zeta^2);   % Damped frequency

%% Calculate and Plot the Response 
for n=1:N
    if n<=T/Ts+1; F(n)=F0; else F(n)=0; end %force
end
n = [1:N];
g = Ts*exp(-(n-1)*zeta*wn*Ts).*sin((n-1)*wd*Ts)/(m*wd);

% Discrete-time Impulse Response
c0= conv(F,g); % Convolution Sum
c = c0(1:N);   % Plot to N Samples
n = [0:N-1];
axes('position',[0.1 0.2 0.8 0.7])

figure(1); set(figure(1), 'Position', [200   100   883   400])
        hold on; grid on; box on;
        plot(n,c,'-k','LineWidth',2);

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',14)               
        xlabel('{\itn}', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('{\itx(n)}, [m]', 'fontsize',16, 'fontname','Times New Roman','FontWeight','Bold')

%%
print('EX_4_6','-dpng')

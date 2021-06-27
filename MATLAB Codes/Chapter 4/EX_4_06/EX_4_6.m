%% Example 4-6: Response of a damped SDOF under trapezoid dynamic load

clear; close all; clc
%%
m  = 15;        % mass
c  = 25;        % damping
k  = 5000;      % stiffness
F0 = 220;
T  = 0.2;
wn = sqrt(k/m); % Natural frequency
zeta = c/(2*sqrt(m*k));
Ts = 0.003;     % Sampling period
N  = 201;       % sampling times
wd = wn*sqrt(1-zeta^2); % frequency
%% force
for n=1:N
    if n<=(T/2)/Ts+1;F(n)=2*F0*(n-1)*Ts/T; else; F(n)=F0; end
    if n>(3*T/2)/Ts+1;F(n)=2*F0*(2-(n-1)*Ts/T); end
    if n>2*T/Ts+1;F(n)=0; end
end

%%
n=[1:N];
g=Ts*exp(-(n-1)*zeta*wn*Ts).*sin((n-1)*wd*Ts)/(m*wd);

% discrete-time impulse response
c0 = conv(F,g); % Convolution sum
c  = c0(1:N);   % plot to N samples
n  = [0:N-1];

%% Plot
figure(1)
set(figure(1), 'Position', [200   100   883   400])
hold on; grid on; box on;
plot(n,c,'-k','LineWidth',2);

set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)
xlabel('\itn', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
ylabel('{\itx(n)}, [m]', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

%%
print('EX_4_6','-dpng')
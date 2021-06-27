%% Example 4-5: Response of a damped SDOF under rectangular dynamic/pulse loading

clear; close all; clc
%%

m  = 25;                % mass
c  = 30;                % damping
k  = 6000;              % stiffness
F0 = 300;               % Force amplitude
T  = 0.1;
wn = sqrt(k/m);         % Natural frequency
zeta = c/(2*sqrt(m*k)); % damping factor
Ts = 0.001;             % sampling period
N  = 301;               % sampling times
wd=wn*sqrt(1-zeta^2);   % damped frequency

%%
for n=1:N
    if n<=T/Ts+1; F(n)=F0; else F(n)=0; end %force
end
n = [1:N];
g = Ts*exp(-(n-1)*zeta*wn*Ts).*sin((n-1)*wd*Ts)/(m*wd);

% discrete-time impulse response
c0= conv(F,g);%convolution sum
c = c0(1:N);  % plot to N samples
n = [0:N-1];
axes('position',[0.1 0.2 0.8 0.7])

figure(1)
set(figure(1), 'Position', [200   100   883   400])
    hold on; grid on; box on;
    plot(n,c,'-k','LineWidth',2);

set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
xlabel('{\itn}', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
ylabel('{\itx(n)}, [m]', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')

%%
print('EX_4_5','-dpng')

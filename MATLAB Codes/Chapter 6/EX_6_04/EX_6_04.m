% Example 6-4: Two degrees of freedom undamped free vibration 

clear; close all; clc
%%
% mass matrix
m = [1 0;0 1];
% stiffness matrix
k = [5 -3;-3 5];
%give initial displacements and velocities
u = [1 0 0 0];
% calculate flexibility matrix
a = inv(k);
am = a * m;
% find eigen values and eigenvectors
[ev,evu]=eig(am);
% calculate frequencies and factors
for i=1:2
    omega(i) = sqrt(1/evu(i,i));
    mew(i) = ev(i,2)/ev(i,1);
end
% find b matrix
b = [0 1 0 1;omega(1) 0 omega(2) 0;0 mew(1) 0 mew(2);...
    omega(1)*mew(1) 0 omega(2)*mew(2) 0];
a = inv(b)*u';
for i = 1:401
    tt(i) = (i-1)*.02;
    t = tt(i);
    bb = [sin(omega(1)*t) cos(omega(1)*t) sin(omega(2)*t) cos(omega(2)*t);
        omega(1)*cos(omega(1)*t) -omega(1)*sin(omega(1)*t) omega(2)*cos(omega(2)*t) -omega(2)*sin(omega(2)*t);
        mew(1)*sin(omega(1)*t) mew(1)*cos(omega(1)*t) mew(2)*sin(omega(2)*t) mew(2)*cos(omega(2)*t);
        mew(1)*omega(1)*cos(omega(1)*t) -mew(1)*omega(1)*sin(omega(1)*t) mew(2)*omega(2)*cos(omega(2)*t) -omega(2)*mew(2)*sin(omega(2)*t)];
    c = bb*a;
    u(i) = c(1);
    v(i) = c(3);
end


%% Plot
figure(1)
set(figure(1), 'Position', [200   100   883   300])

    subplot(1,2,1)
      hold on; grid on; box on;
      plot(tt,u,'-k', 'LineWidth',2);
     
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        xlabel(' Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('Displacement (m)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        title('Response, 1^{st} Degree of Freedom', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')


    subplot(1,2,2)
      hold on; grid on; box on;
      plot(tt,v,'-k', 'LineWidth',2);
     
        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        xlabel(' Time (s)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('Displacement (m)', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
        title('Response, 2^{nd} Degree of Freedom', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')




%%
print('EX_6_4','-dpng')

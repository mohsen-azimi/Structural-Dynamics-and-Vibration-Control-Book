%% Example 6-12: Frequency response of an undamped 2DOF shear frame under harmonic load

clear; close all; clc
%%
m  = 20;            % mass
k  = 200;           % k=12EI/H3 stiffness
w0 = k/m;
M  = [m 0;0 m];     % mass matrix
K  = [2*k -k;
       -k  k];      % stiffness matrix

[u,W]  = eig(K,M);  % Eigenvalues
U(:,1) = u(:,1)/max(u(:,1));
U(:,2) = u(:,2)/max(u(:,2));
wn = sqrt(diag(W));% Natural frequency 1 & 2

w  = [0:0.002:8];
X2 = (w0^2)./((w.^2-wn(1)^2).*(w.^2-wn(2)^2));

%% Plot
figure(1)
set(figure(1), 'Position', [200   100   400   300])

      hold on; grid on; box on;
      plt = plot(w,X2);
      set(plt,'LineStyle','-', 'LineWidth',2,'Color',[0 0 0]);
      axis([0 8 -5 5])

        set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
        xlabel('\omega', 'fontsize',11, 'fontname','Times New Roman','FontWeight','Bold')
        ylabel('{\it{X}}_2(\omega)/{\it{Y}}_0', 'fontsize',11, 'fontname','Times New Roman','FontWeight','Bold')

        title('Frequency Response', 'fontsize',11, 'fontname','Times New Roman','FontWeight','Bold')

%% Save
print('EX_6_12','-dpng')

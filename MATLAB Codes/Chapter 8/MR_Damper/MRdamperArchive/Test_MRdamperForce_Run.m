%% Introduction:
   % this file only calls the f_MRdamperForce function
   % unit m, kN,...

%%
clc
clear;
close all;

myStructure.n = 1;                   % to keep codes consistent 
earthquake.dt = 0.00001;             % to keep codes consistent 
dt = earthquake.dt;
earthquake.t  = 0:dt:1;              % to keep codes consistent 
t = earthquake.t;                    % reference is always earthquake for time

n = myStructure.n;                  % # of DOFs

w = 10;                             % frequency of displacement and acceleration, is used to test the code

Z = zeros(2*n,max(size(t)));        % pre-allocation to: save time

MRdamper.F     = zeros(size(t));                 % pre-allocation to: save time + initial condition
MRdamper.zdot  = zeros(size(t));                 % pre-allocation to: save time + initial condition
MRdamper.z     = zeros(size(t));                 % pre-allocation to: save time + initial condition
MRdamper.ydot  = zeros(size(t));                 % pre-allocation to: save time + initial condition
MRdamper.y     = zeros(size(t));                 % pre-allocation to: save time + initial condition
MRdamper.xdot  = zeros(size(t));                 % pre-allocation to: save time + initial condition
MRdamper.x     = zeros(size(t));                 % pre-allocation to: save time + initial condition
MRdamper.i     = zeros(size(t));                 % pre-allocation to: save time + initial condition  => input current

MRdamper.alpha = zeros(size(t));                 % pre-allocation to: save time + initial condition  
MRdamper.c0    = zeros(size(t));                 % pre-allocation to: save time + initial condition  
MRdamper.c1    = zeros(size(t));                 % pre-allocation to: save time + initial condition  
MRdamper.i     = zeros(size(t));                 % pre-allocation to: save time + initial condition  



MRdamper.alpha(1)  = 963;    %N/cm     initial value
MRdamper.c0(1)     = 53;     %N.sec/cm     initial value
MRdamper.c1(1)     = 930;    %N.sec/cm    initial value

disp('ATTENTION, UNIT CHANGED HERE!')





for i=2:numel(t)
    Z(:,i) = [sin(9.43*t(i))+1/100
              0.0943*cos(9.43*t(i)) - 0.05*w*sin(w*t(i)).*sin(1*t(i))]; % "Z" is structural response in real simulations, Z=[x, xdot];

     MRdamper.i(i) = 10.0;  % MRdamper input current
    [MRdamper] = f_MRdamperForce(MRdamper,dt, n, i, Z(:,i));   % MR damper n=nDOF; i=iteration, Z=respons of structure
    
    clc
    i
    
 end   
%% Plot the Base-Isolation Force

figure (1); 
    subplot(2,2,1);
        plot(t(2500:end),MRdamper.F(2500:end));
        xlabel('t (s)');
        ylabel('F (kN)');

    subplot(2,2,2);
        plot(MRdamper.x(2500:end),MRdamper.F(2500:end));
        xlabel('x (m)');
        xlim([-1.5 1.5]);
        ylabel('F (kN)');


    subplot(2,2,3);
        plot(MRdamper.xdot(2500:end),MRdamper.F(2500:end));
        xlabel('xD (m/s)');
        xlim([-0.1 0.1]);
        ylabel('F (kN)');
        ylim([-500 500]);

% % 
% % subplot(2,1,1);
% %     plot(Z(1,1:i),F(1:i),'r','LineWidth',1)
% %     hold on
% % 
% %     plot(Z(1,i),F(i),'ob','MarkerFaceColor','b')
% %     hold off
% %     grid on
% %     title( ['Time:'  num2str(t(i)) '  (s)'],'FontWeight','bold');
% %  
% % subplot(2,1,2);
% %     plot(t(1,1:i),Z(1,1:i),'r','LineWidth',1)
% %     xlim([0 t(end)]);
% %     hold on
% % 
% %     plot(t(i),Z(1,i),'ob','MarkerFaceColor','b')
% %     hold off
% %     grid on
% % 
% % 
% % pause (0.000000000000001);
% % 
% %  % Save *.GIF
% %       filename = 'GIFBilinear.gif';     
% %       drawnow
% %       frame = getframe(1);
% %       im = frame2im(frame);
% %       [imind,cm] = rgb2ind(im,256);
% %           if i == 1;  
% %               imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
% %           elseif rem(i-1,10)==0; % To save once each #of time step not all of them
% %               imwrite(imind,cm,filename,'gif','WriteMode','append');
% %           end

    



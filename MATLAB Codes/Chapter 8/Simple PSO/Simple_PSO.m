% Provided by FaraDars
clc; clear; close all;
format
%% Problem Definition

global NFE;

CostFunction=@(x) f_myCost(x);      % Cost Function

nVar=5;                             % Number of Decision Variables

VarSize=[1 nVar];                   % Size of Decision Variables Matrix

VarMin=-10;                         % Lower Bound of Variables
VarMax= 10;                         % Upper Bound of Variables


%% PSO Parameters

MaxItr=100;      % Maximum Number of Iterations

nPop=10;        % Population Size (Swarm Size)

% % w=1;            % Inertia Weight
% % wdamp=0.99;     % Inertia Weight Damping Ratio
% % c1=2;           % Personal Learning Coefficient
% % c2=2;           % Global Learning Coefficient

% Constriction Coefficients (by kennedy's student, clerc (the author of the book))
phi1=2.05;   % phi1, phi2>0 ; phi [according to definition=] phi1+phi2>4 
phi2=2.05;   % the optimums are found as phi1=phi2=2.05
phi=phi1+phi2;
chi=2/(phi-2+sqrt(phi^2-4*phi));
w=chi;          % Inertia Weight
wdamp=1;        % Inertia Weight Damping Ratio
c1=chi*phi1;    % Personal Learning Coefficient
c2=chi*phi2;    % Global Learning Coefficient

% Velocity Limits
VelMax=0.1*(VarMax-VarMin);
VelMin=-VelMax;

%% Initialization

empty_particle.Position=[];
empty_particle.Cost=[];
empty_particle.Velocity=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];

particle=repmat(empty_particle,nPop,1);

GlobalBest.Cost=inf;

for i=1:nPop
    
    % Initialize Position
    particle(i).Position=unifrnd(VarMin,VarMax,VarSize);
    
    % Initialize Velocity
    particle(i).Velocity=zeros(VarSize);
    
    % Evaluation
    particle(i).Cost=CostFunction(particle(i).Position);
    
    % Update Personal Best
    particle(i).Best.Position=particle(i).Position;
    particle(i).Best.Cost=particle(i).Cost;
    
    % Update Global Best
    if particle(i).Best.Cost<GlobalBest.Cost
        
        GlobalBest=particle(i).Best;
        
    end
    
end

BestCost=zeros(MaxItr,1);

nfe=zeros(MaxItr,1);


%% PSO Main Loop

for Itr=1:MaxItr
    
    for i=1:nPop
        
        % Update Velocity
        particle(i).Velocity = w*particle(i).Velocity ...
            +c1*rand(VarSize).*(particle(i).Best.Position-particle(i).Position) ...
            +c2*rand(VarSize).*(GlobalBest.Position-particle(i).Position);
        
        % Apply Velocity Limits                     {v==>  v_min<v<v_max}
        particle(i).Velocity = min(max(particle(i).Velocity,VelMin),VelMax); 
        
        % Update Position
        particle(i).Position = particle(i).Position + particle(i).Velocity;
        
        % Velocity Mirror Effect                    (we mirror the velocity when it tends to a point outside of the bounds; bounces when it hits the wall!)
        IsOutside=(particle(i).Position<VarMin | particle(i).Position>VarMax); % Step1: Check if it is outside
        particle(i).Velocity(IsOutside)=-particle(i).Velocity(IsOutside);      % ???? (should I modify if when it not semetric about 0,0?!) Step2: mirror the position elements that fall outside
        
        % Apply Position Limits                      {x==>  x_min<x<x_max}
        particle(i).Position =min( max(particle(i).Position,VarMin),VarMax);
        
        % Evaluation
        particle(i).Cost = CostFunction(particle(i).Position);
        
        % Update Personal Best
        if particle(i).Cost<particle(i).Best.Cost
            
            particle(i).Best.Position=particle(i).Position;
            particle(i).Best.Cost=particle(i).Cost;
            
            % Update Global Best
            if particle(i).Best.Cost<GlobalBest.Cost
                
                GlobalBest=particle(i).Best;
                
            end
            
        end
        
    end
    
    BestCost(Itr)=GlobalBest.Cost;
    
    nfe(Itr)=NFE;
    
    disp(['Iteration ' num2str(Itr) ': NFE = ' num2str(nfe(Itr)) ', Best Cost = ' num2str(BestCost(Itr))]);
    
    w=w*wdamp;
    
end


%% Results
figure(1);  set(figure(1), 'Position', [200   100   883   400])
            hold on; grid on; box on;

            plot(nfe,BestCost,'-k', 'LineWidth',2); 

            set(gca, 'LineWidth',1, 'FontWeight','normal', 'FontName','Times New Roman', 'FontSize',10)               
            xlabel('NFE', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')
            ylabel('Best Cost', 'fontsize',12, 'fontname','Times New Roman','FontWeight','Bold')


%% Print
   print('Plot','-dpng')



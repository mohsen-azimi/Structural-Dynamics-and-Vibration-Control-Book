%% Structural Dynamics and Vibration Control(M. Azimi et al.)
%% Example 6-5: Two-DOF Undamped Suspension System  

clear; close all; clc
%% Input Parameters
prompt={'Vehicle weight (lb):',...
        'Mass moment of inertia (slugs-ft^2):',...
        'Stiffness (lb/ft):',...
        'Distance from rear springs to cg (ft)',...
        'Distance from front springs to cg (ft)'};
name='Parameters';
numlines=[1 50;1 50;1 50;1 50; 1 50];
defaultanswer={'5000','400','2500','3.4','4.6'};
options.Interpreter = 'tex';
params=inputdlg(prompt,name,numlines,defaultanswer,options);

W = str2double(params{1});
I = str2double(params{2});
k = str2double(params{3});
a = str2double(params{4});
b = str2double(params{5});

g = 32.2;
m = W/g;
M = [m, 0
     0, I]; % mass matrix

K=[2*k,     (b-a)*k
  (b-a)*k,  (b^2+a^2)*k]; % stiffness matrix

% eigenvalues and eigenvectors calculation
C = inv(M)*K;
[V,D] = eig(C);
w_1  = sqrt(D(1,1));
w_2  = sqrt(D(2,2));
X1    = [V(1,1);V(2,1)];
X2    = [V(1,2);V(2,2)];

% Output
disp(['Vehicle weight = ',num2str(W),' (lb)']);
disp(['moment of inertia = ',num2str(I),' (slugs-ft^2)']);
disp(['Stiffness = ',num2str(k), ' (lb/ft)']);
disp(['Distance from rear springs to cg = ',num2str(a), ' (ft)']);
disp(['Distance from front springs to cg ',num2str(b),' (ft)']);

disp('Mass-matrix');disp(M)
disp('Stiffness-matrix');disp(K)
disp('Natural frequencies in rad/s=');
disp(w_1)
disp(w_2)
disp('Mode shape vectors'); disp(X1)
disp(X2)

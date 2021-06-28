function f_loadMRdamper()
%% Parameters are borrowed from "Modeling and control of magnetorheological dampers for seismic response reduction"
 disp('Device:         Simple MR-Damper "Amini et al 2015 , 50kN" (N m kg)')
% doi:10.1088/0964-1726/24/10.05002

%% Global Variables
global earthquake MRdamper 

%% MRdamper Constant Parameters
MRdamper.Ref    = 'Amini et al 2015';
MRdamper.c0A    = 44;       % N.s/m
MRdamper.c0B    = 440;      % N.s/m . V

% MRdamper.c1A    = 8359.2;    % N.s/m
% MRdamper.c1B    = 7482.9;    % N.s/m .V

% MRdamper.k0     = 0.002;     % N.s/m
% MRdamper.k1     = 0.0097;    % N/m . V

MRdamper.alphaA = 1087200;      % N/m
MRdamper.alphaB = 4691600;      % N/m . V

MRdamper.gamma  = 300;       % m^-2
MRdamper.beta   = 300;       % m^-2 
MRdamper.A      = 1.2; 
MRdamper.n      = 1;
MRdamper.eta    = 50;       % s^-1
MRdamper.x0     = 0;         % m 



%% capacity
MRdamper.Vmax     = 5;              % volt 
MRdamper.Fmax     = 50*10^3;            % N 

%% other Pre-allocations
MRdamper.c0     = [MRdamper.c0A,    zeros(1,max(size(earthquake.t))-1)];               % Preallocations
% MRdamper.c1     = [MRdamper.c1A,    zeros(1,max(size(earthquake.t))-1)];               % Preallocations
MRdamper.alpha  = [MRdamper.alphaA, zeros(1,max(size(earthquake.t))-1)];               % Preallocations

MRdamper.dz     = zeros(1,max(size(earthquake.t)));                           % Preallocations
MRdamper.z      = zeros(1,max(size(earthquake.t)));                           % Preallocations

% MRdamper.dy     = zeros(1,max(size(earthquake.t)));                           % Preallocations
% MRdamper.y      = zeros(1,max(size(earthquake.t)));                           % Preallocations

% MRdamper.yd     = zeros(1,max(size(earthquake.t)));                           % Preallocations

MRdamper.F      = zeros(1,max(size(earthquake.t)));                           % Preallocations
MRdamper.V      = 5*ones(1,max(size(earthquake.t)));                          % Preallocations
MRdamper.u      = 1*ones(1,max(size(earthquake.t)));                          % Preallocations
             



end
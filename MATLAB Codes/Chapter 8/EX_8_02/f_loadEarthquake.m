%% Load Earthquake Data
% Command >> [EarthQuake] = f_LoadEarthQuake('ElCentro',g,dt)
% Source for elcentro: ...

function earthquake = f_loadEarthquake(EQ,g,dt,Tend)
           load('earthquakes7.mat');

                
                eqName = ['earthquakes.',EQ,'X'];
                eqX  = eval(eqName);
                Dt   = eqX.Dt;
                
                eqt  = [eqX.t ;    [eqX.t(end)+Dt:Dt:(Tend)]' ]; 
                acX  = [eqX.Accl ; zeros(length(eqt)-length(eqX.Accl),1)];
                PGAX = eqX.PGA ; 

                
                
                
                eqName = ['earthquakes.',EQ,'Y'];
                eqY    = eval(eqName);
                
                
                acY  = [eqY.Accl ; zeros(length(eqt)-length(eqY.Accl),1)];
                acY(size(eqt,1)+1:end)=[];
                PGAY = eqY.PGA ; 
                
         
                
                
                
                disp(['Earthquake:  ', EQ])
                disp(['Dt = '  num2str(Dt)]);
                disp(['dt = '  num2str(dt)]);
                
                
                
                
 %% Interpolation
t = [0:dt:Tend]';t(end)=[];

acclX = interp1(eqt, acX , t,'linear') ;
acclY = interp1(eqt, acY , t,'linear') ;



%% Save
earthquake.name     = EQ;
earthquake.t        = t;
earthquake.xddot_gX = acclX*g ;                    
earthquake.xddot_gY = acclY*g ;                    
earthquake.dt      = dt;
earthquake.Dt      = Dt;
earthquake.PGAX    = PGAX;
earthquake.PGAY    = PGAY;
earthquake.g       = g;               
                

%% save the direction with MaxPGA for 1-dir cases
if PGAX>PGAY
  earthquake.xddot_g = acclX*g ;                    
else
  earthquake.xddot_g = acclY*g ;                    
end
%%

                
                
                
                
                
   
end

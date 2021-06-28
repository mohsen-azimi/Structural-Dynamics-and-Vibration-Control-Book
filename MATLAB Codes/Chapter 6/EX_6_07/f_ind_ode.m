% Flags
function varargout = ind_ode(t,y,flag)
    switch flag
        case ''      % No input flag, calls FF
            varargout{1} = f_FF(t,y);
        case 'mass'  % Flag of mass, calls MM
            varargout{1} = f_MM(t,y);
        otherwise
            error(['unknown flag ''' flag '''.']);
    end
end

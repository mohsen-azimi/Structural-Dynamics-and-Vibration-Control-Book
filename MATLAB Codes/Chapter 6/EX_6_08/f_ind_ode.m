% Flags
function varargout = f_ind_ode(t, y, flag)
switch flag
    case '' % No Input, call f_Pend
        varargout{1}=f_Pend(t,y);
    case 'mass' % Call f_MM
        varargout{1}=f_MM(t,y);
    otherwise
        error(['unknown flag ''' flag '''.']);
end

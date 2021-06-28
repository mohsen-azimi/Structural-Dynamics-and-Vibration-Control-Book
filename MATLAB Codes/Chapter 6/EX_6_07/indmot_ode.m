function varargout=indmot_ode(t,y,flag)
switch flag
    case ''      % no input flag
        varargout{1} = FF(t,y);
    case 'mass'  % flag of mass calls mass.m
        varargout{1}= MM(t,y);
    otherwise
        error(['unknown flag ''' flag '''.']);
end
end
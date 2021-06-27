function v = f_DLSDOFP(t, v)

m = 0.0124;
    if t <= 0.1
        P = (-384*t+38.4)/m;
    else
        P = 0;
    end
omega = 159.3;

v= [v(2)
    -omega * omega * v(1) + P];